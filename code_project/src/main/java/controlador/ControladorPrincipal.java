/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.dao.UsuarioDAO;
import modelo.dto.Usuario;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author Acer
 */
@WebServlet(name = "ControladorPrincipal", urlPatterns = {"/controlador/ControladorPrincipal"})
public class ControladorPrincipal extends HttpServlet {

    private static final Logger logger = LoggerFactory.getLogger(ControladorPrincipal.class);

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorPrincipal</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorPrincipal at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("Ingresar".equals(accion)) {
            iniciarSesion(request, response);
        } else if ("Registrar".equals(accion)) {
            registrarUsuario(request, response);
        } else if ("Cerrar".equals(accion)) {
            cerrarSesion(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/indexx.jsp");

        }

    }

    private void iniciarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dni = request.getParameter("dni");
        String contraseña = request.getParameter("contrasena");

        String contraseñaEncriptada = encriptarContraseñaMD5(contraseña);

        // Validar credenciales con la base de datos usando UsuarioDAO
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuarioAutenticado = usuarioDAO.iniciarSesion(dni, contraseñaEncriptada);

        // Verificar si las credenciales son correctas
        if (usuarioAutenticado != null) {
            logger.info("Inicio de sesión exitoso para el usuario con DNI: {}", dni);

            // Si las credenciales son correctas, crear una sesión
            HttpSession session = request.getSession();
            session.setAttribute("usuarioAutenticado", usuarioAutenticado);

            if (usuarioAutenticado.getRol().equals("administrador")) {
                logger.info("Inicio de sesión exitoso para el usuario con DNI: {}", dni);

                response.sendRedirect(request.getContextPath() + "/vista/Admin.jsp");

            } else {

                response.sendRedirect(request.getContextPath() + "/index.jsp");  // Redirigir a la página de inicio

            }

        } else {
            logger.warn("Intento fallido de inicio de sesión para el DNI: {}", dni);

            request.setAttribute("error", "Datos incorrectos");

            // Si fallan las credenciales, redirigir a una página de error
            response.sendRedirect(request.getContextPath() + "/vista/errorInicioSesion.jsp");
        }
    }

    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String celular = request.getParameter("celular");
        String correo = request.getParameter("correo");
        String dni = request.getParameter("dni");
        String contraseña = request.getParameter("contrasena");
        String rol = request.getParameter("rol");

        String contraseñaEncriptada = encriptarContraseñaMD5(contraseña);

        // Crear el objeto Usuario con los datos del formulario
        Usuario nuevoUsuario = new Usuario(nombre, apellido, Integer.parseInt(celular), correo, Integer.parseInt(dni), contraseñaEncriptada, "usuario");
        // Usar el DAO para registrar el usuario
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        boolean registroExitoso = usuarioDAO.registrarUsuario(nuevoUsuario);

        if (registroExitoso) {
            response.sendRedirect(request.getContextPath() + "/vista/Iniciarsesion.jsp");
        } else {
            System.out.println("Error al registrar usuario.");
            response.sendRedirect(request.getContextPath() + "/errorRegistro.jsp");  // Redirigir en caso de error
        }
    }

    private void cerrarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Invalidar la sesión actual
        HttpSession session = request.getSession();
        session.invalidate();
        // Redirigir a la página principal (index.jsp)
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    public String encriptarContraseñaMD5(String contraseña) {

        try {
            // Crear instancia de MessageDigest para MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hash = md.digest(contraseña.getBytes("UTF-8"));

            // Convertir bytes a formato hexadecimal
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (Exception e) {
            throw new RuntimeException("Error al encriptar contraseña con MD5", e);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

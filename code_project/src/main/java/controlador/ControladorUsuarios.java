/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.UsuarioDAO;
import modelo.dto.Usuario;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import java.io.*;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author Acer
 */
@WebServlet(name = "ControladorUsuarios", urlPatterns = {"/controlador/ControladorUsuarios"})
public class ControladorUsuarios extends HttpServlet {

    private static final Logger logger = LoggerFactory.getLogger(ControladorUsuarios.class);

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
            out.println("<title>Servlet ControladorUsuarios</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorUsuarios at " + request.getContextPath() + "</h1>");
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

        logger.info("Acción recibida: {}", accion);

        if (StringUtils.equalsIgnoreCase(accion, "Editar")) {
            editarUsuario(request, response);
        } else if (StringUtils.equalsIgnoreCase(accion, "Eliminar")) {
            eliminarUsuario(request, response);
        } else if (StringUtils.equalsIgnoreCase(accion, "exportarExcel")) {
            exportarUsuarios(request, response);
        }

    }

    private void editarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int id = Integer.parseInt(request.getParameter("id")); // Obtenemos el ID del usuario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String celular = request.getParameter("celular");
        String correo = request.getParameter("correo");
        String dni = request.getParameter("dni");
        String contraseña = request.getParameter("contrasena");
        String rol = request.getParameter("rol");

        Usuario usuarioedit = new Usuario(id, nombre, apellido, Integer.parseInt(celular), correo, Integer.parseInt(dni), contraseña, rol);
        UsuarioDAO usuarioDAO = new UsuarioDAO();

        boolean editExitoso = usuarioDAO.actualizarUsuario(usuarioedit);

        if (editExitoso) {
            response.sendRedirect(request.getContextPath() + "/vista/Usuarios.jsp");

        } else {
            response.getWriter().write("Error al actualizar el usuario.");
        }

        logger.info("Editando usuario...");

    }

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idUsuarioStr = request.getParameter("id");
        if (StringUtils.isNumeric(idUsuarioStr)) {
            int idUsuario = Integer.parseInt(idUsuarioStr);
            logger.debug("Eliminando usuario con ID: {}", idUsuario);

            UsuarioDAO usuarioDAO = new UsuarioDAO();
            boolean eliminado = usuarioDAO.eliminarUsuario(idUsuario);

            if (eliminado) {
                logger.info("Usuario con ID {} eliminado exitosamente.", idUsuario);
                response.sendRedirect(request.getContextPath() + "/vista/Usuarios.jsp");
            } else {
                logger.error("Error al eliminar usuario con ID {}.", idUsuario);
                response.getWriter().write("Error al eliminar usuario.");
            }
        } else {
            logger.error("ID de usuario inválido: {}", idUsuarioStr);
            response.getWriter().write("ID de usuario inválido.");
        }
    }

    private void exportarUsuarios(HttpServletRequest request, HttpServletResponse response) throws IOException {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        List<Usuario> usuarios = usuarioDAO.obtenerUsuarios();

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Usuarios");

        // Crear la fila de encabezados
        Row headerRow = sheet.createRow(0);
        String[] columnHeaders = {"ID", "Nombre", "Apellidos", "Celular", "Correo", "DNI", "Rol"};
        for (int i = 0; i < columnHeaders.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columnHeaders[i]);
        }

        // Llenar las filas con los datos de los usuarios
        int rowNum = 1;
        for (Usuario usuario : usuarios) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(usuario.getId_usuario());
            row.createCell(1).setCellValue(usuario.getNombre());
            row.createCell(2).setCellValue(usuario.getApellidos());
            row.createCell(3).setCellValue(usuario.getCelular());
            row.createCell(4).setCellValue(usuario.getCorreo());
            row.createCell(5).setCellValue(usuario.getDni());
            row.createCell(6).setCellValue(usuario.getRol());
        }

        System.out.println("Total de usuarios exportados: " + usuarios.size());

        // Configurar la respuesta HTTP para descargar el archivo
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=usuarios.xlsx");

        // Escribir el contenido del libro en la respuesta HTTP
        try (OutputStream out = response.getOutputStream()) {
            workbook.write(out);
        }
        workbook.close();
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
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.dao.DifuntoDAO;

import modelo.dto.Difunto;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Acer
 */
@WebServlet(name = "ControladorDifunto", urlPatterns = {"/controlador/ControladorDifunto"})
public class ControladorDifunto extends HttpServlet {

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
            out.println("<title>Servlet ControladorDifunto</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorDifunto at " + request.getContextPath() + "</h1>");
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

        if ("Registrar".equals(accion)) {
            try {
                registrarDifunto(request, response);
            } catch (ParseException ex) {
                Logger.getLogger(ControladorDifunto.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if ("exportarExcel".equals(accion)) {

            exportarDifuntos(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/indexx.jsp");

        }

    }

    private void registrarDifunto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, java.text.ParseException {

        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String fecNacimientoStr = request.getParameter("fechaNacimiento");
        String fecFallecimientoStr = request.getParameter("fechaFallecimiento");
        String lugarFallecimiento = request.getParameter("lugar");

// Definir el formato de fecha (debe coincidir con el formato que envía el formulario)
        SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd"); // Para fechas en formato "AAAA-MM-DD"

// Convertir las cadenas de fecha a objetos java.util.Date
        Date fecNacimiento = null;
        Date fecFallecimiento = null;

        try {
            if (fecNacimientoStr != null && !fecNacimientoStr.isEmpty()) {
                fecNacimiento = formatoFecha.parse(fecNacimientoStr);
            }
            if (fecFallecimientoStr != null && !fecFallecimientoStr.isEmpty()) {
                fecFallecimiento = formatoFecha.parse(fecFallecimientoStr);
            }
        } catch (ParseException e) {
            e.printStackTrace();
            // Maneja el error aquí (puedes redirigir al usuario o mostrar un mensaje de error)
        }

// Crear el objeto Difunto con las fechas convertidas
        Difunto nuevoDifunto = new Difunto(nombre, apellido, fecNacimiento, fecFallecimiento, lugarFallecimiento);
        // Usar el DAO para registrar el difunto
        DifuntoDAO difDAO = new DifuntoDAO();
        boolean registroExitoso = difDAO.registrarDifunto(nuevoDifunto);

        if (registroExitoso) {
            response.sendRedirect(request.getContextPath() + "/vista/Servicios.jsp");
        } else {
            System.out.println("Error al registrar difunto.");
            response.sendRedirect(request.getContextPath() + "/errorRegistro.jsp");  // Redirigir en caso de error
        }
    }

    private void exportarDifuntos(HttpServletRequest request, HttpServletResponse response) throws IOException {

        DifuntoDAO difuntodao = new DifuntoDAO();
        List<Difunto> difuntos = difuntodao.obtenerTodosLosDifuntos();

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Difuntos");

        // Crear la fila de encabezados
        Row headerRow = sheet.createRow(0);
        String[] columnHeaders = {"ID", "Nombre", "Apellidos", "FechaNacimiento","FechaFallecimiento","LugarFallecimiento"};
        for (int i = 0; i < columnHeaders.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columnHeaders[i]);
        }

        // Llenar las filas con los datos de los asesores
        int rowNum = 1;
        for (Difunto difunto : difuntos) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(difunto.getIdDifunto());
            row.createCell(1).setCellValue(difunto.getNombreDif());
            row.createCell(2).setCellValue(difunto.getApellidosDif());
            row.createCell(3).setCellValue(difunto.getFecNacimiento());
            row.createCell(4).setCellValue(difunto.getFecFallecimiento());
            row.createCell(5).setCellValue(difunto.getLugarFallecimiento());

        }

        // Configurar la respuesta HTTP para descargar el archivo
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=asesores.xlsx");

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

}//

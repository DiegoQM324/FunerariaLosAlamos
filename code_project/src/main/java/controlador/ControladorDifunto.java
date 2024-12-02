/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.HttpSession;

import modelo.dao.DifuntoDAO;
import modelo.dao.UsuarioDAO;

import modelo.dto.Difunto;
import modelo.dto.Usuario;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Picture;
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

// Definir el formato de fecha, debe coincidir con el formato que envía el formulario.
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
        String servicioSeleccionado = request.getParameter("servicio");

        if (registroExitoso) {
            HttpSession session = request.getSession();
            session.setAttribute("servicioContratado", servicioSeleccionado);

            session.setAttribute("nombreDifunto", nombre);
            session.setAttribute("apellidoDifunto", apellido);
            session.setAttribute("fechaNacimientoDifunto", fecNacimiento);
            session.setAttribute("fechaFallecimientoDifunto", fecFallecimiento);
            session.setAttribute("lugarFallecimientoDifunto", lugarFallecimiento);

            response.sendRedirect(request.getContextPath() + "/vista/Venta.jsp");
        } else {
            System.out.println("Error al registrar difunto.");
            response.sendRedirect(request.getContextPath() + "/errorRegistro.jsp");  // Redirigir en caso de error
        }
    }

    private void exportarDifuntos(HttpServletRequest request, HttpServletResponse response) throws IOException {

        DifuntoDAO difuntoDAO = new DifuntoDAO();
        List<Difunto> difuntos = difuntoDAO.obtenerTodosLosDifuntos();

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Difuntos");

        // Ajustar ancho de columnas
        for (int i = 0; i < 6; i++) {
            sheet.setColumnWidth(i, 6000);
        }

        // Agregar la imagen (logo de la empresa)
        try (InputStream inputStream = request.getServletContext().getResourceAsStream("/img/logocreado.jpg")) {
            byte[] imageBytes = inputStream.readAllBytes();
            int pictureIdx = workbook.addPicture(imageBytes, Workbook.PICTURE_TYPE_PNG);

            Drawing<?> drawing = sheet.createDrawingPatriarch();
            ClientAnchor anchor = workbook.getCreationHelper().createClientAnchor();
            anchor.setCol1(1);  // Columna inicial
            anchor.setRow1(1);  // Fila inicial para la imagen
            Picture picture = drawing.createPicture(anchor, pictureIdx);
            picture.resize();  // Ajustar imagen automáticamente
        } catch (NullPointerException e) {
            System.out.println("No se encontró el logo en la ruta especificada.");
        }

        // Estilo del título "FUNERARIA LOS ALAMOS"
        Row titleRow = sheet.createRow(5); // Fila donde va el título, debajo de la imagen
        Cell titleCell = titleRow.createCell(1);
        titleCell.setCellValue("FUNERARIA LOS ALAMOS");

        CellStyle titleStyle = workbook.createCellStyle();
        Font titleFont = workbook.createFont();
        titleFont.setBold(true);
        titleFont.setFontHeightInPoints((short) 18);
        titleStyle.setFont(titleFont);
        titleStyle.setAlignment(HorizontalAlignment.CENTER);

        titleCell.setCellStyle(titleStyle);
        sheet.addMergedRegion(new org.apache.poi.ss.util.CellRangeAddress(5, 5, 1, 5)); // Fusionar celdas para el título

        // Estilo del encabezado de la tabla
        CellStyle headerStyle = workbook.createCellStyle();
        Font headerFont = workbook.createFont();
        headerFont.setBold(true);
        headerFont.setFontHeightInPoints((short) 14);
        headerStyle.setFont(headerFont);
        headerStyle.setAlignment(HorizontalAlignment.CENTER);

        // Crear la fila de encabezados para la tabla
        Row headerRow = sheet.createRow(7); // La tabla comienza en la fila 8 (índice 7)
        String[] columnHeaders = {"ID", "Nombre", "Apellidos", "Fecha Nacimiento", "Fecha Fallecimiento", "Lugar Fallecimiento"};
        for (int i = 0; i < columnHeaders.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columnHeaders[i]);
            cell.setCellStyle(headerStyle);
        }

        // Llenar las filas con los datos de los difuntos
        int rowNum = 8; // La fila donde empiezan los datos
        for (Difunto difunto : difuntos) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(difunto.getIdDifunto());
            row.createCell(1).setCellValue(difunto.getNombreDif());
            row.createCell(2).setCellValue(difunto.getApellidosDif());
            row.createCell(3).setCellValue(difunto.getFecNacimiento().toString());
            row.createCell(4).setCellValue(difunto.getFecFallecimiento().toString());
            row.createCell(5).setCellValue(difunto.getLugarFallecimiento());
        }

        System.out.println("Total de difuntos exportados: " + difuntos.size());

        // Configurar la respuesta HTTP para descargar el archivo
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=difuntos.xlsx");

        // Escribir el contenido en la respuesta
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

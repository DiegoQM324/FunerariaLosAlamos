/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.AsesorDAO;
import modelo.dto.Asesor;
import org.apache.commons.lang3.StringUtils;
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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Controlador para gestionar las operaciones relacionadas con los asesores,
 * como exportar los datos a un archivo Excel.
 *
 * Este servlet recibe peticiones HTTP y responde según la acción solicitada.
 * Está mapeado a la URL "/controlador/ControladorAsesores".
 *
 * @author Acer
 */
@WebServlet(name = "ControladorAsesores", urlPatterns = {"/controlador/ControladorAsesores"})
public class ControladorAsesores extends HttpServlet {

    // Logger para registrar las acciones y eventos del servlet
    private static final Logger logger = LoggerFactory.getLogger(ControladorAsesores.class);

    /**
     * Método principal que procesa tanto peticiones HTTP GET como POST.
     *
     * @param request Objeto HttpServletRequest con los datos de la solicitud.
     * @param response Objeto HttpServletResponse para enviar la respuesta.
     * @throws ServletException Si ocurre un error específico del servlet.
     * @throws IOException Si ocurre un error de entrada/salida.
     */
    public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorAsesores</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorAsesores at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Maneja las peticiones HTTP GET.
     *
     * @param request Objeto HttpServletRequest con los datos de la solicitud.
     * @param response Objeto HttpServletResponse para enviar la respuesta.
     * @throws ServletException Si ocurre un error específico del servlet.
     * @throws IOException Si ocurre un error de entrada/salida.
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Maneja las peticiones HTTP POST.
     *
     * @param request Objeto HttpServletRequest con los datos de la solicitud.
     * @param response Objeto HttpServletResponse para enviar la respuesta.
     * @throws ServletException Si ocurre un error específico del servlet.
     * @throws IOException Si ocurre un error de entrada/salida.
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        logger.info("Acción recibida: {}", accion);

        if (StringUtils.equalsIgnoreCase(accion, "exportarExcel")) {
            exportarAsesores(request, response);
        } else if (StringUtils.equalsIgnoreCase(accion, "Actualizar")) {
            editarAsesor(request, response);

        } else if (StringUtils.equalsIgnoreCase(accion, "Eliminar")) {
            eliminarAsesor(request, response);
        }
    }

    /**
     * Exporta la lista de asesores a un archivo Excel y lo envía como respuesta
     * HTTP.
     *
     * @param request Objeto HttpServletRequest con los datos de la solicitud.
     * @param response Objeto HttpServletResponse para enviar la respuesta.
     * @throws IOException Si ocurre un error de entrada/salida.
     */
    private void exportarAsesores(HttpServletRequest request, HttpServletResponse response) throws IOException {

        AsesorDAO asesorDAO = new AsesorDAO();
        List<Asesor> asesores = asesorDAO.obtenerTodosLosAsesores();

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Asesores");

        // Ajustar ancho de columnas
        for (int i = 0; i < 4; i++) {
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
        sheet.addMergedRegion(new org.apache.poi.ss.util.CellRangeAddress(5, 5, 1, 3)); // Fusionar celdas para el título

        // Estilo del encabezado de la tabla
        CellStyle headerStyle = workbook.createCellStyle();
        Font headerFont = workbook.createFont();
        headerFont.setBold(true);
        headerFont.setFontHeightInPoints((short) 14);
        headerStyle.setFont(headerFont);
        headerStyle.setAlignment(HorizontalAlignment.CENTER);

        // Crear la fila de encabezados para la tabla
        Row headerRow = sheet.createRow(7); // La tabla comienza en la fila 8 (índice 7)
        String[] columnHeaders = {"ID", "Nombre", "Apellidos", "Costo"};
        for (int i = 0; i < columnHeaders.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columnHeaders[i]);
            cell.setCellStyle(headerStyle);
        }

        // Llenar las filas con los datos de los asesores
        int rowNum = 8; // La fila donde empiezan los datos
        for (Asesor asesor : asesores) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(asesor.getIdAsesor());
            row.createCell(1).setCellValue(asesor.getNombreAse());
            row.createCell(2).setCellValue(asesor.getApellidosAse());
            row.createCell(3).setCellValue(asesor.getCosto());
        }

        logger.info("Total de asesores exportados: {}", asesores.size());

        // Configurar la respuesta HTTP para descargar el archivo
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=asesores.xlsx");

        // Escribir el contenido del libro en la respuesta HTTP
        try (OutputStream out = response.getOutputStream()) {
            workbook.write(out);
        }
        workbook.close();
    }

    private void eliminarAsesor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idAsesorParam = request.getParameter("id_asesor");

        if (StringUtils.isNumeric(idAsesorParam)) {
            int idAsesor = Integer.parseInt(idAsesorParam);

            AsesorDAO asesorDAO = new AsesorDAO();
            boolean exito = asesorDAO.eliminarAsesor(idAsesor);

            if (exito) {
                logger.info("Asesor con ID {} eliminado exitosamente.", idAsesor);
                response.sendRedirect(request.getContextPath() + "/vista/AsesoresList.jsp");
            } else {
                logger.error("Error al eliminar el asesor con ID {}.", idAsesor);
                response.getWriter().write("Error al eliminar el asesor.");
            }
        } else {
            logger.error("ID de asesor no válido: {}", idAsesorParam);
            response.getWriter().write("ID de asesor no válido.");
        }
    }

    private void editarAsesor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idAsesorParam = request.getParameter("id_asesor");
        String nombre = request.getParameter("nombrease");
        String apellidos = request.getParameter("apellidosase");
        String costoParam = request.getParameter("costo");

        if (StringUtils.isNumeric(idAsesorParam)) {
            int idAsesor = Integer.parseInt(idAsesorParam);

            Asesor asesorEditado = new Asesor(idAsesor, nombre, apellidos, Double.parseDouble(costoParam));

            AsesorDAO asesorDAO = new AsesorDAO();
            boolean exito = asesorDAO.actualizarAsesor(asesorEditado);

            if (exito) {
                logger.info("Asesor con ID {} editado exitosamente.", idAsesor);
                response.sendRedirect(request.getContextPath() + "/vista/AsesoresList.jsp");
            } else {
                logger.error("Error al editar el asesor con ID {}.", idAsesor);
                response.getWriter().write("Error al editar el asesor.");
            }
        } else {
            logger.error("Datos inválidos para la edición del asesor: ID = {}, Costo = {}", idAsesorParam, costoParam);
            response.getWriter().write("Datos inválidos para la edición.");
        }
    }

    /**
     * Proporciona una descripción breve del servlet.
     *
     * @return Una cadena con la descripción del servlet.
     */
    @Override
    public String getServletInfo() {
        return "Controlador para gestionar las operaciones relacionadas con los asesores.";
    }
}

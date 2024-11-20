package controlador;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.UUID;
import javax.servlet.RequestDispatcher;
import servicios.ConectaDB;

@WebServlet(name = "PasswordRecoveryController", urlPatterns = {"/controlador/PasswordRecoveryController"})
public class PasswordRecoveryController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String message = ""; // Mensaje para mostrar en el JSP

        String token = UUID.randomUUID().toString(); // Generar un token único
        long expirationTime = System.currentTimeMillis() + 3600000; // 1 hora de validez

        try (Connection conn = new ConectaDB().getConexion()) {
            // Almacenar el token en la base de datos
            String updateQuery = "UPDATE usuario SET reset_token = ?, token_expiration = ? WHERE correo = ?";
            PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
            updateStmt.setString(1, token);
            updateStmt.setTimestamp(2, new Timestamp(expirationTime));
            updateStmt.setString(3, email);
            int rowsUpdated = updateStmt.executeUpdate();

            if (rowsUpdated > 0) {
                String resetLink = "http://localhost:8080/LOSALAMOS/vista/reset_password.jsp?token=" + token;

                // Enviar correo con el enlace de restablecimiento
                EmailUtil.sendEmail(email, "Recuperación de Contraseña - Funeraria Los Alamos",
                        "<div style='font-family: Arial, sans-serif; max-width: 600px; margin: auto; padding: 20px; border: 1px solid #ccc; border-radius: 10px; background-color: #f8f8f8;'>"
                        + "<div style='text-align: center;'>"
                        + "<img src='https://drive.google.com/uc?export=view&id=1DJFk7bwz-BWGkk5lXYJiJkN9WyAdh37Z' alt='Funeraria Los Alamos' style='max-width: 150px;'>"
                        + "<h1 style='color: #4A4A4A;'>Recuperación de Contraseña</h1>"
                        + "</div>"
                        + "<p style='color: #555; font-size: 16px;'>Estimado/a usuario/a,</p>"
                        + "<p style='color: #555; font-size: 16px;'>Usted ha solicitado recuperar su contraseña. Haga clic en el enlace siguiente para restablecerla:</p>"
                        + "<div style='text-align: center; margin: 20px 0;'>"
                        + "<a href='" + resetLink + "' style='background-color: #007bff; color: white; padding: 15px 20px; text-decoration: none; border-radius: 5px;'>Restablecer contraseña</a>"
                        + "</div>"
                        + "<p style='color: #555; font-size: 16px;'>Este enlace expirará en 1 hora.</p>"
                        + "<hr style='border: 0; border-top: 1px solid #ccc;'>"
                        + "<p style='font-size: 14px; color: #888; text-align: center;'>Funeraria Los Alamos - Servicio y apoyo en los momentos más difíciles.</p>"
                        + "</div>"
                );
                message = "Correo enviado exitosamente.";
            } else {
                message = "Correo no encontrado.";
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }

        // Enviar el mensaje al JSP
        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/vista/recoverPassword.jsp");
        dispatcher.forward(request, response);
    }
}

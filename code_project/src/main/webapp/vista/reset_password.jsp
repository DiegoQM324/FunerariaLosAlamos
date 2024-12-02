<%-- 
    Document   : reset_password
    Created on : 1 dic 2024, 4:33:55?p.m.
    Author     : seeke
--%>

<%@page import="servicios.ConectaDB"%>
<%@page import="controlador.ControladorPrincipal"%>
<%@ page import="java.sql.*, java.time.*, java.security.MessageDigest" %>
<%
    // Parámetro del token desde la URL
    String token = request.getParameter("token");
    boolean isValidToken = false;
    String email = null;

    if (token != null && !token.isEmpty()) {
        try (Connection conn = new ConectaDB().getConexion()) {
            String query = "SELECT correo, token_expiration FROM usuario WHERE reset_token = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, token);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Timestamp expiration = rs.getTimestamp("token_expiration");
                email = rs.getString("correo");

                // Verificar si el token aún es válido
                if (expiration != null && expiration.after(new Timestamp(System.currentTimeMillis()))) {
                    isValidToken = true;
                }
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }

    String successMessage = ""; // Variable para almacenar el mensaje de éxito
    String errorMessage = ""; // Variable para errores

    if (isValidToken && request.getMethod().equalsIgnoreCase("POST")) {
        String newPassword = request.getParameter("newPassword");

        // Validar contraseña y encriptarla usando el método existente
        if (newPassword != null && !newPassword.trim().isEmpty()) {
            try (Connection conn = new ConectaDB().getConexion()) {
                // Instancia del controlador para usar tu método personalizado
                ControladorPrincipal controlador = new ControladorPrincipal();
                String hashedPassword = controlador.encriptarContraseñaMD5(newPassword);

                String updateQuery = "UPDATE usuario SET contraseña = ?, reset_token = NULL, token_expiration = NULL WHERE correo = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                updateStmt.setString(1, hashedPassword);
                updateStmt.setString(2, email);

                int rowsUpdated = updateStmt.executeUpdate();
                if (rowsUpdated > 0) {
                    successMessage = "Contraseña restablecida exitosamente.";
                } else {
                    errorMessage = "Error al restablecer la contraseña.";
                }
            } catch (Exception e) {
                errorMessage = "Error: " + e.getMessage();
            }
        } else {
            errorMessage = "La contraseña no puede estar vacía.";
        }
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Restablecer Contraseña</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #111;
            }

            .container {
                display: flex;
                width: 80%;
                max-width: 1200px;
                height: 80vh;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.5);
                border-radius: 15px;
                overflow: hidden;
            }

            .image-container {
                flex: 1;
                background-image: url("../img/logocreado.jpg");
                background-size: cover;
                background-position: center;
            }

            .form-container {
                flex: 1;
                background-color: #1b1b1b;
                padding: 30px 40px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                gap: 10px;
            }

            h2 {
                text-align: center;
                font-size: 32px;
                font-weight: bold;
                margin-bottom: 20px;
                color: #74ebd5;
            }

            .form-group {
                margin-bottom: 15px;
            }

            label {
                display: block;
                margin-bottom: 8px;
                font-size: 16px;
                color: #ddd;
            }

            input[type="password"]{
                width: 95%;
                padding: 12px;
                border-radius: 8px;
                border: 1px solid #444;
                background-color: #222;
                color: white;
                font-size: 16px;
            }

            input::placeholder {
                color: #bbb;
            }

            button {
                width: 100%;
                padding: 14px;
                background-color: #00b894;
                border: none;
                border-radius: 8px;
                color: white;
                font-weight: bold;
                font-size: 18px;
                cursor: pointer;
                transition: background-color 0.3s, transform 0.2s;
                margin-top: 5px;
                margin-bottom: 40px;
            }

            button:hover {
                background-color: #009874;
                transform: translateY(-2px);
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            }

            p {
                text-align: center;
                margin-top: 20px;
                color: #ffffff;

            }

            p a {
                color: #00b894;
                text-decoration: none;
            }

            p a:hover {
                text-decoration: underline;
            }
        </style>

    </head>
    <body>
        <div class="container">
            <!-- Contenedor de Imagen -->
            <div class="image-container"></div>

            <!-- Contenedor del Formulario -->
            <div class="form-container">
                <h2>Restablecer Contraseña</h2>
                <% if (token == null || !isValidToken) { %>
                <p style="color: red;">El enlace de restablecimiento es inválido o ha expirado.</p>
                <% } else {%>
                <form action="reset_password.jsp?token=<%= token%>" method="post">
                    <div class="form-group">
                        <label for="newPassword">Nueva Contraseña:</label><br>
                        <input type="password" id="newPassword" placeholder="Ingresa tu nueva contraseña" name="newPassword" required><br><br>
                    </div>
                    <button type="submit" name="accion" value="Restablecer">Restablecer Contraseña</button>
                    <% if (!successMessage.isEmpty()) {%>
                    <p style="color: green; margin-top: 10px;"><%= successMessage%></p>
                    <% } %>
                    <% if (!errorMessage.isEmpty()) {%>
                    <p style="color: red; margin-top: 10px;"><%= errorMessage%></p>
                    <% } %>
                </form>
                <% }%>
                <p><a href="Iniciarsesion.jsp">Volver al inicio</a></p>
            </div>
        </div>
    </body>
</html>


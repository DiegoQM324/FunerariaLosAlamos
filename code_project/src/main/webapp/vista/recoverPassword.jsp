<%-- 
    Document   : recoverPassword
    Created on : 30 nov 2024, 3:18:48 p.m.
    Author     : seeke
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recuperación de Contraseña</title>
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

            input[type="email"]{
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
                <h2>Recuperación de Contraseña</h2>
                <form action="<%= request.getContextPath()%>/controlador/PasswordRecoveryController" method="post">
                    <div class="form-group">
                        <label for="email">Correo electrónico:</label>
                        <input type="email" id="email" placeholder="Ingresa tu correo" name="email" required>
                    </div>
                    <button type="submit" name="accion" value="Recuperar">Recuperar</button>
                    <% String message = (String) request.getAttribute("message"); %>
                    <% if (message != null && !message.isEmpty()) {%>
                    <p style="color: <%= message.contains("exitosamente") ? "green" : "red"%>; margin-top: 10px;"><%= message%></p>
                    <% }%>
                </form>
                <p><a href="${pageContext.request.contextPath}/vista/Iniciarsesion.jsp"">Volver al inicio</a></p>
            </div>
        </div>
    </body>
</html>



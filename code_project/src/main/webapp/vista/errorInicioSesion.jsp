<%-- 
    Document   : errorInicioSesion
    Created on : 3 dic 2024, 17:36:54
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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
                font-size: 14px;
                color: #ddd;
            }

            input[type="text"], input[type="password"] {
                width: 100%;
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
                <h2>Iniciar Sesión</h2>

                <!-- Mostrar el mensaje de error si existe -->
                <c:if test="${not empty error}">
                    <div class="error-message" style="color: red; font-weight: bold;">
                        ${error}
                    </div>
                </c:if>

                <form action="<%= request.getContextPath()%>/controlador/ControladorPrincipal" method="post">
                    <div class="form-group">
                        <label for="dni">DNI:</label>
                        <input type="text" value="${dni}" id="dni" name="dni" placeholder="Ingresa tu DNI" required>
                    </div>
                    <div class="form-group">
                        <label for="contrasena">Contraseña:</label>
                        <input type="password" value="${contrasena}" id="contrasena" name="contrasena" placeholder="Ingresa tu contraseña" required>
                    </div>
                    <button type="submit" name="accion" value="Ingresar">Iniciar Sesión</button>
                </form>
                <p>¿No tienes una cuenta? <a href="Registrar.jsp">Regístrate aquí</a></p>
                <p><a href="recoverPassword.jsp">¿Has olvidado tu contraseña?</a></p>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : Registrar
    Created on : 22 oct 2024, 18:10:11
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro Usuario</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #111;
                flex-direction: column; /* Para apilar el título y el contenedor */
            }

            /* Estilo del título */
            .main-title {
                font-size: 48px;
                color: white;
                font-weight: bold;
                font-family: 'Poppins', sans-serif;
                text-align: center;
                margin-bottom: 20px;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
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

            input[type="text"], input[type="email"], input[type="password"], select {
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
        <!-- Título centrado -->
        <div class="main-title">REGÍSTRATE</div>

        <!-- Contenedor Principal -->
        <div class="container">
            <!-- Contenedor de Imagen -->
            <div class="image-container"></div>

            <!-- Contenedor del Formulario -->
            <div class="form-container">
                <h2></h2>
                <form action="<%= request.getContextPath()%>/controlador/ControladorPrincipal" method="post">
                    <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" id="nombre" name="nombre" placeholder="Ingresa tu nombre" value="${nombre}" required>
                    </div>

                    <div class="form-group">
                        <label for="apellido">Apellidos:</label>
                        <input type="text" id="apellido" name="apellido" placeholder="Ingresa tus apellidos" value="${apellidos}" required>
                    </div>

                    <div class="form-group">
                        <label for="dni">DNI:</label>
                        <input type="text" id="dni" name="dni" placeholder="Ingresa tu DNI" value="${dni}" required>
                    </div>

                    <div class="form-group">
                        <label for="celular">Celular:</label>
                        <input type="text" id="celular" name="celular" placeholder="Ingresa tu celular" value="${celular}" required>
                    </div>

                    <div class="form-group">
                        <label for="correo">Correo Electrónico:</label>
                        <input type="email" id="correo" name="correo" placeholder="Ingresa tu correo" value="${correo}" required>
                    </div>

                    <div class="form-group">
                        <label for="contrasena">Contraseña:</label>
                        <input type="password" id="contrasena" name="contrasena" placeholder="Ingresa tu contraseña" value="${contrasena}" required>
                    </div>

                   <!-- <div class="form-group">
                        <label for="rol">Rol:</label>
                        <select id="rol" name="rol" required>
                            <option value="" disabled selected>Selecciona un rol</option>
                            <option value="usuario" <%= "usuario".equals(request.getAttribute("rol")) ? "selected" : ""%>>Usuario</option>
                            <option value="administrador" <%= "administrador".equals(request.getAttribute("rol")) ? "selected" : ""%>>Administrador</option>
                        </select>
                    </div>-->

                    <button type="submit" name="accion" value="Registrar">Registrarse</button>
                </form>
                <p>¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión aquí</a></p>
            </div>
        </div>
    </body>
</html>

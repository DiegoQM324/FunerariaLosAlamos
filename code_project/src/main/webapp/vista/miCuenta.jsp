<%-- 
    Document   : miCuenta
    Created on : 22 oct 2024, 20:09:31
    Author     : Acer
--%>

<%@page import="modelo.dto.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mi Cuenta</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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

            .user-info p {
                font-size: 16px;
                color: #ddd;
                margin-bottom: 10px;
            }

            .actions {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            .btn {
                flex: 1;
                padding: 10px;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-size: 16px;
                font-weight: bold;
                transition: background-color 0.3s ease, transform 0.2s;
                text-align: center;
            }

            .btn-primary {
                background-color: #007bff;
                color: white;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                transform: translateY(-2px);
            }

            .btn-danger {
                background-color: #dc3545;
                color: white;
            }

            .btn-danger:hover {
                background-color: #c82333;
                transform: translateY(-2px);
            }
        </style>
    </head>
    <body>
        <div class="container">


            <div class="image-container"></div>

            <div class="form-container">
                <div class="user-info">
                    <%
                        Usuario usuarioAutenticado = (Usuario) session.getAttribute("usuarioAutenticado");
                        if (usuarioAutenticado != null) {
                    %>
                    <h2>Mi cuenta</h2>
                    <p><strong>Nombre:</strong> <%= usuarioAutenticado.getNombre()%></p>
                    <p><strong>Apellido:</strong> <%= usuarioAutenticado.getApellidos()%></p>
                    <p><strong>Usuario:</strong> <%= usuarioAutenticado.getDni()%></p>
                    <p><strong>Correo:</strong> <%= usuarioAutenticado.getCorreo()%></p>
                    <p><strong>Celular:</strong> <%= usuarioAutenticado.getCelular()%></p>
                    <p><strong>Rol:</strong> <%= usuarioAutenticado.getRol()%></p>


                    <!-- Botones de acción -->
                    <div class="actions">
                        <!-- Botón Volver al inicio -->
                        <form action="<%= request.getContextPath()%>/index.jsp">
                            <button type="submit" class="btn btn-primary" >Volver al inicio</button>
                        </form>

                        <!-- Botón Cerrar sesión -->
                        <form action="<%= request.getContextPath()%>/controlador/ControladorPrincipal" method="post">

                            <button type="submit" name="accion" value="Cerrar" class="btn btn-danger">Cerrar sesión</button>
                        </form>
                    </div>
                    <%
                    } else {
                    %>
                    <p>No has iniciado sesión.</p>
                    <a href="Iniciarsesion.jsp" class="btn">Iniciar sesión</a>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>

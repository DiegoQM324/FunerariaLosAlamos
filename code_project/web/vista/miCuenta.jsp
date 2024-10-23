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
            /* Estilos generales */
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-image: linear-gradient(to right, #ff7f50, #ffcc99); /* Degradado en tonos naranjas */
            }

            .container {
                max-width: 600px;
                margin: 50px auto;
                padding: 40px;
                background-color: white;
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
                transition: box-shadow 0.4s ease-in-out, transform 0.4s ease-in-out;
            }

            .container:hover {
                box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
                transform: translateY(-10px);
            }

            h2 {
                text-align: center;
                color: #007bff;
                font-size: 2.5rem;
                margin-bottom: 30px;
                letter-spacing: 1px;
            }

            .user-info {
                display: flex;
                flex-direction: column;
                align-items: center;
                background-color: #f9f9f9;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                transition: background-color 0.3s ease;
            }

            .user-info:hover {
                background-color: #e3f2fd;
            }

            .user-info p {
                font-size: 1.2rem;
                margin: 10px 0;
                color: #333;
            }

            .user-info p strong {
                color: #007bff;
            }

            .user-info .actions {
                margin-top: 30px;
                text-align: center;
            }

            .user-info .actions button {
                background-color: #007bff;
                color: white;
                padding: 12px 25px;
                border: none;
                border-radius: 50px;
                cursor: pointer;
                text-transform: uppercase;
                font-weight: bold;
                margin: 5px;
                transition: all 0.3s ease;
                box-shadow: 0 4px 15px rgba(0, 123, 255, 0.2);
            }

            .user-info .actions button:hover {
                background-color: #0056b3;
                box-shadow: 0 6px 20px rgba(0, 86, 179, 0.3);
            }

            .user-info .actions .logout-btn {
                background-color: #dc3545;
            }

            .user-info .actions .logout-btn:hover {
                background-color: #c82333;
                box-shadow: 0 6px 20px rgba(200, 35, 51, 0.3);
            }

            /* Botón para acciones */
            .user-info .actions button:active {
                transform: translateY(2px);
            }

            /* Link de iniciar sesión */
            .user-info .btn {
                background-color: #28a745;
                color: white;
                padding: 10px 20px;
                border-radius: 8px;
                text-decoration: none;
                font-weight: bold;
                transition: background-color 0.3s ease, box-shadow 0.3s ease;
            }

            .user-info .btn:hover {
                background-color: #218838;
                box-shadow: 0 6px 20px rgba(33, 136, 56, 0.2);
            }

            /* Mensaje de no sesión */
            .user-info p.no-session {
                font-size: 1.5rem;
                color: #dc3545;
                margin-bottom: 20px;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <h2>Mi cuenta</h2>

            <div class="user-info">
                <%
                    Usuario usuarioAutenticado = (Usuario) session.getAttribute("usuarioAutenticado");
                    if (usuarioAutenticado != null) {
                %>
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
                        <button type="submit">Volver al inicio</button>
                    </form>

                    <!-- Botón Cerrar sesión -->
                    <form action="<%= request.getContextPath()%>/controlador/ControladorPrincipal" method="post">

                        <button type="submit" name="accion" value="Cerrar" class="logout-btn">Cerrar sesión</button>
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
    </body>
</html>

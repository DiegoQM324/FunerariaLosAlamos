<%-- 
    Document   : Iniciarsesion
    Created on : 22 oct 2024, 18:09:49
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Iniciar Sesión</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f1f3f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-image: linear-gradient(to right, #ff7f50, #ffcc99); /* Degradado en tonos naranjas */
            }

            .container {
                max-width: 420px;
                padding: 40px;
                background-color: #fff;
                border-radius: 15px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
                transition: box-shadow 0.4s ease-in-out, transform 0.4s ease-in-out;
            }

            .container:hover {
                box-shadow: 0 15px 45px rgba(0, 0, 0, 0.3);
                transform: translateY(-10px);
            }

            h2 {
                text-align: center;
                color: #333;
                font-size: 30px;
                font-weight: bold;
                margin-bottom: 40px;
                letter-spacing: 1px;
            }

            .form-group {
                margin-bottom: 25px;
            }

            label {
                display: block;
                margin-bottom: 10px;
                font-size: 14px;
                color: #555;
                letter-spacing: 0.5px;
            }

            input[type="email"],
            input[type="password"],
            input[type="text"] {
                width: 100%;
                padding: 14px;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 16px;
                box-sizing: border-box;
                background-color: #f9f9f9;
                transition: all 0.3s ease;
            }

            input:focus {
                border-color: #74ebd5;
                outline: none;
                box-shadow: 0 0 10px rgba(255, 127, 80, 0.5); /* Resplandor naranja */
            }

            button {
                width: 100%;
                padding: 14px;
                background-image: linear-gradient(to right, #ff7f50, #ff6347); /* Degradado en naranja */
                border: none;
                border-radius: 8px;
                color: white;
                font-size: 18px;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease, box-shadow 0.3s ease;
                text-transform: uppercase;
            }

            button:hover {
                background-image: linear-gradient(to right, #ff4500, #ff6347); /* Degradado más intenso en hover */
                box-shadow: 0 4px 15px rgba(0, 114, 255, 0.3);
            }

            button:active {
                background-image: linear-gradient(to right, #0072ff, #00c6ff);
                box-shadow: 0 2px 10px rgba(0, 114, 255, 0.2);
                transform: translateY(2px);
            }

            p {
                text-align: center;
                margin-top: 20px;
                color: #666;
                font-size: 14px;
            }

            p a {
                color: #007bff;
                text-decoration: none;
                font-weight: 500;
                transition: color 0.3s ease;
            }

            p a:hover {
                color: #0056b3;
                text-decoration: underline;
            }
        </style>

    </head>
    <body>
        <div class="container">
            <h2>Iniciar Sesión</h2>
            <form action="<%= request.getContextPath()%>/controlador/ControladorPrincipal" method="post">
                <div class="form-group">
                    <label for="email">DNI:</label>
                    <input type="text" value="${dni}"  id="dni" name="dni" required>
                </div>
                <div class="form-group">
                    <label for="password">Contraseña:</label>
                    <input type="password" value="${contrasena}" id="contrasena" name="contrasena" required>
                </div>
                <button type="submit" name="accion" value="Ingresar">Iniciar Sesión</button>
            </form>
            <p>¿No tienes una cuenta? <a href="Registrar.jsp">Regístrate aquí</a></p>
        </div>
    </body>
</html>

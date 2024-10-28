<%-- 
    Document   : Usuarios
    Created on : 25 oct 2024, 12:02:29
    Author     : Acer
--%>

<%@page import="modelo.dto.Usuario"%>
<%@page import="java.sql.*"%>
<%@page import="servicios.ConectaDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Usuarios</title>


        <link href="../vendorAdmin/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../cssAdmin/sb-admin-2.min.css" rel="stylesheet">


        <style>
            /* Estilo para mantener la barra lateral fija */
            #wrapper {
                display: flex;
                align-items: stretch;
            }

            /* Asegurar que la tabla no desborde */
            .table-responsive {
                max-width: 100%;
                overflow-x: auto;
            }

            .content-wrapper {
                flex: 1;
                padding: 20px;
            }
        </style>
    </head>
    <body id="page-top">

        <%
            // Recuperamos el usuario desde la sesión
            Usuario usuarioAutenticado = (Usuario) session.getAttribute("usuarioAutenticado");

            // Validamos que exista un usuario logueado
            // Extraemos el nombre y apellidos
            String nombre = usuarioAutenticado.getNombre();
            String apellidos = usuarioAutenticado.getApellidos();
        %>


        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
                <a class="sidebar-brand d-flex align-items-center justify-content-center">
                    <div class="sidebar-brand-icon">
                        <img src="../img/ICONOLOSALAMOS.jpg" alt="Logo" style="width: 40px; height: 40px; border-radius: 50%;">
                    </div>
                    <div class="sidebar-brand-text mx-3">ADMINISTRADOR-LOS ALAMOS</div>
                </a>

                <hr class="sidebar-divider my-0">

                <li class="nav-item">
                    <a class="nav-link" href="index.html">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>

                <hr class="sidebar-divider">

                <div class="sidebar-heading">Interface</div>

                <li class="nav-item active">
                    <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
                       aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Components</span>
                    </a>
                    <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Custom Components:</h6>
                            <a class="collapse-item active" href="Usuarios.jsp">Usuarios</a>
                            <a class="collapse-item" href="Difuntos.jsp">Difuntos</a>
                            <a class="collapse-item" href="AsesoresList.jsp">Asesores</a>

                        </div>
                    </div>
                </li>
            </ul>
            <!-- End of Sidebar -->

            <!-- Contenedor del contenido principal -->
            <div class="content-wrapper">


                <div class="container-fluid">
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <form class="form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Buscar..." 
                                       aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                        <ul class="navbar-nav ml-auto">
                            <!-- Dropdown del Usuario -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                                        <%= nombre + " " + apellidos%>  
                                    </span>
                                    <img class="img-profile rounded-circle" src="../img/undraw_profile.svg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </nav>

                    <h1 class="h3 mb-4 text-gray-800">Lista de Usuarios</h1>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Usuarios Registrados</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-container">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID Usuario</th>
                                            <th>Nombre</th>
                                            <th>Apellidos</th>
                                            <th>Celular</th>
                                            <th>Correo</th>
                                            <th>DNI</th>
                                            <th>Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            try (Connection conn = new ConectaDB().getConexion(); PreparedStatement ps = conn.prepareStatement("SELECT * FROM usuario WHERE rol = 'usuario'"); ResultSet rs = ps.executeQuery()) {

                                                while (rs.next()) {
                                                    int idUsuario = rs.getInt("id_usuario");
                                                    String nombres = rs.getString("nombre");
                                                    String apellidoss = rs.getString("apellidos");
                                                    String celular = rs.getString("celular");
                                                    String correo = rs.getString("correo");
                                                    String dni = rs.getString("dni");
                                        %>
                                        <tr>
                                            <td><%= idUsuario%></td>
                                            <td><%= nombres%></td>
                                            <td><%= apellidoss%></td>
                                            <td><%= celular%></td>
                                            <td><%= correo%></td>
                                            <td><%= dni%></td>
                                            <td>
                                                <button class="btn btn-warning btn-sm" data-toggle="modal" 
                                                        data-target="#editarModal<%= idUsuario%>">
                                                    <i class="fas fa-edit"></i> Editar
                                                </button>


                                                <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#eliminarModal<%= idUsuario%>">
                                                    <i class="fas fa-trash-alt"></i> Eliminar
                                                </button>
                                            </td>
                                        </tr>

                                        <!-- Modal de Edición -->
                                    <div  class="modal fade" id="editarModal<%= idUsuario%>" tabindex="-1" role="dialog"
                                          aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Editar Usuario</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form action="<%= request.getContextPath()%>/controlador/ControladorUsuarios" method="post">
                                                    <div class="modal-body">
                                                        <input type="hidden" name="id" value="<%= idUsuario%>">

                                                        <div class="form-group">
                                                            <label for="nombre">Nombre:</label>
                                                            <input type="text" class="form-control" name="nombre" id="nombre"
                                                                   value="<%= nombres%>" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="apellido">Apellidos:</label>
                                                            <input type="text" class="form-control" name="apellido" id="apellido"
                                                                   value="<%= apellidoss%>" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="celular">Celular:</label>
                                                            <input type="text" class="form-control" name="celular" id="celular"
                                                                   value="<%= celular%>" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="correo">Correo:</label>
                                                            <input type="email" class="form-control" name="correo" id="correo"
                                                                   value="<%= correo%>" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="dni">DNI:</label>
                                                            <input type="text" class="form-control" name="dni" id="dni"
                                                                   value="<%= dni%>" required>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                        <button type="submit" class="btn btn-primary" name="accion" value="Editar">Guardar Cambios</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal fade" id="eliminarModal<%= idUsuario%>" tabindex="-1" role="dialog" aria-labelledby="confirmarEliminacionLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="confirmarEliminacionLabel">Confirmación de Eliminación</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    ¿Estás seguro de que deseas eliminar este usuario?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>

                                                    <!-- Formulario para enviar la solicitud de eliminación -->
                                                    <form action="<%= request.getContextPath()%>/controlador/ControladorUsuarios" method="post">
                                                        <input type="hidden" name="id" value="<%= idUsuario%>">
                                                        <button type="submit" name="accion" value="Eliminar" class="btn btn-danger">
                                                            Eliminar
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <%
                                            }
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                    </tbody>
                                </table>

                                <form action="<%= request.getContextPath()%>/controlador/ControladorUsuarios" method="post">
                                    <button type="submit" name="accion" value="exportarExcel" class="btn btn-success btn-sm">
                                        <i class="fas fa-file-excel"></i> Exportar Usuarios a Excel
                                    </button>
                                </form> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="../vendorAdmin/jquery/jquery.min.js"></script>
        <script src="../vendorAdmin/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="../vendorAdmin/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="../jsAdmin/sb-admin-2.min.js"></script>

    </body>
</html>

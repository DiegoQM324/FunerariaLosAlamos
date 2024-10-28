<%-- 
    Document   : AsesoresList
    Created on : 27 oct 2024, 12:47:01
    Author     : Acer
--%>

<%@page import="modelo.dto.Asesor"%>
<%@page import="java.util.List"%>
<%@page import="modelo.dao.AsesorDAO"%>
<%@page import="servicios.ConectaDB"%>
<%@page import="java.sql.*"%>
<%@page import="modelo.dto.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="../vendorAdmin/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../cssAdmin/sb-admin-2.min.css" rel="stylesheet">

        <title>Asesores</title>

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

                    <h1 class="h3 mb-4 text-gray-800">Lista de Asesores</h1>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Asesores Registrados</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-container">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID Asesor</th>
                                            <th>Nombre</th>
                                            <th>Apellidos</th>
                                            <th>Costo</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            // Obtener la lista de asesores desde el DAO
                                            AsesorDAO asesorDAO = new AsesorDAO();
                                            List<Asesor> asesores = asesorDAO.obtenerTodosLosAsesores();

                                            // Iterar sobre la lista de asesores y mostrarlos en la tabla
                                            for (Asesor asesor : asesores) {
                                        %>
                                        <tr>
                                            <td><%= asesor.getIdAsesor()%></td>
                                            <td><%= asesor.getNombreAse()%></td>
                                            <td><%= asesor.getApellidosAse()%></td>
                                            <td><%= asesor.getCosto()%></td>
                                            <td>
                                                <button class="btn btn-warning btn-sm" data-toggle="modal" 
                                                        data-target="#editarModal<%=asesor.getIdAsesor()%>">
                                                    <i class="fas fa-edit"></i> Editar
                                                </button>


                                                <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#eliminarModal<%=asesor.getIdAsesor()%>">
                                                    <i class="fas fa-trash-alt"></i> Eliminar
                                                </button>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>

                                        <!-- Modal de Edición -->
                                        <% for (Asesor asesor : asesores) {%>
                                    <div class="modal fade" id="editarModal<%= asesor.getIdAsesor()%>" tabindex="-1" role="dialog"
                                         aria-labelledby="editarAsesorLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="editarAsesorLabel">Editar Asesor</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form action="<%= request.getContextPath()%>/controlador/ControladorAsesores" method="post">
                                                    <div class="modal-body">
                                                        <input type="hidden" name="id_asesor" name="id_asesor" value="<%= asesor.getIdAsesor()%>">

                                                        <div class="form-group">
                                                            <label for="nombrease">Nombre:</label>
                                                            <input type="text" class="form-control" name="nombrease" id="nombrease" 
                                                                   value="<%= asesor.getNombreAse()%>" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="apellidosase">Apellidos:</label>
                                                            <input type="text" class="form-control" name="apellidosase" id="apellidosase" 
                                                                   value="<%= asesor.getApellidosAse()%>" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="costo">Costo:</label>
                                                            <input type="number" class="form-control" name="costo" id="costo" 
                                                                   value="<%= asesor.getCosto()%>" step="0.01" required>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                        <button type="submit" class="btn btn-primary" name="accion" value="Actualizar">Guardar Cambios</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <% }%>

                                    <% for (Asesor asesor : asesores) {%>
                                    <!-- Modal de Confirmación de Eliminación -->
                                    <div class="modal fade" id="eliminarModal<%= asesor.getIdAsesor()%>" tabindex="-1" role="dialog"
                                         aria-labelledby="confirmarEliminacionLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="confirmarEliminacionLabel">Confirmación de Eliminación</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    ¿Estás seguro de que deseas eliminar al asesor <strong><%= asesor.getNombreAse()%> <%= asesor.getApellidosAse()%></strong>?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>

                                                    <!-- Formulario para enviar la solicitud de eliminación -->
                                                    <form action="<%= request.getContextPath()%>/controlador/ControladorAsesores" method="post">
                                                        <input type="hidden" name="id_asesor" value="<%= asesor.getIdAsesor()%>">
                                                        <button type="submit" name="accion" value="Eliminar" class="btn btn-danger">
                                                            Eliminar
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <% }%>


                                    </tbody>
                                </table>

                                <form action="<%= request.getContextPath()%>/controlador/ControladorAsesores" method="post">
                                    <button type="submit" name="accion" value="exportarExcel" class="btn btn-success btn-sm">
                                        <i class="fas fa-file-excel"></i> Exportar Asesores a Excel
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

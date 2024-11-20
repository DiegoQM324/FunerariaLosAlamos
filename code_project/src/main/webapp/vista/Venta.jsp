<%-- 
    Document   : Venta
    Created on : 29 oct 2024, 11:33:10 p.m.
    Author     : seeke
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Funeraria Los Alamos</title>
        <meta name="description" content="">
        <meta name="keywords" content="">

        <!-- Favicons -->
        <link rel="apple-touch-icon" sizes="57x57" href="../img/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="../img/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="../img/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../img/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="../img/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../img/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="../img/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../img/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="../img/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192" href="../img/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="../img/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="../img/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../img/favicon-16x16.png">
        <link rel="manifest" href="../img/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Vendor CSS Files -->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="../vendor/aos/aos.css" rel="stylesheet">
        <link href="../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Main CSS File -->
        <link href="../css/main.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
    </head>
    <style>
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }

        .modal-content {
            background: rgb(0, 0, 0);
            padding: 20px;
            border-radius: 8px;
            max-width: 400px;
            width: 100%;
        }

        .modal-overlay.show {
            display: flex;
        }

        .captcha-container {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .captcha-display {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #007bff;
            color: white;
        }
    </style>


    <%

        String nombre = (String) session.getAttribute("nombreDifunto");
        String apellido = (String) session.getAttribute("apellidoDifunto");
        Date fechaNacimiento = (Date) session.getAttribute("fechaNacimientoDifunto");
        Date fechaFallecimiento = (Date) session.getAttribute("fechaFallecimientoDifunto");
        String lugarFallecimiento = (String) session.getAttribute("lugarFallecimientoDifunto");

    %>







    <body class="index-page">

        <header id="header" class="header d-flex align-items-center fixed-top">
            <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

                <a href="index.html" class="logo d-flex align-items-center">
                    <!-- Uncomment the line below if you also wish to use an image logo -->
                    <!-- <img src="assets/img/logo.png" alt=""> -->
                    <h1 class="sitename">Funeraria Los Alamos</h1> <span>.</span>
                </a>

                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li><a href="../index.jsp" >INICIO</a></li>
                        <li><a href="../vista/Nosotros.jsp">NOSOTROS</a></li>
                        <li><a href="../vista/Servicios.jsp">SERVICIOS</a></li>
                        <li><a href="../vista/Asesores.jsp">ACESORES</a></li>
                        <li><a href="../vista/Contacto.jsp">CONTACTO</a></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>
        </header>

        <main class="main">
            <!-- Page Title -->
            <div class="page-title dark-background" style="background-image: url(../img/page-title-bg.jpg);">
                <div class="container position-relative">
                    <h1>Proceso de Venta</h1>
                    <nav class="breadcrumbs">
                    </nav>
                </div>
            </div><!-- End Page Title -->
            <section id="proceso-venta" class="container mt-5">
                <div class="row">
                    <!-- Servicio Contratado -->
                    <div class="col-md-6 mb-4">
                        <h5>Servicio Contratado</h5>
                        <div class="list-group">
                            <li class="list-group-item" id="servicio-contratado">
                                <%= session.getAttribute("servicioContratado") != null ? session.getAttribute("servicioContratado") : "No se seleccionó un servicio"%>
                            </li>
                        </div>
                    </div>


                    <!-- Plan del Servicio -->
                    <div class="col-md-6 mb-4">
                        <h5>Plan del Servicio</h5>
                        <select id="plan-servicio" class="form-select" onchange="actualizarPlan()">
                            <option value="" disabled selected>Seleccione un plan</option>
                            <option value="Básico" data-price="100">Plan Básico - $100</option>
                            <option value="Estándar" data-price="200">Plan Estándar - $200</option>
                            <option value="Premium" data-price="300">Plan Premium - $300</option>
                        </select>
                        <p id="descripcion-plan" class="mt-3"></p>
                    </div>



                    <div class="row">
                        <!-- Datos del Cliente -->
                        <div class="col-md-6 mb-4">
                            <h5>Datos del Difunto</h5>
                            <form id="datos-cliente-form">
                                <div class="form-group">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" id="nombre" class="form-control" value="<%= nombre != null ? nombre : ""%>" required>
                                </div>
                                <div class="form-group">
                                    <label for="apellido">Apellido</label>
                                    <input type="text" id="apellido" class="form-control" value="<%= apellido != null ? apellido : ""%>" required>
                                </div>
                                <div class="form-group">
                                    <label for="fechaNac">Fecha de Nacimiento</label>
                                    <input type="date" id="fechaNac" class="form-control" value="<%= fechaNacimiento != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(fechaNacimiento) : ""%>" required>
                                </div>
                                <div class="form-group">
                                    <label for="fechaFall">Fecha de Fallecimiento</label>
                                    <input type="date" id="fechaFall" class="form-control" value="<%= fechaFallecimiento != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(fechaFallecimiento) : ""%>" required>
                                </div>
                                <div class="form-group">
                                    <label for="lugarFall">Lugar Fallecimiento</label>
                                    <input type="text" id="lugarFall" class="form-control" value="<%= lugarFallecimiento != null ? lugarFallecimiento : ""%>" required>
                                </div>
                            </form>
                        </div>






                        <!-- Métodos de Pago -->
                        <!-- Métodos de Pago -->
                        <div class="col-md-6 mb-4">
                            <h5>Métodos de Pago</h5>
                            <form id="form-metodo-pago">
                                <div class="mb-3">
                                    <label>Selecciona tu método de pago:</label>
                                    <div class="d-flex justify-content-between">
                                        <div class="tarjeta-opcion" style="cursor:pointer;">
                                            <img src="../img/16.png" alt="Visa" style="width: 50px;"
                                                 onclick="mostrarFormulario('visa')">
                                        </div>
                                        <div class="tarjeta-opcion" style="cursor:pointer;">
                                            <img src="../img/15.png" alt="MasterCard" style="width: 50px;"
                                                 onclick="mostrarFormulario('mastercard')">
                                        </div>
                                        <div class="tarjeta-opcion" style="cursor:pointer;">
                                            <img src="../img/17.png" alt="American Express" style="width: 50px;"
                                                 onclick="mostrarFormulario('amex')">
                                        </div>
                                        <div class="tarjeta-opcion" style="cursor:pointer;">
                                            <img src="../img/18.png" alt="Discover" style="width: 50px;"
                                                 onclick="mostrarFormulario('discover')">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">


                                    <!-- Imágenes de Métodos de Pago -->

                                    <!-- Formularios de Datos Adicionales -->
                                    <div id="formulario-adicional" style="display: none;">
                                        <div class="mb-3">
                                            <label for="nombre-titular" class="form-label">Nombre del Titular</label>
                                            <input type="text" class="form-control" id="nombre-titular" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="tarjeta" class="form-label">Número de Tarjeta</label>
                                            <input type="text" class="form-control" id="tarjeta" maxlength="16" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="cvv" class="form-label">CVV</label>
                                            <input type="text" class="form-control" id="cvv" maxlength="3" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="fecha-expiracion" class="form-label">Fecha de Expiración</label>
                                            <input type="month" class="form-control" id="fecha-expiracion" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="direccion-titular" class="form-label">Dirección del Titular</label>
                                            <input type="text" class="form-control" id="direccion-titular" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="telefono-titular" class="form-label">Teléfono del Titular</label>
                                            <input type="tel" class="form-control" id="telefono-titular" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="ciudad-titular" class="form-label">Ciudad</label>
                                            <input type="text" class="form-control" id="ciudad-titular" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="codigo-postal" class="form-label">Código Postal</label>
                                            <input type="text" class="form-control" id="codigo-postal" required>
                                        </div>
                                    </div>
                            </form>
                        </div>
                        <script>
                            let tarjetaSeleccionada = null; // Variable para almacenar la tarjeta seleccionada

                            function mostrarFormulario(tarjeta) {
                                const formulario = document.getElementById('formulario-adicional');

                                // Si la misma tarjeta se selecciona, ocultar el formulario
                                if (tarjetaSeleccionada === tarjeta) {
                                    formulario.style.display = 'none';
                                    tarjetaSeleccionada = null; // Resetear la tarjeta seleccionada
                                } else {
                                    formulario.style.display = 'block'; // Mostrar el formulario
                                    tarjetaSeleccionada = tarjeta; // Establecer la nueva tarjeta seleccionada


                                }
                            }
                        </script>
                        <div class="col-md-6 mb-4">
                            <h5>Total a Pagar:</h5>
                            <form id="form-datos-cliente">
                                <div class="mb-3">
                                    <label for="plan-escogido" class="form-label">Plan Escogido</label>
                                    <input type="text" class="form-control" id="plan-escogido" readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="precio" class="form-label">Precio:</label>
                                    <input type="text" class="form-control" id="precio" value="0" readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="total" class="form-label">Total a Pagar:</label>
                                    <input type="text" class="form-control" id="total" value="0" readonly>
                                </div>
                            </form>
                        </div>

                        <script>
                            function actualizarPlan() {
                                const planSelect = document.getElementById('plan-servicio');
                                const descripcionPlan = document.getElementById('descripcion-plan');
                                const planEscogidoInput = document.getElementById('plan-escogido');
                                const precioInput = document.getElementById('precio');
                                const totalInput = document.getElementById('total');

                                // Obtener el plan seleccionado
                                const planOpcion = planSelect.options[planSelect.selectedIndex];

                                const planNombre = planOpcion.value;
                                const precio = parseFloat(planOpcion.getAttribute('data-price')) || 0;

                                // Actualizar la descripción del plan
                                descripcionPlan.textContent = `Has seleccionado el ${planNombre}.`;

                                // Llenar el campo de Plan Escogido
                                planEscogidoInput.value = planNombre;

                                // Establecer el precio y el total
                                precioInput.value = precio.toFixed(2);
                                totalInput.value = precio.toFixed(2);
                            }
                        </script>
                        <div class="captcha-container">
                            <h2>CAPTCHA Verification</h2>
                            <div id="captcha-display" class="captcha-display"></div>
                            <input type="text" id="captcha-input" placeholder="Enter CAPTCHA" />
                            <button id="refresh-btn" onclick="generateCaptcha()">Refresh</button>
                            <button id="submit-btn" onclick="validateCaptcha()">Submit</button>
                            <p id="message"></p>
                        </div>
                        <script>
                            let captchaCode;

                            function generateCaptcha() {
                                const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                                captchaCode = '';
                                for (let i = 0; i < 6; i++) {
                                    captchaCode += characters.charAt(Math.floor(Math.random() * characters.length));
                                }
                                document.getElementById('captcha-display').textContent = captchaCode;
                                document.getElementById('captcha-input').value = ''; // Clear input field
                                document.getElementById('message').textContent = ''; // Clear message
                            }

                            function validateCaptcha() {
                                const userInput = document.getElementById('captcha-input').value;
                                const messageElement = document.getElementById('message');

                                if (userInput === captchaCode) {
                                    messageElement.textContent = 'CAPTCHA Matched!';
                                    messageElement.style.color = 'green';
                                } else {
                                    messageElement.textContent = 'CAPTCHA Not Matched. Try Again!';
                                    messageElement.style.color = 'red';
                                    generateCaptcha(); // Regenerate CAPTCHA on failure
                                }
                            }
                        </script>
                    </div>
                    <!-- Botón de Procesar Compra -->
                    <div class="text-center">
                        <button id="procesar-compra" class="btn btn-danger">Procesar Compra</button>
                    </div>
            </section>
        </main>

        <!-- Captcha y JavaScript -->
        <script>
            document.getElementById('plan-servicio').addEventListener('change', function () {
                const planSeleccionado = this.options[this.selectedIndex]; // Obtener la opción seleccionada
                const planNombre = planSeleccionado.value; // Obtener el nombre del plan
                const planPrecio = planSeleccionado.dataset.price;

                // Descripción del plan (puedes personalizarla como desees)
                let descripcion;
                switch (planNombre) {
                    case 'Básico':
                        descripcion = 'Incluye un servicio de sepultura básico con atención personalizada y un acompañamiento durante el proceso de despedida.';
                        break;
                    case 'Estándar':
                        descripcion = 'Ofrece un servicio de sepultura estándar, que incluye atención personalizada, soporte durante el proceso de planificación y un servicio con mayor confort para los familiares.';
                        break;
                    case 'Premium':
                        descripcion = 'Proporciona un servicio de sepultura premium, que incluye atención personalizada completa, gestión de todos los aspectos logísticos, un acompañamiento emocional y acceso a servicios exclusivos para honrar la memoria del ser querido.';
                        break;
                    default:
                        descripcion = '';
                        break;
                }

                // Actualizar el contenido del párrafo con la descripción y el precio
                document.getElementById('descripcion-plan').textContent = `${planNombre}: ${descripcion} Precio: $${planPrecio}`;
                    });



                    document.getElementById('procesar-compra').addEventListener('click', function () {
                        Swal.fire({
                            title: '¿Confirmar Compra?',
                            text: '¿Está seguro de contratar este servicio?',
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonText: 'Sí, confirmar',
                            cancelButtonText: 'Cancelar'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                // Genera el PDF de factura y lo descarga
                                const {jsPDF} = window.jspdf;
                                const doc = new jsPDF();

                                // Agregar contenido al PDF
                                doc.text(`Factura - Funeraria Los Alamos`, 10, 10);
                                doc.text(`Cliente: ${document.getElementById('nombre').value}`, 10, 20);
                                doc.text(`Email: ${document.getElementById('email').value}`, 10, 30);
                                doc.text(`Teléfono: ${document.getElementById('telefono').value}`, 10, 40);
                                doc.text(`Dirección: ${document.getElementById('direccion').value}`, 10, 50);
                                doc.text(`Ciudad: ${document.getElementById('ciudad').value}`, 10, 60);
                                doc.text(`Servicio: ${document.getElementById('plan-servicio').value}`, 10, 70);
                                doc.text(`Precio: $${document.getElementById('plan-servicio').selectedOptions[0].dataset.price}`, 10, 80);
                                doc.text(`Total a Pagar: $${document.getElementById('total').value}`, 10, 90);

                                // Guardar el PDF
                                doc.save('Factura_FunerariaLosAlamos.pdf');

                                // Redirigir a services.html
                                window.location.href = 'Servicios.jsp';

                                Swal.fire(
                                        '¡Servicio contratado con éxito!',
                                        'Su factura se ha descargado.',
                                        'success'
                                        );
                            }
                        });
                    });
        </script>
        <footer id="footer" class="footer dark-background">

            <div class="container footer-top">
                <div class="row gy-4">
                    <div class="col-lg-4 col-md-6 footer-about">
                        <a href="index.html" class="logo d-flex align-items-center">
                            <span class="sitename">Funeraria Los Alamos</span>
                        </a>
                        <div class="footer-contact pt-3">
                            <p>Av. Los Incas 108</p>
                            <p>Lima, PE 15001</p>
                            <p class="mt-3"><strong>Telefono:</strong> <span>+51 999 888 777</span></p>
                            <p><strong>Email:</strong> <span>Lamuerte@gmail.com</span></p>
                        </div>
                        <div class="social-links d-flex mt-4">
                            <a href=""><i class="bi bi-twitter-x"></i></a>
                            <a href=""><i class="bi bi-facebook"></i></a>
                            <a href=""><i class="fab fa-twitch"></i></a>
                            <a href=""><i class="fab fa-tiktok"></i></a>
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-3 footer-links">
                        <h4> Links Utiles</h4>
                        <ul>
                            <li><a href="#">Inicio</a></li>
                            <li><a href="#">NOSOTROS</a></li>
                            <li><a href="#">SERVICIOS</a></li>
                            <li><a href="#">Terminos y Servicios</a></li>
                            <li><a href="#">Privacy policy</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-2 col-md-3 footer-links">
                        <h4>Otros servicios</h4>
                        <ul>
                            <li><a href="#">Asesores</a></li>
                            <li><a href="#">Proximamente</a></li>
                            <li><a href="#">Proximamente</a></li>
                            <li><a href="#">Proximamente</a></li>
                            <li><a href="#">Proximamente</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="container copyright text-center mt-4">
                <p>© <span>Copyright</span> <strong class="px-1 sitename">LosAlamos S.A.C</strong> <span>All Rights
                        Reserved</span></p>
                <div class="credits">

                    Diseñado por <a href="#">El Colíder </a>
                </div>
            </div>

        </footer>

        <!-- Scroll Top -->
        <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Preloader -->


        <!-- Vendor JS Files -->
        <!-- Vendor JS Files -->
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../vendor/php-email-form/validate.js"></script>
        <script src="../vendor/aos/aos.js"></script>
        <script src="../vendor/glightbox/js/glightbox.min.js"></script>
        <script src="../vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
        <script src="../vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="../vendor/swiper/swiper-bundle.min.js"></script>
        <script src="../vendor/purecounter/purecounter_vanilla.js"></script>

        <!-- Main JS File -->
        <script src="../js/main.js"></script>

    </body>

</html>
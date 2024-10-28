<%-- 
    Document   : Contacto
    Created on : 22 oct 2024, 17:13:17
    Author     : Acer
--%>

<%@page import="modelo.dto.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Funeraria Los Alamos</title>


        <link rel="apple-touch-icon" sizes="57x57" href="../img/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="../img/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="../img/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../img/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="../img/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../img/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="../img/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../img/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="../img/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="../img/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="../img/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="../img/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../img/favicon-16x16.png">
        <link rel="manifest" href="../img/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">

        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


        <!-- Vendor CSS Files -->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="../vendor/aos/aos.css" rel="stylesheet">
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="../vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="../vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Main CSS File -->
        <link href="../css/main.css" rel="stylesheet">


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
        </style>




    </head>
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
                        <li><a href="../vista/Asesores.jsp">ASESORES</a></li>
                        <li><a href="../vista/Contacto.jsp">CONTACTO</a></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>
                <!-- Botón de Iniciar Sesión -->
                <%
                    Usuario usuarioAutenticado = (Usuario) session.getAttribute("usuarioAutenticado");
                    if (usuarioAutenticado != null) {
                        // Si el usuario ha iniciado sesión, muestra "Mi cuenta"
                        out.print("<li><a href='../vista/miCuenta.jsp'><i class='fas fa-user'></i> Mi cuenta</a></li>");
                    } else {
                        // Si no ha iniciado sesión, muestra "Iniciar Sesión" con el icono
                        out.print("<li><a href='vista/Iniciarsesion.jsp'><i class='fas fa-user'></i> Iniciar Sesión</a></li>");
                    }
                %>

              
                

            

            </div>
        </header>

        <main class="main">
            <!-- Page Title -->
            <div class="page-title dark-background" style="background-image: url(../img/page-title-bg.jpg);">
                <div class="container position-relative">
                    <h1>CONTACTO</h1>
                    <nav class="breadcrumbs">
                        <ol>
                            <li><a href="index.html">Inicio</a></li>
                            <li class="current">CONTACTO</li>
                        </ol>
                    </nav>
                </div>
            </div><!-- End Page Title -->

            <!-- Contact Section -->
            <section id="contact" class="contact section">

                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <div class="row gy-4">

                        <div class="col-lg-6">
                            <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="200">
                                <i class="bi bi-geo-alt"></i>
                                <h3>Direccion </h3>
                                <p>Jr. Carriquiry 240,San Isidro, Lima 27</p>
                            </div>
                        </div><!-- End Info Item -->

                        <div class="col-lg-3 col-md-6">
                            <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="300">
                                <i class="bi bi-telephone"></i>
                                <h3>LLamanos!</h3>
                                <p>+51 999 888 777</p>
                            </div>
                        </div><!-- End Info Item -->

                        <div class="col-lg-3 col-md-6">
                            <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="400">
                                <i class="bi bi-envelope"></i>
                                <h3>Correo Electronico</h3>
                                <p>Lamuerte@gmail.com</p>
                            </div>
                        </div><!-- End Info Item -->

                    </div>

                    <div class="row gy-4 mt-1">
                        <div class="col-lg-6" data-aos="fade-up" data-aos-delay="300">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d48389.78314118045!2d-74.006138!3d40.710059!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a22a3bda30d%3A0xb89d1fe6bc499443!2sCongreso%20de%20la%20Rep%C3%BAblica%20del%20Per%C3%BA!5e0!3m2!1ses!2spe!4v1690108728783!5m2!1ses!2spe" frameborder="0" style="border:0; width: 100%; height: 400px;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div><!-- End Google Maps -->

                        <div class="col-lg-6">
                            <form action="forms/contact.php" method="post" class="php-email-form" data-aos="fade-up" data-aos-delay="400">
                                <div class="row gy-4">

                                    <div class="col-md-6">
                                        <input type="text" name="name" class="form-control" placeholder="Nombre" required="">
                                    </div>

                                    <div class="col-md-6 ">
                                        <input type="email" class="form-control" name="email" placeholder="Correo" required="">
                                    </div>

                                    <div class="col-md-12">
                                        <input type="text" class="form-control" name="subject" placeholder="Problema o Duda" required="">
                                    </div>

                                    <div class="col-md-12">
                                        <textarea class="form-control" name="message" rows="6" placeholder="Mensaje mas detallado" required=""></textarea>
                                    </div>

                                    <div class="col-md-12 text-center">
                                        <div class="loading">Loading</div>
                                        <div class="error-message"></div>
                                        <div class="sent-message">Your message has been sent. Thank you!</div>

                                        <button type="submit">Mensaje enviado</button>
                                    </div>

                                </div>
                            </form>
                        </div><!-- End Contact Form -->

                    </div>

                </div>

            </section><!-- /Contact Section -->

        </main>


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
                            <li><a href="#">Inico</a></li>
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
                <p>© <span>Copyright</span> <strong class="px-1 sitename">LosAlamos S.A.C</strong> <span>All Rights Reserved</span></p>
                <div class="credits">

                    Diseñado por  <a href="#">El Colíder </a>
                </div>
            </div>

        </footer>

        <!-- Scroll Top -->
        <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Preloader -->
        <div id="preloader"></div>

        <!-- Vendor JS Files -->
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

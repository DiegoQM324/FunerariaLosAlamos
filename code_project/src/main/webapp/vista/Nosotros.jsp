<%-- 
    Document   : Nosotros
    Created on : 22 oct 2024, 17:12:43
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        
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
                        <li><a href="../vista/Nosotros.jsp" class="active">NOSOTROS</a></li>
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

                



                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

            </div>
        </header>


        <main class="main">

            <!-- Page Title -->
            <div class="page-title dark-background" style="background-image: url(../img/page-title-bg.jpg);">
                <div class="container position-relative">
                    <h1>Nosotros</h1>
                    <nav class="breadcrumbs">
                        <ol>
                            <li><a href="index.html">Inicio</a></li>
                            <li class="current">Nosotros</li>
                        </ol>
                    </nav>
                </div>
            </div><!-- End Page Title -->

            <!-- About Section -->
            <section id="about" class="about section">

                <div class="container">

                    <div class="row position-relative">

                        <div class="col-lg-7 about-img" data-aos="zoom-out" data-aos-delay="200"><img src="../img/about.jpg"></div>

                        <div class="col-lg-7" data-aos="fade-up" data-aos-delay="100">
                            <h2 class="inner-title">¿Que es Funeraria Los Alamos?</h2>
                            <div class="our-story">
                                <h4>Est 1988</h4>
                                <h3>Nuestra Historia</h3>
                                <p>En momentos de pérdida, cada historia cuenta. Nacimos con la misión de acompañar a las familias en su viaje de duelo, ofreciendo consuelo y dignidad. </p>
                                <ul>
                                    <li><i class="bi bi-check-circle"></i> <span>A lo largo de los años, hemos aprendido que el amor y la memoria son eternos</span></li>
                                    <li><i class="bi bi-check-circle"></i> <span>Cada vida merece ser celebrada con respeto y cuidado</span></li>
                                    <li><i class="bi bi-check-circle"></i> <span>Nuestra experiencia nos ha enseñado a escuchar, a entender y a servir con el corazón</span></li>
                                </ul>
                                <p>convirtiéndonos en un refugio para quienes buscan apoyo en los momentos más difíciles.</p>

                                <div class="watch-video d-flex align-items-center position-relative">
                                    <i class="bi bi-play-circle"></i>
                                    <a href="https://www.youtube.com/watch?v=Yjkg8LhVpRg" class="glightbox stretched-link">Mirar Video</a>
                                </div>

                            </div>
                        </div>

                    </div>

                </div>

            </section><!-- /About Section -->

            <!-- Stats Counter Section -->
            <section id="stats-counter" class="stats-counter section">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2>Nuestros Resultados</h2>
                    <p>Se muestran Los resultados de nuestros Servicios ejecutados</p>
                </div><!-- End Section Title -->

                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <div class="row gy-4">

                        <div class="col-lg-3 col-md-6">
                            <div class="stats-item d-flex align-items-center w-100 h-100">
                                <i class="bi bi-emoji-smile color-blue flex-shrink-0"></i>
                                <div>
                                    <span data-purecounter-start="0" data-purecounter-end="99999" data-purecounter-duration="1" class="purecounter"></span>
                                    <p>Clientes Felices</p>
                                </div>
                            </div>
                        </div><!-- End Stats Item -->

                        <div class="col-lg-3 col-md-6">
                            <div class="stats-item d-flex align-items-center w-100 h-100">
                                <i class="bi bi-journal-richtext color-orange flex-shrink-0"></i>
                                <div>
                                    <span data-purecounter-start="0" data-purecounter-end="1" data-purecounter-duration="1" class="purecounter"></span>
                                    <p>Servicios Contratados</p>
                                </div>
                            </div>
                        </div><!-- End Stats Item -->

                        <div class="col-lg-3 col-md-6">
                            <div class="stats-item d-flex align-items-center w-100 h-100">
                                <i class="bi bi-headset color-green flex-shrink-0"></i>
                                <div>
                                    <span data-purecounter-start="0" data-purecounter-end="24" data-purecounter-duration="1" class="purecounter"></span>
                                    <p>Horas trabajadas</p>
                                </div>
                            </div>
                        </div><!-- End Stats Item -->

                        <div class="col-lg-3 col-md-6">
                            <div class="stats-item d-flex align-items-center w-100 h-100">
                                <i class="bi bi-people color-pink flex-shrink-0"></i>
                                <div>
                                    <span data-purecounter-start="0" data-purecounter-end="3" data-purecounter-duration="1" class="purecounter"></span>
                                    <p>Trabajadores Totales</p>
                                </div>
                            </div>
                        </div><!-- End Stats Item -->

                    </div>

                </div>

            </section><!-- /Stats Counter Section -->

            <!-- Alt Services Section -->
            <section id="alt-services" class="alt-services section">

                <div class="container">

                    <div class="row justify-content-around gy-4">
                        <div class="features-image col-lg-6" data-aos="fade-up" data-aos-delay="100"><img src="../img/grupo.jpg" alt=""></div>

                        <div class="col-lg-5 d-flex flex-column justify-content-center" data-aos="fade-up" data-aos-delay="200">
                            <h3>Conoce a Nuestro Grupo de Asesores</h3>
                            <p>Este es nuestro grupo selecto de asesores, dedicados a brindarte apoyo y orientación en momentos difíciles con empatía y profesionalismo.</p>

                            <div class="icon-box d-flex position-relative" data-aos="fade-up" data-aos-delay="300">
                                <i class="bi bi-heart flex-shrink-0"></i>
                                <div>
                                    <h4><a href="" class="stretched-link">Empatía</a></h4>
                                    <p>Comprenden y sienten las emociones de los clientes, ofreciendo un apoyo sincero y humano.</p>
                                </div>
                            </div><!-- End Icon Box -->

                            <div class="icon-box d-flex position-relative" data-aos="fade-up" data-aos-delay="400">
                                <i class="bi bi-briefcase flex-shrink-0"></i>
                                <div>
                                    <h4><a href="" class="stretched-link">Experiencia</a></h4>
                                    <p>Cuentan con una sólida formación y experiencia en el manejo de situaciones delicadas.</p>
                                </div>
                            </div><!-- End Icon Box -->

                            <div class="icon-box d-flex position-relative" data-aos="fade-up" data-aos-delay="500">
                                <i class="bi bi-shield-check flex-shrink-0"></i>
                                <div>
                                    <h4><a href="" class="stretched-link">Compromiso</a></h4>
                                    <p>Están dedicados a ayudar a cada cliente, garantizando un servicio personalizado y atento.</p>
                                </div>
                            </div><!-- End Icon Box -->

                            <div class="icon-box d-flex position-relative" data-aos="fade-up" data-aos-delay="600">
                                <i class="bi bi-lock flex-shrink-0"></i>
                                <div>
                                    <h4><a href="" class="stretched-link">Confidencialidad</a></h4>
                                    <p>Respetan la privacidad y los sentimientos de los clientes, asegurando un entorno seguro y respetuoso.</p>
                                </div>
                            </div><!-- End Icon Box -->

                        </div>
                    </div>

                </div>

            </section><!-- /Alt Services Section -->

            <!-- Team Section -->
            <section id="team" class="team section">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2>Equipo </h2>
                    <p>Los encargados de que todo esto sea posible</p>
                </div><!-- End Section Title -->

                <div class="container">

                    <div class="row gy-5">

                        <div class="col-lg-4 col-md-6 member" data-aos="fade-up" data-aos-delay="100">
                            <div class="member-img">
                                <img src="../img/team/team-1.jpg" class="img-fluid" alt="">
                                <div class="social">
                                    <a href=""><i class="bi bi-twitter-x"></i></a>
                                    <a href=""><i class="bi bi-facebook"></i></a>
                                    <a href=""><i class="fab fa-twitch"></i></a>
                                    <a href=""><i class="fab fa-tiktok"></i></a>
                                </div>
                            </div>
                            <div class="member-info text-center">
                                <h4>Walter White</h4>
                                <span>Creador De la Empresa</span>
                                <p>Fundador de la Funeraria de los Alamos</p>
                            </div>
                        </div><!-- End Team Member -->

                        <div class="col-lg-4 col-md-6 member" data-aos="fade-up" data-aos-delay="200">
                            <div class="member-img">
                                <img src="../img/team/team-2.jpg" class="img-fluid" alt="">
                                <div class="social">
                                    <a href=""><i class="bi bi-twitter-x"></i></a>
                                    <a href=""><i class="bi bi-facebook"></i></a>
                                    <a href=""><i class="fab fa-twitch"></i></a>
                                    <a href=""><i class="fab fa-tiktok"></i></a>
                                </div>
                            </div>
                            <div class="member-info text-center">
                                <h4>Sarah Jhonson</h4>
                                <span>Especialista en ventas </span>
                                <p>Es especialista en todo tipo de ventas</p>
                            </div>
                        </div><!-- End Team Member -->

                        <div class="col-lg-4 col-md-6 member" data-aos="fade-up" data-aos-delay="300">
                            <div class="member-img">
                                <img src="../img/team/team-3.jpg" class="img-fluid" alt="">
                                <div class="social">
                                    <a href=""><i class="bi bi-twitter-x"></i></a>
                                    <a href=""><i class="bi bi-facebook"></i></a>
                                    <a href=""><i class="fab fa-twitch"></i></a>
                                    <a href=""><i class="fab fa-tiktok"></i></a>
                                </div>
                            </div>
                            <div class="member-info text-center">
                                <h4>William Anderson</h4>
                                <span>Especialista en ventas</span>
                                <p>Es especialista en todo tipo de ventas</p>
                            </div>
                        </div><!-- End Team Member -->

                        <div class="col-lg-4 col-md-6 member" data-aos="fade-up" data-aos-delay="400">
                            <div class="member-img">
                                <img src="../img/team/team-4.jpg" class="img-fluid" alt="">
                                <div class="social">
                                    <a href=""><i class="bi bi-twitter-x"></i></a>
                                    <a href=""><i class="bi bi-facebook"></i></a>
                                    <a href=""><i class="fab fa-twitch"></i></a>
                                    <a href=""><i class="fab fa-tiktok"></i></a>
                                </div>
                            </div>
                            <div class="member-info text-center">
                                <h4>Amanda Jepson</h4>
                                <span>Especialista en ventas</span>
                                <p>Es especialista en todo tipo de ventas</p>
                            </div>
                        </div><!-- End Team Member -->

                        <div class="col-lg-4 col-md-6 member" data-aos="fade-up" data-aos-delay="500">
                            <div class="member-img">
                                <img src="../img/team/team-5.jpg" class="img-fluid" alt="">
                                <div class="social">
                                    <a href=""><i class="bi bi-twitter-x"></i></a>
                                    <a href=""><i class="bi bi-facebook"></i></a>
                                    <a href=""><i class="fab fa-twitch"></i></a>
                                    <a href=""><i class="fab fa-tiktok"></i></a>
                                </div>
                            </div>
                            <div class="member-info text-center">
                                <h4>Brian Doe</h4>
                                <span>Marketing</span>
                                <p>Es especialista en todo tipo de ventas</p>
                            </div>
                        </div><!-- End Team Member -->

                        <div class="col-lg-4 col-md-6 member" data-aos="fade-up" data-aos-delay="600">
                            <div class="member-img">
                                <img src="../img/team/team-6.jpg" class="img-fluid" alt="">
                                <div class="social">
                                    <a href=""><i class="bi bi-twitter-x"></i></a>
                                    <a href=""><i class="bi bi-facebook"></i></a>
                                    <a href=""><i class="fab fa-twitch"></i></a>
                                    <a href=""><i class="fab fa-tiktok"></i></a>
                                </div>
                            </div>
                            <div class="member-info text-center">
                                <h4>Josepha Palas</h4>
                                <span>Accionista</span>
                                <p>Es la mayor accionista de la empresa 1%</p>
                            </div>
                        </div><!-- End Team Member -->

                    </div>

                </div>

            </section><!-- /Team Section -->


            <!-- Testimonials Section -->
            <section id="testimonials" class="testimonials section">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2>Testimonios Reales</h2>
                    <p>Una pequeña muestra de los resultados de nuestros servicios</p>
                </div><!-- End Section Title -->

                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <div class="swiper init-swiper">
                        <script type="application/json" class="swiper-config">
                            {
                            "loop": true,
                            "speed": 600,
                            "autoplay": {
                            "delay": 5000
                            },
                            "slidesPerView": "auto",
                            "pagination": {
                            "el": ".swiper-pagination",
                            "type": "bullets",
                            "clickable": true
                            },
                            "breakpoints": {
                            "320": {
                            "slidesPerView": 1,
                            "spaceBetween": 40
                            },
                            "1200": {
                            "slidesPerView": 2,
                            "spaceBetween": 20
                            }
                            }
                            }
                        </script>
                        <div class="swiper-wrapper">

                            <div class="swiper-slide">
                                <div class="testimonial-wrap">
                                    <div class="testimonial-item">
                                        <img src="../img/testimonials/putin.jpg" class="testimonial-img" alt="">
                                        <h3>Pablito </h3>
                                        <h4>Ceo &amp; Abogado</h4>
                                        <div class="stars">
                                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                        </div>
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i>
                                            <span>Cuando perdí a mi esposa, estaba completamente desorientado. Este servicio no solo se encargó de los detalles logísticos, sino que también me ofreció el apoyo necesario para sobrellevar mi duelo. Sin ellos, no sé cómo habría enfrentado esos días tan oscuros.</span>
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                    </div>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-wrap">
                                    <div class="testimonial-item">
                                        <img src="../img/testimonials/testimonio3.jpg" class="testimonial-img" alt="">
                                        <h3>María Gómez</h3>
                                        <h4>Psicóloga</h4>
                                        <div class="stars">
                                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                        </div>
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i>
                                            <span>En un momento de profunda tristeza tras la pérdida de un ser querido, el apoyo y la atención que recibí fueron invaluables. Este servicio me ayudó a encontrar la paz y el consuelo que necesitaba para seguir adelante.</span>
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                    </div>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-wrap">
                                    <div class="testimonial-item">
                                        <img src="../img/testimonials/testimonio2.jpg" class="testimonial-img" alt="">
                                        <h3>Ana Rodríguez</h3>
                                        <h4>Maestra de Kinder</h4>
                                        <div class="stars">
                                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                        </div>
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i>
                                            <span>La atención y el respeto que me brindaron en los momentos más difíciles de mi vida fueron excepcionales. Este servicio me ayudó a honrar la memoria de mi madre de la mejor manera posible, dándome la fortaleza que necesitaba.</span>
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                    </div>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-wrap">
                                    <div class="testimonial-item">
                                        <img src="../img/testimonials/testiomonio4.jpg" class="testimonial-img" alt="">
                                        <h3>Laura Fernández</h3>
                                        <h4>Enfermera</h4>
                                        <div class="stars">
                                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                        </div>
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i>
                                            <span>Perder a un familiar es devastador, pero contar con este servicio me permitió despedirme de mi padre de una manera hermosa y significativa. Su apoyo emocional fue un salvavidas en medio del dolor.</span>
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                    </div>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-wrap">
                                    <div class="testimonial-item">
                                        <img src="../img/testimonials/testimonio5.jpg" class="testimonial-img" alt="">
                                        <h3>Carlos Pérez</h3>
                                        <h4>Cocinero Profesional</h4>
                                        <div class="stars">
                                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                        </div>
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i>
                                            <span>Nunca pensé que podría lidiar con la muerte de mi hermano, pero el servicio me guió en cada paso. Me ayudaron a organizar todo y, sobre todo, me brindaron el apoyo emocional que tanto necesitaba.</span>
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                    </div>
                                </div>
                            </div><!-- End testimonial item -->

                        </div>
                        <div class="swiper-pagination"></div>
                    </div>

                </div>

            </section><!-- /Testimonials Section -->


        </main>

        <
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
        <!--<div id="preloader"></div>-->

        <!-- Vendor JS Files -->
        
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js" ></script>
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

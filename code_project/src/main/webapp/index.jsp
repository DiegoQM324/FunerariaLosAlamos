<%-- 
    Document   : index
    Created on : 22 oct 2024, 15:49:24
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


        <link rel="apple-touch-icon" sizes="57x57" href="img/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="img/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="img/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="img/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="img/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="img/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="img/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="img/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="img/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="img/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
        <link rel="manifest" href="img/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">

        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


        <!-- Vendor CSS Files -->

        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
        <link href="vendor/aos/aos.css" rel="stylesheet"/>


        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Main CSS File -->
        <link href="css/main.css" rel="stylesheet">
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
                    <h1 class="sitename">Funeraria Los Alamos</h1> <span>.</span>
                </a>

                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li><a href="index.html" class="active">INICIO</a></li>
                        <li><a href="vista/Nosotros.jsp">NOSOTROS</a></li>
                        <li><a href="vista/Servicios.jsp">SERVICIOS</a></li>
                        <li><a href="vista/Asesores.jsp">ASESORES</a></li>
                        <li><a href="vista/Contacto.jsp">CONTACTO</a></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>

                <!-- Botón de Iniciar Sesión -->




                <%
                    Usuario usuarioAutenticado = (Usuario) session.getAttribute("usuarioAutenticado");
                    if (usuarioAutenticado != null) {
                        // Si el usuario ha iniciado sesión, muestra "Mi cuenta"
                        out.print("<li><a href='vista/miCuenta.jsp'><i class='fas fa-user'></i> Mi cuenta</a></li>");
                    } else {
                        // Si no ha iniciado sesión, muestra "Iniciar Sesión" con el icono
                        out.print("<li><a href='vista/Iniciarsesion.jsp'><i class='fas fa-user'></i> Iniciar Sesión</a></li>");
                    }
                %>




                <!--<button id="loginButton" class="btn btn-dark">Iniciar Sesión</button>-->
                <!--<a href="vista/Iniciarsesion.jsp" class="btn btn-dark" role="button">Iniciar Sesión</a>-->





                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>



            </div>


        </header>


        <main class="main">

            <!-- Hero Section -->
            <section id="hero" class="hero section dark-background">

                <div class="info d-flex align-items-center">
                    <div class="container">
                        <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="100">
                            <div class="col-lg-6 text-center">
                                <h2>Bienvenido A Los Alamos</h2>
                                <p>Ofrecemos consuelo y apoyo en cada paso, asegurando un servicio respetuoso y personalizado en momentos difíciles.</p>
                                <a href="#get-started" class="btn-get-started">Empezemos el Recorrido </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="hero-carousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">

                    <div class="carousel-item">
                        <img src="img/hero-carousel/hero-carousel-1.jpg" alt="">
                    </div>

                    <div class="carousel-item active">
                        <img src="img/hero-carousel/hero-carousel-2.jpg" alt="">
                    </div>

                    <div class="carousel-item">
                        <img src="img/hero-carousel/hero-carousel-3.jpg" alt="">
                    </div>

                    <div class="carousel-item">
                        <img src="img/hero-carousel/hero-carousel-4.jpg" alt="">
                    </div>

                    <div class="carousel-item">
                        <img src="img/hero-carousel/hero-carousel-5.jpg" alt="">
                    </div>

                    <a class="carousel-control-prev" href="#hero-carousel" role="button" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
                    </a>

                    <a class="carousel-control-next" href="#hero-carousel" role="button" data-bs-slide="next">
                        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
                    </a>

                </div>

            </section><!-- /Hero Section -->

            <!-- Get Started Section -->
            <section id="get-started" class="get-started section">

                <div class="container">

                    <div class="row justify-content-between gy-4">

                        <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="100">
                            <div class="content">
                                <h3>¡No dudes es mandarnos todas tus insertidunbres!</h3>
                                <p>"Espacio creado para que puedas expresar tus dudas y recibir orientación personalizada en estos momentos difíciles."
                                </p>
                                <p>Completa los campos y recibe asesoramiento personalizado.</p>
                            </div>
                        </div>

                        <div class="col-lg-5" data-aos="zoom-out" data-aos-delay="200">
                            <form action="index.jsp" method="post" class="php-email-form">
                                <h3>"Un espacio para ti "</h3>
                                <p>"Solicita orientación" o "Recibe una consulta personalizada"</p>
                                <div class="row gy-3">

                                    <div class="col-12">
                                        <input type="text" name="name" class="form-control" placeholder="Nombres" required="">
                                    </div>

                                    <div class="col-12 ">
                                        <input type="email" class="form-control" name="email" placeholder="Correo Electronico" required="">
                                    </div>

                                    <div class="col-12">
                                        <input type="text" class="form-control" name="phone" placeholder="Telefono" required="">
                                    </div>

                                    <div class="col-12">
                                        <textarea class="form-control" name="message" rows="6" placeholder="Incertidumbre" required=""></textarea>
                                    </div>

                                    <div class="col-12 text-center">
                                        <div class="loading">Espere</div>
                                        <div class="error-message"></div>
                                        <div class="sent-message">Sus dudas han sido enviadas exitosamente. ¡Gracias!</div>

                                        <button type="submit">Enviar Incertidumbre</button>
                                    </div>

                                </div>
                            </form>
                        </div><!-- End Quote Form -->

                    </div>

                </div>

            </section><!-- /Get Started Section -->

            <!-- Constructions Section -->
            <section id="constructions" class="constructions section">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2>Nuestros Servicios</h2>
                    <p>Brindamos atención personalizada y acompañamiento integral en momentos difíciles con un enfoque humano y profesional.</p>
                </div><!-- End Section Title -->

                <div class="container">

                    <div class="row gy-4">

                        <div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
                            <div class="card-item">
                                <div class="row">
                                    <div class="col-xl-5">
                                        <div class="card-bg"><img src="img/constructions-1.jpg" alt=""></div>
                                    </div>
                                    <div class="col-xl-7 d-flex align-items-center">
                                        <div class="card-body">
                                            <h4 class="card-title">Sepulturas</h4>
                                            <p>Ofrecemos sepulturas en terrenos dignos y tranquilos, diseñados para honrar la memoria de tus seres queridos con respeto y solemnidad.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- End Card Item -->

                        <div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
                            <div class="card-item">
                                <div class="row">
                                    <div class="col-xl-5">
                                        <div class="card-bg"><img src="img/constructions-2.jpg" alt=""></div>
                                    </div>
                                    <div class="col-xl-7 d-flex align-items-center">
                                        <div class="card-body">
                                            <h4 class="card-title">Cremaciones</h4>
                                            <p>Nuestra opción de cremación proporciona una alternativa respetuosa y significativa, con servicios personalizados que permiten recordar a quienes hemos perdido.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- End Card Item -->

                        <div class="col-lg-6" data-aos="fade-up" data-aos-delay="300">
                            <div class="card-item">
                                <div class="row">
                                    <div class="col-xl-5">
                                        <div class="card-bg"><img src="img/constructions-3.jpg" alt=""></div>
                                    </div>
                                    <div class="col-xl-7 d-flex align-items-center">
                                        <div class="card-body">
                                            <h4 class="card-title">Traslados</h4>
                                            <p>Realizamos traslados con cuidado y profesionalismo, garantizando que tus seres queridos sean llevados a su destino final de manera digna y segura.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- End Card Item -->

                        <div class="col-lg-6" data-aos="fade-up" data-aos-delay="400">
                            <div class="card-item">
                                <div class="row">
                                    <div class="col-xl-5">
                                        <div class="card-bg"><img src="img/constructions-4.jpg" alt=""></div>
                                    </div>
                                    <div class="col-xl-7 d-flex align-items-center">
                                        <div class="card-body">
                                            <h4 class="card-title">Ceremonia Pre Sepultura</h4>
                                            <p>Organizamos ceremonias pre sepultura que rinden homenaje a la vida del fallecido, brindando un espacio para la reflexión y el apoyo familiar.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- End Card Item -->

                    </div>

                </div>

            </section><!-- /Constructions Section -->


            <!-- Alt Services Section -->
            <section id="alt-services" class="alt-services section">

                <div class="container">

                    <div class="row justify-content-around gy-4">
                        <div class="features-image col-lg-6" data-aos="fade-up" data-aos-delay="100"><img src="img/grupo.jpg" alt=""></div>

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
                                        <img src="img/testimonials/putin.jpg" class="testimonial-img" alt="">
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
                                        <img src="img/testimonials/testimonio3.jpg" class="testimonial-img" alt="">
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
                                        <img src="img/testimonials/testimonio2.jpg" class="testimonial-img" alt="">
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
                                        <img src="img/testimonials/testiomonio4.jpg" class="testimonial-img" alt="">
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
                                        <img src="img/testimonials/testimonio5.jpg" class="testimonial-img" alt="">
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
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/aos/aos.js" ></script>
        <script src="vendor/glightbox/js/glightbox.min.js"></script>
        <script src="vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
        <script src="vendor/isotope-layout/isotope.pkgd.min.js" ></script>
        <script src="vendor/swiper/swiper-bundle.min.js"></script>
        <script src="vendor/purecounter/purecounter_vanilla.js"></script>

        <!-- Main JS File -->
        <script src="js/main.js"></script>

    </body>
</html>


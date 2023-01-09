<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/agendamientos.css">
    <title>Title</title>
</head>
<body>
    <!-- Barra de navegacion -->
    <nav id="barrita" class="navbar navbar-expand-lg py-4 px-4">
        <div class="container-fluid">
            <a id="nombrePagina" class="navbar-brand" href=""><span id="agendalo">Agendalo</span><span
                    id="max">Max</span></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Botones y links -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" aria-current="page"
                            href="/home">Home</a></li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            Dropdown
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <c:choose>
                        <c:when test="${!empresa.empresafree}">
                            <li class="nav-item text-danger mt-2">Cuenta premium!</li>
                        </c:when>
                    </c:choose>
                </ul>
                <!-- Buscadores de Servicios-->
                <form style="width: 700px ;" class="d-flex me-4 ms-1" role="search" method="POST"
                    action="/search">
                    <select class="form-select me-2" name="selectReg" id="selectReg">
                        <option value="0"> Region</option>
                        <c:forEach items="${regiones}" var="region">
                            <option value="${region.id}">${region.nombre}</option>
                        </c:forEach>
                    </select>
                    <select class="form-select me-2" name="selectCiud" id="selectCiud">
                        <option value="0">Ciudad</option>
                    </select>
                    <input class="form-control me-2" id="buscador" type="search" name="servicio"
                        placeholder="Search" aria-label="Search">
                    <button class="btn botones" type="submit">Search</button>
                </form>

                <div class="nav-item dropdown">
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/logout">Logout</a></li>
                        <c:if test="${usuario.getEmpresa() != null}">
                            <li><a class="dropdown-item" href="/plan/${empresa.id}">tu empresa</a></li>
                        </c:if>

                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Editar perfil</a></li>
                    </ul>
                    <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                        <c:out value="${usuario.nombre}" />
                    </a>
                </div>
            </div>
        </div>
    </nav>
    

    <div id="" class="modal modal--lg modal-palette-not-premium-user active">
        <div class="modal__container">
            <div class="content text__general--heading">
                <button class="modal__close modal__close--absolute modal__close--top-right button button--icon button--icon--only button--sm button--inverted nostyle">
                    <i class="icon icon--lg icon--mg-lg icon--cross"></i>
                </button>
                <div class="image-box">
    
                </div>
                <div class="text-box">
                    <p class="font-xl bold mg-bottom-lv2">Crea paletas personalizadas y disfruta de otras ventajas con Premium</p>
                    <p class="font-md">Suscríbete desde 7.50/EUR/mes y accede a:</p>
                    <div class="feature"><i class="icon icon--lg icon--check mg-right-lv2"></i><p class="font-sm mg-bottom-lv1">8.9M iconos y stickers en formato SVG, EPS, PSD y BASE64</p></div>
                    <div class="feature"><i class="icon icon--lg icon--check mg-right-lv2"></i><p class="font-sm mg-bottom-lv1">Sin atribución requerida</p></div>
                    <div class="feature"><i class="icon icon--lg icon--check mg-right-lv2"></i><p class="font-sm mg-bottom-lv1">Descargas y colecciones ilimitadas</p></div>
                    <div class="feature"><i class="icon icon--lg icon--check mg-right-lv2"></i><p class="font-sm mg-bottom-lv1">Uso ilimitado del editor</p></div>
                    <div class="feature"><i class="icon icon--lg icon--check mg-right-lv2"></i><p class="font-sm mg-bottom-lv1">Soporte prioritario</p></div>
                    <div class="feature"><i class="icon icon--lg icon--check mg-right-lv2"></i><p class="font-sm mg-bottom-lv3">Sin publicidad</p></div>
                    <a href="https://www.flaticon.es/pricing" class="bj-button bj-button--yellow full-width">Hazte premium</a>
                </div>
            </div>
        </div>
    </div>


    
    <div id="banner">
        <img src="/imagenes/organizador.png" alt="">
    </div>

    <div class="container mt-5">
        <h1 class="border-bottom text-center mb-4 pb-3">Tus horas Agendadas</h1>

    <table class="table">
        <thead>
            <tr>
                <th>Servicio</th>
                <th>Empresa</th>
                <th>Fecha</th>
                <th>Precio</th>
                <th>Contactar con la empresa</th>
                <th>Desagendar Hora</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${usuario.horarios}" var="horaAgendada">
            <tr>
                <td>${horaAgendada.getServicio().getServicioOfrecido()}</td>
                <td>${horaAgendada.getServicio().getEmpresa().getNombre()}</td>
                <td><fmt:formatDate value="${horaAgendada.getFechaAsDate()}" pattern="HH:mm:ss"/></td>
                <td>precio</td>
                <td>${horaAgendada.getServicio().getEmpresa().getUsuarioAdmin().getEmail()}</td>
                <td><a class="" href="/cancela/cita/${usuario.id}/${horaAgendada.id}">Cancelar cita</a></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>

    </div>
    

    


    <footer class="text-center text-lg-start text-muted">
        <!-- Section: Social media -->
        <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
            <!-- Left -->

            <div class="sub-texto">
                <span>Conectate con nosotros en redes sociales</span>
            </div>
            <!-- Left -->

            <!-- Right -->
            <div class="">
                <a href="" class="link-secondary">
                    <i class="fab fa-facebook-f"><img src="/imagenes/facebook.png" alt="facebook"></i>
                </a>
                <a href="" class="link-secondary">
                    <i class="fab fa-twitter"><img src="/imagenes/twitter.png" alt="twitter"></i>
                </a>
                <a href="" class="link-secondary">
                    <i class="fab fa-google"><img src="/imagenes/google-plus.png" alt="google"></i>
                </a>
                <a href="" class="link-secondary">
                    <i class="fab fa-instagram"><img src="/imagenes/instagram.png" alt="instagram"></i>
                </a>
                <a href="" class="link-secondary">
                    <i class="fab fa-linkedin"><img src="/imagenes/linkedin.png" alt="linkedin"></i>
                </a>
                <a href="" class="link-secondary">
                    <i class="fab fa-github"><img src="/imagenes/github.png" alt="github"></i>
                </a>
            </div>
            <!-- Right -->
        </section>
        <!-- Section: Social media -->

        <!-- Section: Links  -->
        <section class="section-part" id="footersito">
            <div class="container text-center text-md-start mt-5">
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <!-- Content -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            <i class="fas fa-gem me-3 text-secondary"></i>Agendalomax
                        </h6>
                        <p>
                            Nos encargamos de agendar tus horas con el servicio que brindes o necesites.
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Informacion
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Sobre nosotros</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Privacidad</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Marco legal</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Terminos y condiciones</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Links útiles
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Ayuda</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Configuración</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Trabaja con nosotros</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Otros</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">Contacto</h6>
                        <p><i class="fas fa-home me-3 text-secondary"></i> Santiago, ST 10012, CL</p>
                        <p>
                            <i class="fas fa-envelope me-3 text-secondary"></i>
                            agendalomax@example.com
                        </p>
                        <p><i class="fas fa-phone me-3 text-secondary"></i> + 01 234 567 89</p>
                        <p><i class="fas fa-print me-3 text-secondary"></i> + 01 234 567 80</p>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Links  -->

        <!-- Copyright -->
        <div class="text-center p-4" style="background-color: rgb(189, 179, 254);">
            www.agendalomax.cl © 2022 :
            <a class="text-reset fw-bold" href="https://mdbootstrap.com/"> Encuentra tu servicio y pide
                cita</a>
        </div>
        <!-- Copyright -->
    </footer>

    <script>
        //Mapeo de variable para archivo servicio.js
        var regionesConAscii = '<c:out value="${regionesJson}"/>'
    </script>
    <script type="text/javascript" src="/js/servicio.js"></script>

</body>
</html>

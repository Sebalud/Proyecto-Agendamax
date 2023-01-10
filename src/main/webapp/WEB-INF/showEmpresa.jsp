<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< Updated upstream
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&family=Playfair+Display:ital,wght@1,500&display=swap"
                    rel="stylesheet">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@1000&display=swap" rel="stylesheet">
                <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                    crossorigin="anonymous">
                <link rel="stylesheet" type="text/css" href="/css/showEmpresa.css">
                <title>Empresa FREE</title>
            </head>
            <body class="">
                <!-- Barra de navegacion -->
                <nav id="barrita" class="navbar navbar-expand-lg py-4 px-4 mb-5">
                    <div class="container-fluid">
                        <a id="nombrePagina" class="navbar-brand" href=""><span id="agendalo">Agéndalo</span><span
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
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&family=Playfair+Display:ital,wght@1,500&display=swap"
        rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@1000&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/showEmpresa.css">
    <title>Empresa FREE</title>
</head>

<body class="">
    <!-- Barra de navegacion -->
    <nav id="barrita" class="navbar navbar-expand-lg py-4 px-4 mb-5">
        <div class="container-fluid">
            <a id="nombrePagina" class="navbar-brand" href=""><span id="agendalo">Agendalo</span><span
                    id="max">Max</span></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Botones y links -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/home">Home</a></li>

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
                <form style="width: 700px ;" class="d-flex me-4 ms-1" role="search" method="POST" action="/search">
                    <select class="form-select me-2" name="selectReg" id="selectReg">
                        <option value="0"> Region</option>
                        <c:forEach items="${regiones}" var="region">
                            <option value="${region.id}">${region.nombre}</option>
                        </c:forEach>
                    </select>
                    <select class="form-select me-2" name="selectCiud" id="selectCiud">
                        <option value="0">Ciudad</option>
                    </select>
                    <input class="form-control me-2" id="buscador" type="search" name="servicio" placeholder="Search"
                        aria-label="Search">
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
                    <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <c:out value="${usuario.nombre}" />
                    </a>
                </div>
            </div>
        </div>
    </nav>
    <!-- Contenido-->
    <div class="container d-flex my-5">
        <div id="carouselExampleDark" class="carousel carousel-dark slide me-5" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="10000">
                    <img src="/imagenes/calendario.png" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>First slide label</h5>
                        <p>gestiona tu empresa con nosotros, facil y rapido</p>
>>>>>>> Stashed changes
                    </div>
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <img src="/imagenes/ejemplo2.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Second slide label</h5>
                        <p>Some representative placeholder content for the second slide.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="/imagenes/ejemplo1.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Third slide label</h5>
                        <p>Some representative placeholder content for the third slide.</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div id="ladoCarrusel" class="ml-5">
            <h1>Bienvenido/da
                <c:out value="${empresa.usuarioAdmin.nombre} ${empresa.usuarioAdmin.apellido} " />
            </h1>
            <p>Aqui podras configurar y visualizar los servicios que ofrece tu empresa, revisar el
                agendamiento de cada uno, editar los datos de tu empresa.</p>
            <h2>El detalle de tu empresa:
                <c:out value="${empresa.nombre}" />
            </h2>
            <p>Rut:
                <c:out value="${empresa.rut}" />
            </p>

            <!-- Eliminar Empresa -->
            <button type="button" class="btn botones px-4 py-2" data-bs-toggle="modal" data-bs-target="#exampleModal4">
                Eliminar Empresa
            </button>

            <!-- Modal -->
            <div class="modal fade " id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content" style="background-color: #1D2226; color: aliceblue;">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            ¿Estas seguro/a de que quieres eliminar tu empresa?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn botones" data-bs-dismiss="modal">Cancelar</button>
                            <a class="btn botones" href="/delete/${empresa.id}">Aceptar</a>
                        </div>
                    </div>
                </div>
            </div>

            <a class="btn botones px-4 py-2" href="/plan/${empresa.id}/edit">Edita Tu Empresa</a>
        </div>
    </div>

    <main>
            <div class="form-body d-flex">
                <h1 id="alLadoServicio">
                    Crea un servicio que sea <span class="letraDif fw-bold">representativo</span> y <span
                        class="letraDif fw-bold">llamativo</span>, que los clientes facilmente puedan encontrar.
                </h1>
                <c:choose>
                    <c:when test="${(empresa.servicios.size() < 1 && empresa.empresafree) || !empresa.empresafree}">
                        <div class="form-holder">
                            <div class="form-content">
                                <div class="form-items">
                                    <h3>Crear Servicio</h3>
                                    <p>Escoge un servicio para tu empresa</p>
                                    <form:form action="" method="POST" modelAttribute="servicio"
                                        cssClass="container form ancho" enctype="multipart/form-data">
                                        <div class="col-md-12">
                                            <form:input cssClass="form-control" type="text" path="servicioOfrecido"
                                                placeholder="Nombre del servicio" />
                                            <form:errors cssClass="text-danger" path="servicioOfrecido" />
                                        </div>

                                        <div class="col-md-12">
                                            <form:errors cssClass="text-danger" path="direction" />
                                            <form:input cssClass="form-control" path="direction" placeholder="Adress" />
                                        </div>

                                        <div class="col-md-12">
                                            <form:errors cssClass="text-danger" path="precio" />
                                            <form:input cssClass="form-control" path="precio" placeholder="Price" />
                                        </div>

                                        <div class="col-md-12">
                                            <form:select class="form-select mt-3" path="horaInicio">
                                                <form:errors path="horaInicio" />
                                                <option selected disabled value="">Hora de inicio</option>
                                                <form:option value="6">6 AM</form:option>
                                                <form:option value="7">7 AM</form:option>
                                                <form:option value="8">8 AM</form:option>
                                                <form:option value="9">9 AM</form:option>
                                                <form:option value="10">10 AM</form:option>
                                                <form:option value="11">11 AM</form:option>
                                                <form:option value="12">12 AM</form:option>
                                                <form:option value="13">13 PM</form:option>
                                            </form:select>
                                        </div>

                                        <div class="col-md-12">
                                            <form:select class="form-select mt-3" path="horaTermino"
                                                placeholder="Hora termino">
                                                <form:errors path="horaTermino" />
                                                <option selected disabled value="">Hora de termino</option>
                                                <form:option value="14">14 PM</form:option>
                                                <form:option value="15">15 PM</form:option>
                                                <form:option value="16">16 PM</form:option>
                                                <form:option value="17">17 PM</form:option>
                                                <form:option value="18">18 PM</form:option>
                                                <form:option value="19">19 PM</form:option>
                                                <form:option value="20">20 PM</form:option>
                                            </form:select>
                                        </div>

                                        <div class="col-md-12">
                                            <form:select class="form-select" path="duracionServicio">
                                                <form:errors path="duracionServicio" />
                                                <option selected disabled value="">Duracion de servicio</option>
                                                <form:option value="20">20 min</form:option>
                                                <form:option value="30">30 min</form:option>
                                                <form:option value="60">60 min</form:option>
                                            </form:select>
                                        </div>
                                        <input type="file" name="postFile">
                                        <div class="form-button mt-3">
                                            <input id="submit" class="btn btn-primary" type="submit" value="servicio" />
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>

            </div>
            </c:when>
            <c:when test="${empresa.servicios.size() == 1 && empresa.empresafree}">
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#Modal1">
                    Cambiarse a premium
                </button>

                <div class="modal fade modal-xl" id="Modal1" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Plan premium</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                muuuuuuuuucho texto del plan premium,
                                que consiste
                                cuánto cuesta y demás
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                    data-bs-dismiss="modal">Cancelar</button>
                                <a class="btn btn-primary" href="/premium/${empresa.id}">Aceptar</a>
                                <a href="">
                                    <div class="modal-dialog modal-sm">...</div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            </c:choose>

            <table class="table container my-5">
                <h1 class="container mt-5 border-bottom">Resumen</h1>
                <thead>
                    <tr>
                        <th class="">Servicio</th>
                        <th>Duracion de Servicio</th>
                        <th>Ciudad</th>
                        <th>Accion</th>
                        <th>Hacer Horario</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${empresa.servicios}" var="servicio">
                        <tr>

                            <td colspan="">
                                <c:out value="${servicio.servicioOfrecido}" />
                            </td>
                            <td>
                                <c:out value="${servicio.duracionServicio}" /> min
                            </td>
                            <td colspan="">
                                <c:out value="${empresa.ciudad.nombre}" />
                            </td>
                            <td><!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#${servicio.id}">
                                    Eliminar
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="${servicio.id}" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content" style="background-color: #1D2226; color: aliceblue;">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar
                                                </h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                ¿Seguro que deseas eliminar el servicio de tu empresa?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn botones"
                                                    data-bs-dismiss="modal">Cancelar</button>
                                                <a class="btn botones"
                                                    href="/delete/${empresa.id}/${servicio.id}">Eliminar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <a class="btn botones" href="/empresa/horario/${empresa.id}/${servicio.id}">Ver
                                    agenda</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

    </main>

    <footer class="text-center text-lg-start text-muted">
        <!-- Section: Social media -->
        <div id="barrita" style="background-color: rgb(189, 179, 254);">
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
        </div>
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
                            <i class="fas fa-gem me-3 text-secondary"></i>Agéndalomax
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

        const select = document.querySelector('#servicioElegido');
        const container = document.querySelector('#form');

        // Establecer el manejador de eventos para el evento change del select
        select.addEventListener('change', () => {
            // Verificar si la opción seleccionada es la que deseas
            if (select.value === 'opcionEspecial') {
                // Crear el nuevo elemento input
                const input = document.createElement('input');

                // Establecer cualquier atributo o propiedad que desees para el nuevo elemento
                input.type = 'text';
                input.placeholder = 'Escribe algo aquí';
                input.name = 'nuevoServicio';

                // Agregar el nuevo elemento al contenedor
                container.appendChild(input);
            }

            /*   if (select.value === 'opcionEspecial') {
                // Mostrar el elemento input
                input.style.display = 'block';
            } else {
                // Ocultar el elemento input
                input.style.display = 'none';
            } */
        });
    </script>
    <script>
        //Mapeo de variable para archivo servicio.js
        var regionesConAscii = '<c:out value="${regionesJson}"/>'
    </script>
    <script type="text/javascript" src="/js/servicio.js"></script>
    <!-- Footer -->
</body>

</html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,400;0,500;0,600;0,900;0,1000;1,200;1,800;1,900;1,1000&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/horaDisponible.css">
    <title>Empresa FREE</title>
</head>
<body>
    
    <nav class="navbar navbar-expand-lg ">
        <div class="container-fluid">
            <a id="nombrePagina" class="navbar-brand" href="/home">
                <span id="agendalo">Agéndalo</span>
                <span id="max">Max</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <!--mostrar boton de crear empresa solo si no tiene ninguna empresa -->
                        <c:choose>
                            <c:when test="${usuario.empresa == null}">
                                <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="crea-empresa">
                                    Crear Empresa
                                </button>
                                <!-- Modal -->
                                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                                    tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Crear Empresa</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Poner info de las caracteristicas de la empresa, cuales son los derechos y deberes del
                                                propietario
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                <a class="btn btn-black" href="/planes">Aceptar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                        </c:choose>
                    </li>
                </ul>
                <!-- Buscadores de Servicios-->
                <form class="d-flex" role="search" method="POST" action="/search" id="barrita">
                    <select class="me-2 form-select" name="selectReg" id="selectReg">
                        <option value="0">Región</option>
                        <c:forEach items="${regiones}" var="region">
                            <option value="${region.id}">${region.nombre}</option>
                        </c:forEach>
                    </select>
                    <select class="me-2 form-select" name="selectCiud" id="selectCiud">
                        <option value="0">Ciudad</option>
                    </select>
                    <input class="form-control me-2" type="search" name="servicio" placeholder="Inserte servicio" aria-label="Search">
                    <button class="btn botones" type="submit">Buscar</button>
                </form>
                <div class="nav-item dropdown" id="usuario-nombre">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <c:out value="${usuario.nombre}"/>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/logout">Log out</a></li>
                        <c:if test="${usuario.getEmpresa() != null}">
                            <li><a class="dropdown-item" href="/plan/${usuario.getEmpresa().getId()}">Tu empresa</a></li>
                        </c:if>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="/perfil/${usuario.id}">Editar perfil</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <div class="d-flex" id="bannerArriba">
        <div id="imagenBanner">
            <img src="/imagenes/vision-de-la-empresa.png" alt="">
        </div>
<<<<<<< HEAD

        <h1 class="my-auto fw-bolder" id="infoBanner">Revisa quien agendó horas fácil y rápido, personaliza tus horas para los 7 días siguientes. </h1>
    </div>
    
 
    <h1 id="" class="text-center my-5 pb-3 border-bottom fw-bolder  container">Gestión de horas disponibles para el servicio ${servicio.servicioOfrecido}</h1>
        <table class="table container mb-5" id="tabla">
            
=======
        <h1 class="my-auto fw-semibold" id="infoBanner">Revisa quien agendó horas fácil y rápido, personaliza tus horas para los 7 días siguientes. </h1>
    </div>
    
 
    <h1 class="text-center my-5 pb-3 border-bottom fw-semibold container">Gestión de horas disponibles para el servicio ${servicio.servicioOfrecido}</h1>
    <table class="table container mb-5" id="tabla">
>>>>>>> bbc59f67b59df14153e62ceb503292608f835ea9
        <thead>
            <tr>
                <th>Campos</th>
                <th>Valor</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Duración de Servicio </td>
                <td>${servicio.duracionServicio}</td>
            </tr>
            <tr>
                <td>Hora de inicio</td>
                <td>${servicio.horaInicio} hras</td>
            </tr>
            <tr>
                <td>Hora de término </td>
                <td>${servicio.horaTermino} hras</td>
            </tr>
            <tr>
                <td>Duración de jornada</td>
                <td>${servicio.duracionJornada} horas</td>
            </tr>
            <tr>
                <td>Horas no agendables para el cliente</td>
                <td class="bg-danger"></td>
            </tr>
            <tr>
                <td>Horas agendadas por cliente</td>
                <td class="bg-success"></td>
            </tr>
        </tbody>
    </table>


    <c:if test="${servicio.getHoraInicio() == 0 && servicio.getHoraTermino == 0}">
        <form:form action="" method="POST" modelAttribute="horario" cssClass="container form ancho">
            <p class="form-outline">
                <form:label cssClass="form-label"  path="horaDisponible">hora Disponible</form:label>
                <form:errors cssClass="text-danger" path="horaDisponible"/>
                <form:input cssClass="form-control" type="date" path="horaDisponible"/>
            </p>
            <input class="btn btn-outline-secondary" type="submit" value="Aceptar cambios"/>
        </form:form>
    </c:if>

    <div class="container  mw-100 my-5">
        <div class="container text-center d-flex justify-content-center rounded" id="targeta">
            <c:forEach  items="${listaAlModel}" var="dia">
                <div class="mx-4 my-4 d-inline-block col">
                    <p class="border p-2"><fmt:formatDate value="${dia.get(1).getDate()}" pattern="EEEE dd"/><br></p>
                    <c:forEach items="${dia}" var="horarioDisponible">
                        <c:if test="${horarioDisponible.getEstaActivo() && horarioDisponible.getHoraAgendadaByCliente() == 0}">
                            <a class="btn my-1 text-capitalize" style="background-color: #BDB3FE;" href="/agendar/${servicio.id}/${horarioDisponible.getDate().getTime()}">
                                <fmt:formatDate value="${horarioDisponible.date}" pattern="HH:mm:ss"/>
                            </a><br>
                        </c:if>
                        <c:if test="${!horarioDisponible.getEstaActivo() && horarioDisponible.getHoraAgendadaByCliente() == 1}">
                            <a href="/agendar/${servicio.id}/${horarioDisponible.getDate().getTime()}" class="btn btn-danger my-1" >
                                habilitar </a><br>
                        </c:if>
                        <c:if test="${!horarioDisponible.getEstaActivo() && horarioDisponible.getHoraAgendadaByCliente() == 2}">
                            <a href="/agendar/${servicio.id}/${horarioDisponible.getDate().getTime()}" class="btn btn-success my-1" >
                                ver cliente </a><br>
                        </c:if>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>
    </div>
   
    <footer class="text-center text-lg-start text-muted">
        <!-- Section: Social media -->
        <div id="barrita" style="background-color: rgb(189, 179, 254);">
            <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom" >
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
        //Mapeo de variable para archivo servicio.js
            var regionesConAscii = '<c:out value="${regionesJson}"/>'
    </script>
        <script type="text/javascript" src="/js/servicio.js"></script>

</body>

</html>
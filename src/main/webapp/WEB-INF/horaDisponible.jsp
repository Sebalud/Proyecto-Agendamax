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
    <!-- Barra de navegacion -->
    <nav id="barrita" class="navbar navbar-expand-lg py-4 px-4 mb-5">
        <div class="container-fluid">
            <a id="nombrePagina" class="navbar-brand" href=""><span id="agendalo">Agendalo</span><span id="max">Max</span></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Botones y links -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/home">Home</a></li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><hr class="dropdown-divider"></li>
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
                    <input class="form-control me-2" id="buscador"  type="search" name="servicio" placeholder="Search" aria-label="Search">
                    <button class="btn botones" type="submit">Search</button>
                </form>

                <div class="nav-item dropdown">
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/logout">Logout</a></li>
                        <c:if test="${usuario.getEmpresa() != null}">
                            <li><a class="dropdown-item" href="/plan/${empresa.id}">tu empresa</a></li>
                        </c:if>
                        
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Editar perfil</a></li>
                    </ul>
                    <a class="nav-link dropdown-toggle"  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <c:out value="${usuario.nombre}"/>
                    </a>
                </div>
        </div>
        
        </div>
    </nav>
    
    <div class=" container">
        <h1 class="text-center mt-5 border-bottom fw-semibold">Gestión de horas disponibles para ${servicio.servicioOfrecido}</h1>

        <p>Duracion del servicio: ${servicio.duracionServicio} minutos</p>
        <p>Hora de inicio: ${servicio.horaInicio} hras</p>
        <p>Hora Termino: ${servicio.horaTermino} hras</p>
        <p>Duracion de jornada: ${servicio.duracionJornada} horas</p>
        <p>horas que el cliente no puede agendar: rojo</p>
        <p>horas agendadas por clientes: aun no se</p>
    </div>
    

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

    <div class="container  mw-100">
        <div class="container text-center d-flex justify-content-center rounded" id="targeta">
            <c:forEach  items="${listaAlModel}" var="dia">
            <div class="mx-5 my-5 d-inline-block col ">
                <p class="border p-2"><fmt:formatDate value="${dia.get(1).getDate()}" pattern="EEEE dd"/><br></p>
                <c:forEach items="${dia}" var="horarioDisponible">
                    <c:if test="${horarioDisponible.getEstaActivo()}">
                        <a class="btn my-1" style="background-color: #BDB3FE;" href="/agendar/${servicio.id}/${horarioDisponible.getDate().getTime()}">
                            <fmt:formatDate value="${horarioDisponible.date}" pattern="HH:mm:ss"/>
                        </a><br>
                    </c:if>
                    <c:if test="${!horarioDisponible.getEstaActivo()}">
                        <a href="/agendar/disponible/${servicio.id}/${horarioDisponible.getDate().getTime()}" class="btn btn-danger my-1" >
                            hacer disponible </a><br>
                    </c:if>
                </c:forEach>
            </div>
            </c:forEach>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center text-lg-start bg-white text-muted">
        <!-- Section: Social media -->
        <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
        <!-- Left -->
        <div class="me-5 d-none d-lg-block">
            <span>Get connected with us on social networks:</span>
        </div>
        <!-- Left -->
    
        <!-- Right -->
        <div>
            <a href="" class="me-4 link-secondary">
            <i class="fab fa-facebook-f"></i>
            </a>
            <a href="" class="me-4 link-secondary">
            <i class="fab fa-twitter"></i>
            </a>
            <a href="" class="me-4 link-secondary">
            <i class="fab fa-google"></i>
            </a>
            <a href="" class="me-4 link-secondary">
            <i class="fab fa-instagram"></i>
            </a>
            <a href="" class="me-4 link-secondary">
            <i class="fab fa-linkedin"></i>
            </a>
            <a href="" class="me-4 link-secondary">
            <i class="fab fa-github"></i>
            </a>
        </div>
        <!-- Right -->
        </section>
        <!-- Section: Social media -->
    
        <!-- Section: Links  -->
        <section class="">
        <div class="container text-center text-md-start mt-5">
            <!-- Grid row -->
            <div class="row mt-3">
            <!-- Grid column -->
            <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                <!-- Content -->
                <h6 class="text-uppercase fw-bold mb-4">
                <i class="fas fa-gem me-3 text-secondary"></i>Company name
                </h6>
                <p>
                Here you can use rows and columns to organize your footer content. Lorem ipsum
                dolor sit amet, consectetur adipisicing elit.
                </p>
            </div>
            <!-- Grid column -->
    
            <!-- Grid column -->
            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                <!-- Links -->
                <h6 class="text-uppercase fw-bold mb-4">
                Products
                </h6>
                <p>
                <a href="#!" class="text-reset">Angular</a>
                </p>
                <p>
                <a href="#!" class="text-reset">React</a>
                </p>
                <p>
                <a href="#!" class="text-reset">Vue</a>
                </p>
                <p>
                <a href="#!" class="text-reset">Laravel</a>
                </p>
            </div>
            <!-- Grid column -->
    
            <!-- Grid column -->
            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                <!-- Links -->
                <h6 class="text-uppercase fw-bold mb-4">
                Useful links
                </h6>
                <p>
                <a href="#!" class="text-reset">Pricing</a>
                </p>
                <p>
                <a href="#!" class="text-reset">Settings</a>
                </p>
                <p>
                <a href="#!" class="text-reset">Orders</a>
                </p>
                <p>
                <a href="#!" class="text-reset">Help</a>
                </p>
            </div>
            <!-- Grid column -->
    
            <!-- Grid column -->
            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                <!-- Links -->
                <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                <p><i class="fas fa-home me-3 text-secondary"></i> New York, NY 10012, US</p>
                <p>
                <i class="fas fa-envelope me-3 text-secondary"></i>
                info@example.com
                </p>
                <p><i class="fas fa-phone me-3 text-secondary"></i> + 01 234 567 88</p>
                <p><i class="fas fa-print me-3 text-secondary"></i> + 01 234 567 89</p>
            </div>
            <!-- Grid column -->
            </div>
            <!-- Grid row -->
        </div>
        </section>
        <!-- Section: Links  -->
    
        <!-- Copyright -->
        <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.025);">
        © 2021 Copyright:
        <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
        </div>
        <!-- Copyright -->
    </footer>
    <!-- Footer -->
    <script>
        //Mapeo de variable para archivo servicio.js
            var regionesConAscii = '<c:out value="${regionesJson}"/>'
    </script>
        <script type="text/javascript" src="/js/servicio.js"></script>

</body>

</html>
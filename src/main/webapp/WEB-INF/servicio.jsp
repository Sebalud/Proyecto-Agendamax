<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
  <link rel="stylesheet" type="text/css" href="/css/servicio.css">
  <title>Servicios</title>
</head>


<body>
  <!-- Barra de navegacion -->
  <nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">AgendamientoMax</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Botones y links -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item"><a class="nav-link active" aria-current="page" href="/home">Home</a></li>
          <c:choose>
            <c:when test="${not usuario.empresa.empresafree && usuario.empresa != null}">
              <li class="nav-item text-danger mt-2">Cuenta premium!</li>
            </c:when>
          </c:choose>
        </ul>
        
        <!-- Buscadores de Servicios-->
        <form class="d-flex" role="search" method="POST" action="/search">
          <select class="form-select" name="selectReg" id="selectReg">
            <option value="0">Region</option>
            <c:forEach items="${regiones}" var="region">
              <option value="${region.id}">${region.nombre}</option>
            </c:forEach>
          </select>
          <select class="form-select" name="selectCiud" id="selectCiud">
            <option value="0">Ciudad</option>
          </select>
          <input class="form-control me-2" type="search" name="servicio" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>

              <div class="nav-item dropdown">
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="/editar/${usuario.id}">Editar perfil</a></li>
                    <c:if test="${usuario.getEmpresa() != null}">
                        <li><a class="dropdown-item" href="/plan/${usuario.getEmpresa().getId()}">Tu Empresa</a></li>
                    </c:if>

              <li>
                  <hr class="dropdown-divider">
              </li>

              <li><a class="dropdown-item" href="/logout">Logout</a></li>
          </ul>
        </div>
        <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown"
          aria-expanded="false">
          <c:out value="${usuario.nombre}" />
        </a>
      </div>
    </div>
  </nav>
  
  <!-- Inicio Body -->
  <div>
    <c:if test="${serviciosFiltradosPorNombreCiudad.size() > 0}">
      <p class="title-design">Las empresas que ofrecen agendamiento relacionado con "${servicio}"</p>
    </c:if>
    <div class="title-design"> <c:out value="${errorServicio}"/> </div>
    <div class="title-design"> <c:out value="${errorNoHayEmpresa}"/> </div>
    
    <c:forEach items="${serviciosFiltradosPorNombreCiudad}" var="servicio">
      <div class="container">
      <div>
        <div>
          <c:if test="${servicio.imgRoute.isEmpty() == false}">
            <img src="${servicio.imgRoute}" style="width: 300px; height: 200px;" alt="${servicio.imgRoute}" class="rounded float-start">
          </c:if>
        </div>

        <div class="list-group service-data">
          <div class="list-group-item list-group-item-action">
            <div class="d-flex w-100 justify-content-between">
              <h5 class="mb-1">${servicio.getEmpresa().nombre}</h5>
              <small>${servicio.direction}</small>
            </div>
            <p class="mb-1">${servicio.servicioOfrecido}</p>
            <small class="text-muted">${servicio.precio}</small>
            <!-- Button trigger modal -->
            <br>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#horasDisp"> Ver Horas Disponibles </button>
          </div>
        </div>
      </div>
    
      <!-- Modal -->
      <div class="modal fade" id="horasDisp" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" id="modal-xl">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Horario Disponibilidad Servicio</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body" id="modal-body">
              <div class="text-center d-flex justify-content-center rounded">
                <c:forEach items="${servicio.posiblesHoraDisponible()}" var="dia">
                  <span class="vr"></span>

                  <div class="mx-4 my-4 d-inline-block col">
                    <p class="border border-secondary p-2 rounded-pill">
                      <fmt:formatDate value="${dia.get(1).getDate()}" pattern="EEEE dd" /><br>
                    </p>
                    <c:forEach items="${dia}" var="horarioDisponible">
                      <c:if
                        test="${usuario.id == servicio.empresa.usuarioAdmin.id && horarioDisponible.getEstaActivo()}">
                        <a class="btn my-1 btn-one"
                          href="/agendar/${servicio.id}/${horarioDisponible.getDate().getTime()}">
                          <fmt:formatDate value="${horarioDisponible.date}" pattern="HH:mm:ss" />
                        </a><br>
                      </c:if>
      
                      <c:if
                        test="${!horarioDisponible.getEstaActivo() && horarioDisponible.getHoraAgendadaByCliente() == 2}">
                        <a href=""
                          class="btn btn-dark my-1">
                          agendada
                        </a><br>
                      </c:if>
                      
                      <c:if
                        test="${usuario.id == servicio.empresa.usuarioAdmin.id && !horarioDisponible.getEstaActivo()}">
                        <a href="/agendar/disponible/${servicio.id}/${horarioDisponible.getDate().getTime()}"
                          class="btn btn-warning my-1">
                          Habilitar </a><br>
                      </c:if>
                    </c:forEach>
                  </div>

                  <span class="vr"></span>
                </c:forEach>

              </div>
            </div>

          </div>
        </div>
      </div>
      </div>
    </c:forEach>

  </div>
  <!-- Fin Body -->

  <!-- Footer -->
  <footer class="text-center text-lg-start bg-white text-muted">
    <!-- Section: Social media -->
    <section class="container mw-100 d-flex justify-content-center justify-content-lg-between p-4 border-bottom" id="d-flex">
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
    <section class="section-part">
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
      <a class="text-reset fw-bold" href="https://mdbootstrap.com/"> Encuentra tu servicio y pide cita</a>
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
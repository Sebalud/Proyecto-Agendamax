<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" type="text/css" href="/css/editaEmpresa.css">
    <title>Editar Empresa</title>
</head>
<body>
  <nav class="navbar navbar-expand-lg ">
    <div class="container-fluid">
      <a id="nombrePagina" class="navbar-brand" href=""><span id="agendalo">Agéndalo</span><span
        id="max">Max</span></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
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
</nav>

<div class="container">
  <form:form action="" method="POST" modelAttribute="empresa" cssClass="container form ancho">
    <div class="form-image">
      <img src="/imagenes/undraw_text_field_htlv.svg" alt="formulario">
    </div>
    <div class="form">

    <div class="mod-sub-title">
      <div class="sub-title">
        <h3>Editar Empresa</h3>
      </div>
    </div>

    <div class="input-group">
    <p class="input-box">
        <form:label cssClass="form-label"  path="nombre">Nombre Empresa</form:label>
        <form:errors cssClass="text-danger" path="nombre"/>
        <form:input cssClass="form-control" value="${empresaAEditar.nombre}" path="nombre"/>
    </p>

    <p class="input-box">
        <form:label path="rut">Rut Empresa</form:label>
        <form:errors cssClass="text-danger" path="rut"/>
        <form:input cssClass="form-control" value="${empresaAEditar.rut}" path="rut"/>
    </p>

    <p class="input-box">
      <form:label cssClass="form-label" path="ciudad">Ciudades</form:label>
      <form:errors path="ciudad"/>
      <form:select class="form-select" aria-autocomplete="list" aria-required="true" path="ciudad"> 
          <c:forEach items="${ciudadesNotEmpresa}" var="ciudad" >
              <form:option value="${ciudad.id}">${ciudad.nombre}</form:option>
          </c:forEach>
      </form:select>
    </p>
  </div>

  <div class="input-regist">
  <input class="btn botones" type="submit" value="Aceptar cambios"/>
  <div class="btn eliminar">
    <a href="/delete/${empresaAEditar.id}" id="eliminar">Eliminar Empresa</a>
    </div>
</div>
    </div>
</form:form>
</div>

<!-- Footer -->
<footer class="text-center text-lg-start bg-white text-muted">
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
  <section class="section-part">
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
            Información
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
<script>
  //Mapeo de variable para archivo servicio.js
      var regionesConAscii = '<c:out value="${regionesJson}"/>'
  </script>
  <script type="text/javascript" src="/js/servicio.js"></script>
<!-- Footer --
</body>
</html>
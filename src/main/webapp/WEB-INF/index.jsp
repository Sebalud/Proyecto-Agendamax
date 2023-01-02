<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <title>Crea tu cuenta</title>
</head>

<body>
  <div class="encabezado"></div>
  <div id="REGIÓN">
  <form class="col-3" method="POST" action="/search">
    <input type="region" name="region" placeholder="REGIÓN..." aria-label="Search">
  </form>
  <div id="CIUDAD">
  <form class="col-3" method="POST" action="/search">
    <input type="CIUDAD" name="CIUDAD" placeholder="CIUDAD..." aria-label="Search">
    <div id="SERVICIO">
    <form class="col-3" method="POST" action="/search">
        <input  type="search" name="servicio" placeholder="Introduzca servicio..." aria-label="Search">
        <div id="BOTONSERVICIO">
        <button class="btn btn-dark" type="submit">BUSCAR SERVICIO</button>
    </form>
    <form>
      <div id="NOSOTROS">
      <button class="btn btn-dark" type="submit">NOSOTROS</button>
    </form>

    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="/imagenes/calidad.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
              <h5>ACCENTURE LIMITED</h5>
              <p>Es una empresa multinacional de consultoría estratégica, servicios tecnológicos y externalización.</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="/imagenes/calidad.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
              <h5>Second slide label</h5>
              <p>Some representative placeholder content for the second slide.</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="..." class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
              <h5>Third slide label</h5>
              <p>Some representative placeholder content for the third slide.</p>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      <script>
        //Mapeo de variable para archivo servicio.js
        var regionesConAscii = '<c:out value="${regionesJson}"/>'
      </script>
      <script type="text/javascript" src="/js/servicio.js"></script>
</body>
</html>

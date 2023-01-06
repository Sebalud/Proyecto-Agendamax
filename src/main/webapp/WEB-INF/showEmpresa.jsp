<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/showEmpresa.css">
    <title>Empresa FREE</title>
</head>
<body class="container">
        <!-- Barra de navegacion -->
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">AgendamientoMax</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- Botones y links -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/home">Home</a></li>
                        <c:choose>
                            <c:when test="${!empresa.empresafree}">
                                <li class="nav-item text-danger mt-2">Cuenta premium!</li>
                            </c:when>
                        </c:choose>
                        
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
                    </ul>
                    <!-- Buscadores de Servicios-->
                    <form class="d-flex" role="search" method="POST" action="/search">
                        <select name="selectReg" id="selectReg">
                            <option value="0">-- Region --</option>
                            <c:forEach items="${regiones}" var="region">
                                <option value="${region.id}">${region.nombre}</option>
                            </c:forEach>
                        </select>
                        <select name="selectCiud" id="selectCiud">
                            <option value="0">-- Ciudad --</option>
                        </select>
                        <input class="form-control me-2" type="search" name="servicio" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <c:out value="${usuario.nombre}"/>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/logout">Logout</a></li>
                            <c:if test="${usuario.getEmpresa() != null}">
                                <li><a class="dropdown-item" href="/plan/${empresa.id}">tu empresa</a></li>
                            </c:if>
                            
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Editar perfil</a></li>
                        </ul>
                    </li>
            </div>
            
            </div>
        </nav>
    <!-- Contenido-->
    <h1>Bienvenido <c:out value="${empresa.usuarioAdmin.nombre}"/></h1>
    <h2>El detalle de tu empresa, <c:out value="${empresa.nombre}"/></h2>
    <p>Rut: <c:out value="${empresa.rut}"/></p>
        
        
        <c:choose>
            <c:when test="${(empresa.servicios.size() < 1 && empresa.empresafree) || !empresa.empresafree}">
                <p class="form-outline">
                    <form id="form" class="alinearDisplay ancho mt-5 ms-5" method="POST" action="/plan/${empresa.id}">
                        <select class="form-select" id="servicioElegido" name="servicio">
                            <option disabled value="">ingresa la opcion que tu prefieras</option>      
                            <c:forEach items="${serviciosNotEmpresa}" var="servicio">
                                <option value="${servicio.id}">${servicio.servicioOfrecido} duracion: ${servicio.duracionServicio} min</option>
                            </c:forEach>
                            <option value="opcionEspecial"><button id="miBoton">Haz clic aquí para mostrar el input</button></option>
                        </select>
                <input class="btn btn-dark mt-4" type="submit" value="Agregar Servicio"/>

            </c:when>
            <c:when test= "${empresa.servicios.size() == 1 && empresa.empresafree}">
                <p class="text-danger" >para tener otro servicio conviertete a premium!</p>
                <!-- modal Alerta, falta poner una alerta detro de la otra alerta-->
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal1">
                    Cambiarse a premium
                </button>

                <div class="modal fade modal-xl" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Plan premium</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                muuuuuuuuucho texto del plan premium,
                                que consiste
                                cuánto cuesta y demás
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <a class="btn btn-primary" href="/premium/${empresa.id}">Aceptar</a>
                                <a href=""><div class="modal-dialog modal-sm">...</div></a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>    
    </form>
    </p>

    <table class="table">
        <thead>
            <tr>
                <th scope="">Servicio</th>
                <th>Duracion de Servicio</th>
                <th>Ciudad</th>
                <th>Accion</th>
                <th>Hacer Horario</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${empresa.servicios}" var="servicio" >
            <tr>
                
                    <td colspan=""><c:out value="${servicio.servicioOfrecido}"/></td>
                    <td><c:out value="${servicio.duracionServicio}"/> min</td>
                    <td colspan=""><c:out value="${empresa.ciudad.nombre}"/></td>
                    <td><!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                                Eliminar Servicio
                            </button>
                            
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ¿Seguro que deseas eliminar el servicio de tu empresa?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                        <a class="btn btn-primary" href="/delete/${empresa.id}/${servicio.id}">Eliminar</a>
                                    </div>
                                </div>
                            </div>
                            </div>
                    </td>
                    <td>
                        <a href="/empresa/horario/${empresa.id}/${servicio.id}">Crear horas disponibles</a>
                    </td>
                
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <table class="table">
        <thead>
            <tr>
                <th scope="">Ciudad</th> 
                <th>Accion </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan=""><c:out value="${empresa.ciudad.nombre}"/></td>
                
                <td>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal3">
                        Eliminar Ciudad
                    </button>
                    
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            ¿Seguro que deseas eliminar el servicio de tu empresa?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <a class="btn btn-primary" href="/delete/${empresa.id}/${ciudad.id}">Eliminar</a>
                        </div>
                        </div>
                    </div>
                    </div>
                </td>
            </tr>

        </tbody>
    </table>

    
        <!-- Eliminar Empresa -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal4">
            Eliminar Empresa
        </button>
        
        <!-- Modal -->
        <div class="modal fade " id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                ¿Estas seguro/a de que quieres eliminar tu empresa?
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <a class="btn btn-primary" href="/delete/${empresa.id}/${ciudad.id}">Aceptar</a>
                </div>
            </div>
            </div>
        </div>

        <h1>Edita tu Empresa</h1>
        <form:form action="" method="POST" modelAttribute="empresa" cssClass="container form ancho">
        
        <p class="form-outline">
            <form:label cssClass="form-label"  path="nombre">Nombre Empresa</form:label>
            <form:errors cssClass="text-danger" path="nombre"/>
            <form:input cssClass="form-control" value="${empresaAEditar.nombre}" path="nombre"/>
        </p>
        <p>
            <form:label path="rut">Rut Empresa</form:label>
            <form:errors cssClass="text-danger" path="rut"/>
            <form:input cssClass="form-control" value="${empresaAEditar.rut}" path="rut"/>
        </p>
        <p class="form-outline">
            <form:label cssClass="form-label" path="ciudad">Ciudad</form:label>
            <form:errors path="ciudad"/>
            <form:select class="form-select" aria-autocomplete="list" aria-required="true" path="ciudad"> 
                <c:forEach items="${ciudadesNotEmpresa}" var="ciudad" >
                    <form:option value="${ciudad.id}">${ciudad.nombre}</form:option>
                </c:forEach>
            </form:select>
        </p>
        <input class="btn btn-outline-secondary" type="submit" value="FreePlan"/>
    </form:form>

            
    <h2>falta mostrar aqui la visualizacion y organizacion de las horas por parte de la empresa</h2>
    <h2>todas las tablas deben tener crud, falta borrar o desconectar servicio de la empresa si el usuario admin quiere</h2>

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
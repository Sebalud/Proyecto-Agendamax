<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600&display=swap"
        rel="stylesheet">
    <title>Registration</title>
</head>

<body>
    <div class="container">
        <form:form action="" method="POST" modelAttribute="usuario"></form:form>
        <div class="form-image">
            <img src="/img/undraw_my_password_re_ydq7.svg" alt="">
        </div>
        <div class="form">
            <div class="form-header">
                <div class="title">
                    <h1>Agendamax</h1>
                </div>
                <div class="login-button">
                    <button><a href="/login">Log in</a></button>
                </div>
            </div>

            <div class="input-group">
                <div class="input-box">
                    <label for="exampleInputPassword1">Nombre</label>
                    <errors cssClass="text-danger" path="password"/>

                    <input type="password" class="form-control" id="nombre"
                        placeholder="Escriba su primer nombre">
                </div>

                <div class="input-box">
                    <label for="exampleInputPassword1">Apellido</label>
                    <errors cssClass="text-danger" path="password"/>

                    <input type="apellido" class="form-control" id="apellido"
                        placeholder="Escriba su primer apellido">
                </div>

                <div class="input-box">
                    <label for="exampleInputEmail1">Email</label>
                    <errors cssClass="text-danger" path="password"/>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                    <small id="emailHelp" class="form-text text-muted"></small>
                </div>

                <div class="input-box">
                    <label for="exampleInputPassword1">Contraseña</label>
                    <errors cssClass="text-danger" path="password"/>
                    <input type="password" class="form-control" id="password"
                        placeholder="Cree su contraseña">
                </div>

                <div class="input-box">
                    <label for="exampleInputPassword1">Confirmación de contraseña</label>
                    <input type="password" class="form-control" id="password"
                        placeholder="Introduzca su contraseña">
                </div>
            </div>
            <div class="register-button">
                <input type=hidden value=0 name=number>
                <input class="btn btn-outline-secondary" type="submit" value="Registrarse"/>
            </div>
            </form>
        </div>
    </div>
</body>

</html>
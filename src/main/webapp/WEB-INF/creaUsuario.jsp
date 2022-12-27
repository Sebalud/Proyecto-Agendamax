<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">   
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600&display=swap" rel="stylesheet">
    <title>Crear cuenta</title>
</head>

<body>
    <div class="container">
        <div class="form-image">
            <img src="img/undraw_my_password_re_ydq7.svg" alt="log in">
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

            <form:form action="" method="POST" modelAttribute="usuario">

                <div class="input-group">
                    <p class="input-box">
                        <form:label for="nombre">Nombre</form:label>
                        <form:errors cssClass="text-danger" path="nombre"/>
                        <input id="nombre" type="text" path="nombre" placeholder="Escriba su primer nombre" required>
                    </p>

                    <p class="input-box">
                        <form:label for="apellido">Apellido</form:label>
                        <form:errors cssClass="text-danger" path="apellido"/>
                        <input id="apellido" type="text" name="apellido" placeholder="Escriba su primer apellido" required>
                    </p>

                    <p class="input-box">
                        <form:label for="email">Email</form:label>
                        <form:errors cssClass="text-danger" path="email"/>
                        <input id="email" type="email" name="email" placeholder="Escriba su correo electronico" required>
                    </p>

                    <p class="input-box">
                        <form:label for="password">Contraseña</form:label>
                        <form:errors cssClass="text-danger" path="password"/>
                        <input id="password" type="password" name="password" placeholder="Cree su contraseña" required>
                    </p>

                    <p class="input-box">
                        <form:label for="passwordConfirmation">Confrimación de contraseña</form:label>
                        <form:errors cssClass="text-danger" path="passwordConfirmation"/>
                        <input id="passwordConfirmation" type="password" name="passwordConfirmation" placeholder="Confirme su contraseña" required>
                    </p>
                </div>
                <div class="register-button">
                    <input type=hidden value=0 name=number>
                    <input class="btn btn-outline-secondary" type="submit" value="Registrarse"/>
                </div>
            </form:form>
        </div>
    </div>
</body>
</html>
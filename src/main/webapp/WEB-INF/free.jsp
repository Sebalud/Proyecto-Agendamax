<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Empresa FREE</title>
</head>
<body>
    <form:form action="" method="POST" modelAttribute="empresa" cssClass="container form ancho">
    
    <p class="form-outline">
        <form:label cssClass="form-label" path="nombre">Nombre Empresa</form:label>
        <form:errors cssClass="text-danger" path="nombre"/>
        <form:input cssClass="form-control" path="nombre"/>
    </p>
    <p>
        <form:label path="rut">Rut Empresa</form:label>
        <form:errors cssClass="text-danger" path="rut"/>
        <form:input cssClass="form-control" path="rut"/>
    </p>
    <p class="form-outline">
        <form:label cssClass="form-label" path="ciudades">Ciudades</form:label>
        <form:errors path="ciudades"/>
        <form:select class="form-select" path="ciudades"> 
            <c:forEach items="${ciudades}" var="ciudad" >
                <form:option value="${ciudad.id}">${ciudad.ciudad}</form:option>
            </c:forEach>
        </form:select>
    </p>
    <p>
        <form:label path="servicio">Servicio</form:label>
        <form:errors cssClass="text-danger" path="servicio"/>
        <form:input cssClass="form-control" path="servicio"/>
    </p>
    <input type=hidden value=0 name=number>
    <input class="btn btn-outline-secondary" type="submit" value="FreePlan"/>
</form:form>
</body>
</html>
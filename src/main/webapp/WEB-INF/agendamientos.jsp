<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
</head>
<body>
    <h1>Edita la Empresa</h1>
    <c:forEach items="${usuario.horarios}" var="horaAgendada">
        <p>${horaAgendada.getFechaAsDate()} <a class="dropdown-item" href="/cancela/cita/${usuario.id}/${horaAgendada.id}">Cancelar cita</a> </p>
    </c:forEach>
</body>
</html>

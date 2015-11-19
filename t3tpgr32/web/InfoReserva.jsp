<%-- 
    Document   : InfoReserva
    Created on : 18/11/2015, 08:57:10 PM
    Author     : Bruno González
--%>

<%@page import="com.h4t.servicios.DataReserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="WEB-INF/Templates/head.jsp"/>
    </head>
    <body>
        <% DataReserva dr = (DataReserva) request.getAttribute("info_reserva_dr");%> 
        <h1><%=%></h1>
    </body>
</html>

<%-- 
    Document   : InfoServicio
    Created on : 18/11/2015, 07:06:31 PM
    Author     : spesamosca
--%>

<%@page import="java.awt.Image"%>
<%@page import="com.h4t.servicios.DataServicioBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="WEB-INF/Templates/head.jsp"/>
    </head>
    <body>
        <div class="row">
                <jsp:include page="WEB-INF/Templates/header.jsp"/>
        </div>
        <%DataServicioBean info_servicio = (DataServicioBean) request.getAttribute("info_servicio");
        String imagen0 = (String)request.getAttribute("imagen0");%>
        <h3>Información del servicio</h3>
            <br/>
            <label>Nombre:</label><%=info_servicio.getNombre()%>
            <br/>
            <br/>
            <label>Descripcion:</label><%=info_servicio.getDescripcion()%>
            <br/>
            <img src="<%=imagen0%>" width="150px" height="150px" alt="Imagen Servicio"> 
    </body>
</html>

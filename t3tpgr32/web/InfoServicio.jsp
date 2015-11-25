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
        <jsp:include page="WEB-INF/Templates/header.jsp"/>
        <div class="container infoServicio">
            <%DataServicioBean info_servicio = (DataServicioBean) request.getAttribute("info_servicio");
            String imagen0 = (String)request.getAttribute("imagen0");
            String imagen1 = (String)request.getAttribute("imagen1");
            String imagen2 = (String)request.getAttribute("imagen2");%>
            <div class="row">
            <div class="col-md-12">
                <br>
                <br>
                <div class="page-header">
                    <h2><b>Informacion del servicio</b></h2>
                </div>
                <label><b>Nombre:</b></label><%=info_servicio.getNombre()%>
                <br>
                <br>
                <label><b>Descripcion:</b></label><%=info_servicio.getDescripcion()%>
                <br>
                <% if (imagen0 != null){ %>
                    <img class="imagen0" src="<%=imagen0%>" width="300px" height="200px" alt="Imagen Servicio"><%;
                }%>
                <% if (imagen1 != null){ %>
                    <img class="imagen1" src="<%=imagen1%>" width="300px" height="200px" alt="Imagen Servicio"><%;
                }%>
                <% if (imagen2 != null){ %>
                    <img class="imagen2"src="<%=imagen2%>" width="300px" height="200px" alt="Imagen Servicio"><%;
                }%>
            </div>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : Servicios
    Created on : 17/11/2015, 05:39:32 PM
    Author     : spesamosca
--%>

<%@page import="com.h4t.servicios.DataPublicacion"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.h4t.servicios.DataServicioBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="WEB-INF/Templates/head.jsp"/>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    </head>
    <body>
        <div class="container Servicios">
            <div class="row">
                <jsp:include page="WEB-INF/Templates/header.jsp"/>               
            </div>            
            <div class="row">
            <br>                    
            <br>
            <br>
            <div class="main col-xs-5 col-sm-7 col-md-10">
                <table class="table">
                                <tr class="cabeceraTabla">
                                    <td>Nombre</td>                                  
                                </tr>  
                <%Set<DataPublicacion> Servicios =(HashSet) request.getAttribute("Servicios");%>
                <%
                if (!Servicios.isEmpty())
                    {
                    String link;
                    for (DataPublicacion ds : Servicios){
                        link = "InfoServicio?Servicio=" + ds.getNombre();%>
                        <tr class="result" onclick="location.href='<%=link%>'">
                        <td><%=ds.getNombre()%></td>
                        </tr>
                    <%}
                }%>
                </table>                                                           
            </div>
            </div>
        </div>
    </body>
</html>

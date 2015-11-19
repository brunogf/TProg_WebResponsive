<%-- 
    Document   : Promociones
    Created on : 18/11/2015, 08:52:19 PM
    Author     : spesamosca
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="com.h4t.servicios.DataPublicacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="WEB-INF/Templates/head.jsp"/>
    </head>
    <body>
        <div class="container Promociones">
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
                <%Set<DataPublicacion> Promociones =(HashSet) request.getAttribute("Promociones");%>
                <%
                if (!Promociones.isEmpty())
                    {
                    String link;
                    for (DataPublicacion ds : Promociones){
                        link = "InfoPromocion?Promocion=" + ds.getNombre();%>
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

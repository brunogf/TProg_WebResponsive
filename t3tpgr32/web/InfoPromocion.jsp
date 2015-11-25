<%-- 
    Document   : InfoPromocion
    Created on : 18/11/2015, 08:58:11 PM
    Author     : spesamosca
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="com.h4t.servicios.DataServicioBean"%>
<%@page import="com.h4t.servicios.DataPromocion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="WEB-INF/Templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="WEB-INF/Templates/header.jsp"/>
        <div class="container infoPromocion">
            <div class="col-md-12">                 
                <br>
                <br>
                <div class="page-header">
                <h2>Informacion de la promocion</h2>
                </div>           
                <%DataPromocion info_promocion = (DataPromocion) request.getAttribute("info_promocion");%>
                <br>
                <label>Nombre:</label><%=info_promocion.getNombre()%>
                <br>
                <h4><b>Servicios de la promoción</b></h4> 
                <table class="table table-bordered">
                    <tr class="cabeceraTabla">
                        <td><b>Nombre</b></td>                                  
                    </tr>  
                    <%Set<DataServicioBean> Servicios =(HashSet) request.getAttribute("servicios_de_promocion");%>
                    <%
                    if (!Servicios.isEmpty())
                    {
                        String link;
                        for (DataServicioBean ds : Servicios){
                            link = "InfoServicio?Servicio=" + ds.getNombre();%>
                            <tr style="cursor:pointer" class="result" onclick="location.href='<%=link%>'">
                            <td><%=ds.getNombre()%></td>
                            </tr>
                        <%}
                    }%>
                </table>
            </div>
        </div>        
    </body>
</html>

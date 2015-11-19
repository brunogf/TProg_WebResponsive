<%-- 
    Document   : InfoReserva
    Created on : 18/11/2015, 08:57:10 PM
    Author     : Bruno González
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="com.h4t.servicios.DataServicioBean"%>
<%@page import="com.h4t.servicios.DataPromocion"%>
<%@page import="com.h4t.servicios.DataServicio"%>
<%@page import="com.h4t.servicios.DataDisponibilidad"%>
<%@page import="com.h4t.servicios.DataPublicacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.h4t.servicios.ParDPD"%>
<%@page import="java.util.List"%>
<%@page import="com.h4t.servicios.DataReserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="WEB-INF/Templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="WEB-INF/Templates/header.jsp"/>
        
        <% DataReserva dr = (DataReserva) request.getAttribute("info_reserva_dr");
            List<ParDPD> dpds = dr.getDpd();
            DecimalFormat decimales = new DecimalFormat("0");
        %>

        <div class="container InfoReserva">
            <div class="row">
                <%
                    if ((dpds != null)) {
                        if (!dpds.isEmpty()) {%>

                <div class="col-xs-12 table-responsive">
                    <table class="table">
                        <tr class="cabeceraTabla">
                            <td>Nombre</td>
                            <td>Tipo</td>
                            <td>Precio unitario</td>
                        </tr>

                        <%
                            for (ParDPD dpd : dpds) {
                                if (dpd != null) {
                                    DataPublicacion dpub = dpd.getDpub();
                                    DataDisponibilidad dd = dpd.getDd();
                                    if (dpub instanceof DataServicio) {
                                        DataServicio ds = (DataServicio) dpub;%>
                        <tr class="publicacion" onclick="location.href = '#'">
                            <td><%= ds.getNombre()%></td>
                            <td><%= "Servicio"%></td>
                            <td><%= "U$S " + decimales.format(ds.getPrecio())%></td>
                        </tr>

                        <%} else if (dpub instanceof DataPromocion) {
                            DataPromocion dp = (DataPromocion) dpub;%>
                        <tr class="publicacion" onclick="location.href = '#'">
                            <td><%= dp.getNombre()%></td>
                            <td><%= "Promocion"%></td>
                            <td><%= "U$S " + decimales.format(dp.getPrecioTotal())%></td>
                        </tr>
                        <%}
                                        }
                                    }
                                }
                            }%>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

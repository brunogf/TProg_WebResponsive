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
            <br>
            <br>
            <div class="page-header">
                <h2>Publicaciones</h2>
            </div>
            <%
                if ((dpds != null)) {
                    if (!dpds.isEmpty()) {%>

            <div class="row">
                <div class="col-md-12">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="cabeceraTabla">
                                <td><b>Nombre</b></td>
                                <td><b>Tipo</b></td>
                                <td><b>Precio unitario</b></td>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            for (ParDPD dpd : dpds) {
                                if (dpd != null) {
                                    DataPublicacion dpub = dpd.getDpub();
                                    DataDisponibilidad dd = dpd.getDd();
                                    if (dpub instanceof DataServicio) {
                                        DataServicio ds = (DataServicio) dpub;%>
                        <tr class="publicacion">
                            <td><%= ds.getNombre()%></td>
                            <td><%= "Servicio"%></td>
                            <td><%= "U$S " + decimales.format(ds.getPrecio())%></td>
                        </tr>

                        <%} else if (dpub instanceof DataPromocion) {
                            DataPromocion dp = (DataPromocion) dpub;%>
                        <tr class="publicacion">
                            <td><%= dp.getNombre()%></td>
                            <td><%= "Promocion"%></td>
                            <td><%= "U$S " + decimales.format(dp.getPrecioTotal())%></td>
                        </tr>
                        <%}
                                        }
                                    }
                                }
                            }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

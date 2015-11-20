<%-- 
    Document   : listarReservas
    Created on : 18/11/2015, 03:58:14 PM
    Author     : Bruno González
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.h4t.servicios.DataReserva"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="WEB-INF/Templates/head.jsp"/>
    </head>
    <body>
        <%--<jsp:include page="WEB-INF/Templates/header.jsp"/>--%>

        <div class="container ReservasProveedor">
            <div class="row">
                <%
                    List<DataReserva> reservas = (ArrayList) request.getAttribute("reservas");
                    DecimalFormat decimales = new DecimalFormat("0");
                    if (!(reservas == null)) {
                        if (!reservas.isEmpty()) {%>
                <div class="col-xs-12 table-responsive">
                    <table class="table">
                        <tr class="cabeceraTabla">
                            <td>#</td>
                            <td>Estado</td>
                            <td>Fecha Creación</td>
                            <td>Cliente</td>
                            <td>Total</td>
                        </tr>
                        <%
                            for (DataReserva r : reservas) {
                                Format f = new SimpleDateFormat("dd-MM-yyyy");
                                String fecha = f.format(r.getCreacion().toGregorianCalendar().getTime());
                        %>
                        <tr class="reservas" onclick="location.href='InfoReserva?nro=<%=r.getNum()%>'" >
                            <td><%=r.getNum()%></td>
                            <td><%=r.getEstado().toString()%></td>
                            <td><%=fecha%></td>
                            <td><%=r.getCliente()%></td>
                            <td><%="U$S " + decimales.format(r.getPrecioTotal())%></td>
                        </tr><%
                        }%>
                    </table></div><%
                    } else {
                    %>
                <div class="col-xs-12 noResult">
                    <span class="Message">No tienes ninguna reserva</span>
                </div>
                <%}
            } else {%>
                <div class="col-xs-12 noResult">
                    <span class="Message">No tienes ninguna reserva</span>
                </div>
                <%}%>
            </div>
        </div>
    </body>
</html>

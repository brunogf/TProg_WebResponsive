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
        <jsp:include page="WEB-INF/Templates/header.jsp"/>

        <div class="container ReservasProveedor">
            <br>
            <br>
            <div class="page-header">
                <h2>Reservas</h2>
            </div>
            <div class="row">
                <%
                    List<DataReserva> reservas = (ArrayList) request.getAttribute("reservas");
                    DecimalFormat decimales = new DecimalFormat("0");
                    if (!(reservas == null)) {
                        if (!reservas.isEmpty()) {%>
                <div class="col-md-12">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="cabeceraTabla">
                                <td><b>#</b></td>
                                <td><b>Estado</b></td>
                                <td><b>Fecha Creación</b></td>
                                <td><b>Cliente</b></td>
                                <td><b>Total</b></td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (DataReserva r : reservas) {
                                    Format f = new SimpleDateFormat("dd-MM-yyyy");
                                    String fecha = f.format(r.getCreacion().toGregorianCalendar().getTime());
                            %>
                            <tr style="cursor:pointer" class="reservas" onclick="location.href = 'InfoReserva?nro=<%=r.getNum()%>'" >
                                <td><%=r.getNum()%></td>
                                <td><%=r.getEstado().toString()%></td>
                                <td><%=fecha%></td>
                                <td><%=r.getCliente()%></td>
                                <td><%="U$S " + decimales.format(r.getPrecioTotal())%></td>
                            </tr><%
                            }%>
                        </tbody></table></div><%
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

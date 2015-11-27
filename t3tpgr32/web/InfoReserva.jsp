<%-- 
    Document   : InfoReserva
    Created on : 18/11/2015, 08:57:10 PM
    Author     : Bruno González
--%>

<%@page import="com.h4t.servicios.Estado"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            String fecha = df.format(dr.getCreacion().toGregorianCalendar().getTime());
        %>

        <div class="container InfoReserva">
            <br>
            <br>
            <div class="page-header">
                <h2>Reserva Nº<%=dr.getNum()%></h2>
            </div>
            <br>
            <div class="col-xs-offset-3 col-sm-offset-1 col-md-offset-1">
                <span>Fecha creacion: </span>
                <span><%=fecha%></span>
                <br>
                <span>Estado: </span>
                <span><%=dr.getEstado().name().toLowerCase()%></span>
                <%if((dr.getEstado() == Estado.PAGADA) && !((Boolean)request.getAttribute("proveedor_facturo"))){%>
                <span> - </span>
                <span class="btn-link facturarReserva" onclick="facturar(<%=dr.getNum()%>,'<%=request.getSession().getAttribute("Usuario")%>')"> Facturar</span>
                <%}else if((dr.getEstado() == Estado.FACTURADA) && ((Integer)request.getAttribute("info_reserva_fac") != -1)){ %>
                <%String str = "VerFactura?id=" + request.getAttribute("info_reserva_fac");%>
                <span> - </span>
                <span class="btn-link facturarReserva" onclick='window.open("<%=str%>")'> Ver Factura</span>
                <%}else if((Boolean)request.getAttribute("proveedor_facturo")){%>
                <span> - </span>
                <span> (Esperando por los otros proveedores para completar la facturación) </span>
                <%}%>
            </div>
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
                        <tr class="publicacion" onclick="location.href='InfoServicio?Servicio=<%=ds.getNombre()%>'">
                            <td><%= ds.getNombre()%></td>
                            <td><%= "Servicio"%></td>
                            <td><%= "U$S " + decimales.format(ds.getPrecio())%></td>
                        </tr>

                        <%} else if (dpub instanceof DataPromocion) {
                            DataPromocion dp = (DataPromocion) dpub;%>
                        <tr class="publicacion" onclick="location.href='InfoPromocion?Promocion=<%=dp.getNombre()%>'">
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
        <script>
            function facturar(nro, proveedor) {
               var r = confirm("Una vez facturada la reserva, no se podrá revertir el cambio!. Facturar de todas formas?");
               if (r === true)
               {
                   var url = "FacturarReserva?nro=" + nro + "&proveedor=" + proveedor;
                   window.location = url;
               }
            }
        </script>
    </body>
</html>

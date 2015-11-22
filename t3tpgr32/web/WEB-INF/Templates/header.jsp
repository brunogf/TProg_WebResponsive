<%-- 
    Document   : header
    Created on : 13-nov-2015, 2:32:47
    Author     : piñe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="media/bootstrap/css/bootstrap.min.css">
<script src="media/bootstrap/js/bootstrap.min.js"></script>
<script src="media/bootstrap/js/jquery.min.js"></script>
<link rel="stylesheet" href="media/estilos.css">

<header>
    <div class="container">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar1-1" aria-expanded="false">
                        <span class="sr-only">Menu</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Bienvenido a H4TMovil</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar1-1">
                    <ul class="nav navbar-nav">
                        <li><a href="Servicios">Servicios</a></li>
                        <li><a href="Promociones">Promociones</a></li>
                        <li><a href="ReservasProveedor">Reservas</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href='Home.jsp'>Logged as: <%=request.getSession().getAttribute("Nombre")%></a></li>
                        <li><a href="CerrarSesion">Cerrar Sesion</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>
</header>

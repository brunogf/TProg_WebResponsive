<%-- 
    Document   : IniciarSesion
    Created on : 12-nov-2015, 12:41:33
    Author     : piñe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.h4t.modelo.EstadoSesion"%>
<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <jsp:include page="WEB-INF/Templates/head.jsp"/>
    </head>
    
    <body>

      <div class="container IniciarSesion">
          
          <form class="form-signin col-xs-12 col-md-6 col-md-offset-3 " action="IniciarSesion" method="POST">
          <h2 class="form-signin-heading">Iniciar Sesion</h2>
          <label for="Usuario" class="sr-only">Email address o nickname</label>
          <input name="Usuario" id="Usuario" class="form-control" placeholder="Email address o nickname" required autofocus>
          <label for="Pass" class="sr-only">Password</label>
          <input name="Pass" type="password" id="Pass" class="form-control" placeholder="Password" required>
          <%  
            if(session.getAttribute("estado_sesion") == EstadoSesion.INVALID_LOGIN)
            {%>
            <span class="invalid_login_message">Usuario o contraseña incorrecto.</span>
            <%
            session.setAttribute("estado_sesion", EstadoSesion.NOT_LOGGED_IN);
            }    
        %>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="remember-me"> Remember me
            </label>
          </div>
          <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        </form>

      </div> <!-- /container -->


      <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
      <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>
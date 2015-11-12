<%-- 
    Document   : IniciarSesion
    Created on : 12-nov-2015, 12:41:33
    Author     : piñe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <jsp:include page="WEB-INF/Templates/head.jsp"/>
    </head>
    
    <body>

      <div class="container">

        <form class="form-signin">
          <h2 class="form-signin-heading">Iniciar Sesion</h2>
          <label for="inputEmail" class="sr-only">Email address o nickname</label>
          <input type="email" id="inputEmail" class="form-control" placeholder="Email address o nickname" required autofocus>
          <label for="inputPassword" class="sr-only">Password</label>
          <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
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
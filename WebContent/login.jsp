<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <html>
  
  <head>
    <meta charset="UTF-8">
    <title>KaririRH - Logar</title>
    <link rel="stylesheet prefetch" href="login/css/animate.min.css">
    <link rel="stylesheet" href="login/css/style.css" media="screen" type="text/css">
  </head>
  
  <body>
    <div class="form animated flipInX">
 <div> 
    <img src="img/LogoMenu.png" draggable="true">
 </div><h3>Realize seu Login:</h3>
      <form accept-charset="UTF-8" role="form" action="Autenticador"
      method="post">
        <input type="text" name="login" required="required" placeholder="Login">
        <input name="senha" type="password" required="required"  placeholder="Senha">
        <button type="submit" class="animated infinite pulse">Logar</button>
      </form>
     
    </div>
  </body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <html>
  
  <head>
    <meta charset="utf-8">
    <title>KaririRH ADM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="">
   <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="bootstrap-3.3.2/js/tests/vendor/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
  </head>
  
  <body>
  
        
        <div class="col-md-12 text-center" draggable="true">
          <img src="img/admkaririrh.png" class="center-block img-responsive img-rounded visible-lg visible-md visible-sm visible-xs"
          draggable="true" style="">
        </div>
        <div class="col-md-12"></div>
    <div class="container">
      <div class="row">
        <div class="col-md-2">
          <ul class="nav nav-pills nav-stacked">
            <li class="active">
              <a>Empresa</a>
            </li>
            <li>
              <a href="AdministradorControlador?acao=menuCadastrar">Cadastrar</a>
            </li>
            <li>
              <a href="AdministradorControlador?acao=menuBuscar">Buscar</a>
            </li>
            <li>
              <a href="AdministradorControlador?acao=menuListar">Lista de Empresas</a>
            </li>
            <li>
              <a class=" glyphicon glyphicon-log-out" href="Autenticador?acao=sair"> <span aria-hidden="true"></span>Sair</a>
            </li>
          </ul>
        </div>

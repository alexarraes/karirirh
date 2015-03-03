<%@page import="java.util.Date" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>  

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  
  <head>
    <meta charset="utf-8">
    <title>KaririRH</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
    rel="stylesheet">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </head>
  
  <body>
    <div class="navbar navbar-default navbar-fixed-top visible-lg visible-md visible-sm visible-xs">
      <div class="container">
        <div class="navbar-header">
          <a type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"></a>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav navbar-left">
           
            
           
              <p>Você está logado com: KaririRH Data: <f:formatDate value="<%=new Date() %>" type="date" /></p>
           
            <li class="active">
              <a href="#">Home</a>
            </li>
            <li class="dropdown" draggable="true">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
              aria-expanded="false">Colaborador<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li>
                  <a href="#">Cadastrar</a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="#">Consultar</a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="#">Alterar</a>
                </li>
              </ul>
            </li>
            <li class="dropdown" draggable="true">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
              aria-expanded="false">Setor<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li>
                  <a href="#">Cadastrar</a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="#">Consultar</a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="#">Alterar</a>
                </li>
              </ul>
            </li>
            <li class="dropdown" draggable="true">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
              aria-expanded="false">Cargo<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li>
                  <a href="#">Cadastrar</a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="#">Consultar</a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="#">Alterar</a>
                </li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
              aria-expanded="false">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li>
                  <a href="#">Action</a>
                </li>
                <li>
                  <a href="#">Another action</a>
                </li>
                <li>
                  <a href="#">Something else here</a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="#">Separated link</a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="#">One more separated link</a>
                </li>
              </ul>
            </li>
            <li draggable="true">
              <a href="#">Sobre</a>
            </li>
          </ul>
          <a class="navbar-brand navbar-right visible-lg visible-md visible-sm visible-xs">
            <img src="img/LogoMenu.png" draggable="true">
          </a>
          <a class="btn btn-danger btn-sm navbar-btn navbar-right">Sair<span class="glyphicon glyphicon-share"></span></a>
        </div>
      </div>
    </div>
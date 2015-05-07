<%@page import="java.util.Date"%>
<%@page import="br.com.karirirh.entidades.Usuario"%>
<%@page import="br.com.karirirh.entidades.Empresa"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<head>
	
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="img/logo144.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="img/logo114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="img/logo72.png">
<link rel="apple-touch-icon-precomposed" href="img/logo57.png">
<link rel="shortcut icon" href="img/logo32.png">
</head>
<div
	class="navbar navbar-default navbar-fixed-top visible-lg visible-md visible-sm visible-xs">
	<div class="container">
		<div class="navbar-header">
			<a type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse"></a>
		</div>
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav navbar-left">
				<%
					Usuario usuario = (Usuario) request.getSession().getAttribute(
							"usuario");
					Empresa empresa = usuario.getEmpresa();
				%>
				<p>
					Empresa
					<%=empresa.getRazaoSociao()%>
					logada com: <b><%=usuario.getLogin()%></b> Data: <b><f:formatDate
							value="<%=new Date()%>" type="date" /></b>
				</p>

				<li class="active"><a href="MenuControlador?acao=home">Home</a>
				</li>
				<li class="dropdown" draggable="true"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-expanded="false">Colaborador<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="ColaboradorControlador?acao=menuCadastro">Cadastrar</a></li>
						<li><a href="ColaboradorControlador?acao=menuAlterar">Alterar</a></li>
						<li><a href="ColaboradorControlador?acao=menuBuscar">Buscar</a></li>
						<li><a href="ColaboradorControlador?acao=menuListar">Listar</a></li>
						<li class="divider"></li>
						<li><a href="HistoricoControlador?acao=menuHistorico">Histórico</a></li>
						<li><a href="MDControlador?acao=menuListar">Medida
								Disciplinar</a></li>
						<li><a href="ColaboradorControlador?acao=menuInativar">Inativar</a></li>
						<li class="divider"></li>
						<li><a href="AfastamentoControlador?acao=menuAfastamento">Afastar</a></li>
						<li><a href="AfastamentoControlador?acao=menuEmAfastamento">Em
								Afastamento</a></li>
						<li><a href="AfastamentoControlador?acao=menuAfastados">Histórico
								de Afastamento</a></li>
					</ul></li>

				<li class="dropdown" draggable="true"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-expanded="false">Férias<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="FeriasControlador?acao=menuFerias">Cadastrar</a></li>
						<li><a href="FeriasControlador?acao=menuEmFerias">Em
								Férias</a></li>
						<li><a href="FeriasControlador?acao=menuCadastradas">Férias
								Cadastradas</a></li>
					</ul></li>


				<li class="dropdown" draggable="true"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-expanded="false">Cargo<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="CargoControlador?acao=menuCadastrar">Cadastrar</a></li>
						<li><a href="CargoControlador?acao=menuAlterar">Alterar</a></li>
						<li class="divider"></li>
						<li><a href="CargoControlador?acao=menuBuscar">Buscar</a></li>
						<li><a href="CargoControlador?acao=menuListar">Listar</a></li>
					</ul></li>

				<li class="dropdown" draggable="true"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-expanded="false">Setor<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="SetorControlador?acao=menuCadastrar">Cadastrar</a></li>
						<li><a href="SetorControlador?acao=menuAlterar">Alterar</a></li>
						<li class="divider"></li>
						<li><a href="SetorControlador?acao=menuBuscar">Buscar</a></li>
						<li><a href="SetorControlador?acao=menuListar">Listar</a></li>
					</ul></li>
					
					<li class="dropdown" draggable="true"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-expanded="false">Relatório<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="MenuControlador?acao=DownRelat">Download</a></li>
					</ul></li>
					
					<li draggable="true"><a href="#">Curriculos</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Configuração
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="MenuControlador?acao=config">Dados da
								Empresa</a></li>
								
					</ul></li>
					
				<li draggable="true"><a href="MenuControlador?acao=Sobre">Sobre</a></li>
			</ul>
			<a
				class="navbar-brand navbar-right visible-lg visible-md visible-sm visible-xs">
				<img src="img/LogoMenu.png" draggable="true">
			</a> <a type="button" href="Autenticador?acao=sair"
				class="btn btn-danger btn-sm navbar-btn navbar-right">Sair<span
				class="glyphicon glyphicon-share"></span></a>
		</div>
	</div>
</div>
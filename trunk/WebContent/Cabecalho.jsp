<%@page import="java.util.Date"%>
<%@page import="br.com.karirirh.entidades.Usuario"%>
<%@page import="br.com.karirirh.entidades.Empresa"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
					Empresa <%=empresa.getRazaoSociao()%> logada com: <%=usuario.getLogin() %> Data:
					<f:formatDate value="<%=new Date()%>" type="date" />
				</p>

				<li class="active"><a href="MenuControlador?acao=home">Home</a>
				</li>
				<li class="dropdown" draggable="true"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-expanded="false">Colaborador<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="MenuControlador?acao=cabecalho">Cadastrar</a></li>
						<li class="divider"></li>
						<li><a href="MenuControlador?acao=mundo">Consultar</a></li>
						<li class="divider"></li>
						<li><a href="#">Alterar</a></li>
					</ul></li>
				<li class="dropdown" draggable="true"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-expanded="false">Setor<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="MenuControlador?acao=salvar">Cadastrar</a></li>
						<li><a href="SetorControlador?acao=alterar">Alterar</a></li>
						<li class="divider"></li>
						<li><a href="SetorControlador?acao=buscar">Buscar</a></li>	
						<li><a href="SetorControlador?acao=listar">Listar</a></li>
					</ul></li>
				<li class="dropdown" draggable="true"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-expanded="false">Cargo<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Cadastrar</a></li>
						<li class="divider"></li>
						<li><a href="#">Consultar</a></li>
						<li class="divider"></li>
						<li><a href="#">Alterar</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
				<li draggable="true"><a href="#">Sobre</a></li>
			</ul>
			<a
				class="navbar-brand navbar-right visible-lg visible-md visible-sm visible-xs">
				<img src="img/LogoMenu.png" draggable="true">
			</a> <a type="button" href="Autenticador"
				class="btn btn-danger btn-sm navbar-btn navbar-right">Sair<span
				class="glyphicon glyphicon-share"></span></a>
		</div>
	</div>
</div>
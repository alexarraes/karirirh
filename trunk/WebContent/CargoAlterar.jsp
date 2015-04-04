<%@page import="br.com.karirirh.entidades.Cargo"%>
<%@page import="br.com.karirirh.entidades.Setor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<div
	class="navbar navbar-default navbar-static-top visible-lg visible-md visible-sm visible-xs">
	<div class="container">
		<div class="navbar-header">
			<jsp:include page="Cabecalho.jsp"></jsp:include>
		</div>
	</div>
</div>
<head>
<meta charset="utf-8">
<title>Alterar Cargo</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="AlexArraes">
<link href="css/bootstrap.css" rel="stylesheet">
<script type="text/javascript"
	src="bootstrap-3.3.2/js/tests/vendor/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>

<body>
	<form name="CargoAlterar" action="CargoControlador" method="get">
		<fieldset>
			<input type="hidden" name="acao" value="alterar">
			<!-- Form Name -->
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<legend draggable="true">
								<h1>Cargo</h1>
								Alterar
							</legend>
							<div class="col-md-12">
								<!--nome-->
								<%
									if (request.getAttribute("msg") != null) {
								%>
								<center><%=request.getAttribute("msg")%></center>
								<%
									}
									Cargo cargo = (Cargo) request.getAttribute("cargo");
								%>
								<div class="form-group" draggable="true">
									<label for="CargoAlterar">ID:</label>
									<div>
										<input id="id" name="id" type="text" readonly="readonly"
											value="<%=cargo.getId()%>" class="form-control input-md"
											required="required">
									</div>
								</div>
								<div class="row">
									<div class="col-md-8">
										<!--nome-->
										<div class="form-group" draggable="true">
											<label for="CargoAlterar">Nome do Cargo:*</label>
											<div>
												<input id="nome" name="nome" type="text"
													value="<%=cargo.getNome()%>"
													placeholder="Ex.: Auxiliar de Acabamento"
													class="form-control input-md" required="required">
											</div>
										</div>
									</div>
									<div class="col-md-2">
										<!--salario-->
										<div class="form-group">
											<label for="CargoAlterar">Valor do Salário R$:*</label>
											<div>
												<input id="salario" name="salario" type="text"
													value="<%=cargo.getSalario()%>" placeholder="788,00"
													class="form-control input-md" required="required">
											</div>
										</div>
									</div>
								</div>
								<!--salario-->
							</div>
							<div class="col-md-5">
								<div class="form-group">
									<label for="CargoAlterar">Setor:*</label>
									<div>
										<select id="cod" name="cod" class="form-control">
											<option value="<%=cargo.getSetor().getId()%>"><%=cargo.getSetor().getNome()%></option>
											<%
											List<Setor> listaResultado = (List<Setor>) request
													.getAttribute("lista");
											for (Setor s : listaResultado) {
										%>

											<option value="<%=s.getId()%>"><%=s.getNome()%></option>

											<%
											}
										%>
										</select>

									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<!--nome-->
							<div class="col-md-5">
								<!-- Descricao -->
								<div class="form-group">
									<label for="CargoAlterar">Descrição:*</label>
									<div>
										<textarea class="form-control" id="descricao" name="descricao"
											value="<%=cargo.getDescricao()%>"><%=cargo.getDescricao()%></textarea>
									</div>
								</div>
								<!-- Descricao -->
							</div>
							<div class=col-md-12>
								<button type="submit" class="btn btn-primary"for="CargoAlterar">
									<span class="glyphicon glyphicon-repeat"> </span>Alterar
								</button>
								<button type="button" class="btn btn-warning" onClick="history.go(-1)"> 
								<span class="glyphicon glyphicon-arrow-left"> </span>Voltar
								</button>
							
							</div>
						</div>
		</fieldset>
	</form>
	<jsp:include page="rodape.jsp"></jsp:include>
</body>

</html>
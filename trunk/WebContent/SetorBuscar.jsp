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
<title>Buscar Setor</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="AlexArraes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript"
	src="bootstrap-3.3.2/js/tests/vendor/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>

	<form name="BuscarSetor" action="SetorControlador" method="get">
		<fieldset>
			<input type="hidden" name="acao" value="buscar">
			<!-- Form Name -->
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<legend draggable="true">
								<h1>Setor</h1>
								Buscar
							</legend>
							<div class="col-md-12">
								<!--nome-->
								<%
									if (request.getAttribute("msg") != null) {
								%>
								<center><%=request.getAttribute("msg")%></center>
								<%
									}
								%>
								<div class="form-group" draggable="true">
									<label for="BuscarSetor">Buscar por nome:</label>
									<div>
										<input id="nome" name="nome" type="text"
											placeholder="Ex.: Recursos Humanos"
											class="form-control input-md" required="required">
									</div>
								</div>
							</div>

						</div>
						<div class=col-md-12>
							<button type="submit" class="btn btn-success" for="BuscarSetor">
								<span class="glyphicon glyphicon-ok"></span>Buscar
							</button>
							<button type="reset" class="btn btn-danger">
								<span class="glyphicon glyphicon-remove-sign"></span>Limpar
							</button>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
	</form>
</body>

</html>
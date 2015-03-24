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
<title>Buscar Colaborador</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="AlexArraes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript"
	src="bootstrap-3.3.2/js/tests/vendor/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
	<form name="ColaboradorBuscar" action="ColaboradorControlador" method="get">
		<fieldset>
			<input type="hidden" name="acao" value="buscar">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<legend draggable="true">
										<h1>Colaborador</h1>
										Buscar
									</legend>
									<div class="col-md-3">
										<div class="form-group">
											<label for="ColaboradorBuscar">Buscar por:*</label>
											<div>
												<select id="nome" name="nome" class="form-control">
													<option value="nome">Nome</option>
													<option value="cpf">CPF</option>
													<option value="matricula">Matrícula</option>
													<option value="ctps">CTPS</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-md-0.1"></div>
									<div class="col-md-4">
										<label for="ColaboradorBuscar">Informação:</label> <input
											class="form-control" type="text" name="valor"
											placeholder="Ex.: João " required="required"> <BR />
									</div>
								</div>


								<button type="submit" class="btn btn-info" for="ColaboradorBuscar">
									<span class="glyphicon glyphicon-search" data-target="Buscar Colaborador."></span> Buscar
								</button>
								<button type="reset" class="btn btn-danger">
									<span class="glyphicon glyphicon-remove-sign"></span>Limpar
								</button>
								<br /> <br /> <br />
							</div>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
		<br />

	</form>


</body>

</html>
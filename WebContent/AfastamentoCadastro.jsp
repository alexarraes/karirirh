<%@page import="br.com.karirirh.entidades.Colaborador"%>
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

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="AlexArraes">
<title>Cadastrar Afastamento</title>
<script type="text/javascript" src="modal/js/jquery.min.js"></script>
<script type="text/javascript" src="modal/js/bootstrap.min.js"></script>
<script type="text/javascript" src="modal/js/scripts.js"></script>

<link href="css/font-awesome.min2.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" media="screen"
	href="DataTable/media/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="DataTable/media/css/jquery.dataTables_themeroller.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="DataTable/media/css/jquery.dataTables.min.css">
<script type="text/javascript" src="DataTable/media/js/jquery.js"></script>
<script type="text/javascript"
	src="DataTable/media/js/jquery.dataTables.js"></script>
<script type="text/javascript"
	src="DataTable/media/js/jquery.dataTables.min.js"></script>
<script src="jQueryUI/jquery-ui.js"></script>
<link rel="stylesheet" href="resources/demos/style.css">
<link rel="stylesheet" href="jQueryUI/jquery-ui.css">
<script src="jQueryUI/jquery.maskedinput.js" type="text/javascript"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<script>
	$(function() {
		$("#dataInicial").datepicker({
			changeMonth : true,
			changeYear : true
		});
		$("#dataFinal").datepicker({
			changeMonth : true,
			changeYear : true
		});
	});

	$(function() {
		$("#accordion").accordion({
			heightStyle : "content"
		});
	});

	jQuery(function($) {
		$("#dataInicial").mask("99/99/9999");
		$("#dataFinal").mask("99/99/9999");
	});
</script>
</head>

<body>

	<form name="afastamento" action="AfastamentoControlador" method="get" class="form-horizontal" role="form">
		<fieldset>
			<input type="hidden" name="acao" value="salvar">
			<div class="section">
				<div class="container">
					<div class="col-md-12">
						<div class="row">
							<legend draggable="true">
								<h1>Colaborador</h1>
								Afastamento Temporário
							</legend>
						</div>
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-md-8">
							<%
Colaborador col = (Colaborador)request.getAttribute("col");
%>
								<div class="form-group has-feedback">
									<div class="col-sm-2">
										<label for="afastamento" class="control-label">Nome:</label>
									</div>
									<div class="col-sm-10">
										<input type="text" class="form-control" readonly="readonly"
										value="<%=col.getNome()%>">

									</div>
								</div>
								<div class="form-group has-feedback">
									<div class="col-sm-2">
										<label for="afastamento" class="control-label" >Matrícula:</label>
									</div>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="matricula" readonly="readonly"
											id="matricula" value="<%=col.getMatricula()%>">

									</div>
								</div>
								<div class="form-group has-warning hidden-xs">
									<label class="control-label">TIPO DE AFASTAMENTO
										TEMPORÁRIO</label> <select class="form-control input-lg"  id="cod" name="cod">
										<option value="1">Acidente de trabalho</option>
										<option value="2">Doença</option>
										<option value="3">Licença-maternidade</option>
										<option value="4">Aborto não criminoso</option>
										<option value="5">Serviço militar</option>
										<option value="6">Mandato Judicial</option>
										<option value="7">Outros motivos de afastamento temporário</option>
									</select>
								</div>
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<div class="form-group has-feedback">
									<div class="col-sm-2">
										<label for="afastamento" class="control-label">Data
											Inicial:</label>
									</div>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="dataInicial"
											id="dataInicial" placeholder="00/00/0000" maxlength="10">
										<span
											class="fa fa-calendar fa-lg form-control-feedback text-success"></span>
									</div>
								</div>
								<div class="form-group has-feedback">
									<div class="col-sm-2">
										<label for="afastamento" class="control-label">Data
											Final:</label>
									</div>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="dataFinal"
											id="dataFinal" placeholder="00/00/0000" maxlength="10">
										<span
											class="fa fa-calendar fa-lg form-control-feedback text-danger"></span>
									</div>
								</div>
								<div class="form-group">
									<label  for="afastamento" class="control-label">Observações:</label>
									<textarea class="form-control" maxlength="50"
										name="obs" required="required"></textarea>
								</div>
							</div>
							<div class="col-md-6"></div>
							<div class="col-md-1"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
						<button type="submit" class="btn btn-success" for="afastamento" >
							Registrar<i
								class="fa fa-2x fa-bed fa-fw text-inverse"></i>
						</button>
				
						</div>
						<div class="col-md-8"></div>
						<div class="col-md-2"></div>
					</div>
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>
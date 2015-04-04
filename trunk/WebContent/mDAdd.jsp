<%@page import="br.com.karirirh.entidades.Colaborador"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
<title>Medida Disciplinar</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="AlexArraes">
<link href="css/bootstrap.css" rel="stylesheet">
<script type="text/javascript"
	src="bootstrap-3.3.2/js/tests/vendor/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="jQueryUI/external/jquery/jquery.js"></script>
<script src="jQueryUI/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="jQueryUI/jquery-ui.css">
<script src="jQueryUI/jquery.maskedinput.js" type="text/javascript"></script>



<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="img/logo144.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="img/logo114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="img/logo72.png">
<link rel="apple-touch-icon-precomposed" href="img/logo57.png">
<link rel="shortcut icon" href="img/logo32.png">
<script>
	$(function() {
		$("#data").datepicker({
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
		$("#data").mask("99/99/9999");

	});
</script>
</head>

<body>
	<%
		Colaborador col = (Colaborador) request.getAttribute("col");
	%>


	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<legend draggable="true">
						<h1>Colaborador</h1>
						Medida Disciplinar
					</legend>
					<%
						if (request.getAttribute("msg") != null) {
					%>
					<center><%=request.getAttribute("msg")%></center>
					<%
						}
					%>

					<div class=" panel panel-danger">
						<div class="panel-heading">
							<h1 class="panel-title text-center text-inverse">Medida
								Disciplinar</h1>
						</div>
						<div class="panel-body">
							<p class="text-muted">
								<b>Matrícula:</b>
								<%=col.getMatricula()%></p>
							<p class="text-muted">
								<b>Nome:</b>
								<%=col.getNome()%></p>
							<p class="text-muted">
								<b>Cargo:</b>
								<%=col.getCargo().getNome()%></p>
						</div>
					</div>
				</div>
			</div>
		</div>


		<form name="md" action="MDControlador" method="get">
			<fieldset>
				<input type="hidden" name="acao" value="salvar">
				<!-- Form Name -->
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="row">


								<div class="col-md-2">
									<!--nome-->
									<div class="form-group" draggable="true">
										<label for="md">ID Colaborador:</label>
										<div>
											<input id="id" name="id" type="text" value="<%=col.getId()%>"
												readonly="readonly" class="form-control input-md"
												required="required">
										</div>
									</div>
								</div>
								<div class="col-md-1"></div>
								<div class="col-md-2">
									<div class="form-group" draggable="true">
										<label for="md">Data:</label>
										<div>
											<input id="data" name="data" type="text"
												class="form-control input-md" required="required"
												maxlength="10">
										</div>
									</div>
								</div>
								<div class="col-md-7"></div>
							</div>
							<!--salario-->
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="md">Tipo de Medida Disciplinar:</label>
								<div>
									<select id="tipo" name="tipo" class="form-control">

										<option value="Adivertência Verbal">Adivertência
											Verbal</option>
										<option value="Adivertência Escrita">Adivertência
											Escrita</option>
										<option value="Suspenção">Suspenção</option>
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
								<label for="md">Descrição:*</label>
								<div>
									<textarea class="form-control" id="motivo" name="motivo"></textarea>
								</div>
							</div>
							<!-- Descricao -->
						</div>
						<div class=col-md-12>
							<button type="submit" class="btn btn-success">
								<span class="glyphicon glyphicon-ok"></span>Atribuir
							</button>
							<button type="reset" class="btn btn-danger">
								<span class="glyphicon glyphicon-remove-sign"></span>Cancelar
							</button>
						</div>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
	<jsp:include page="rodape.jsp"></jsp:include>
</body>

</html>


</body>
</html>
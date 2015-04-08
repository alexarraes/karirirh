<%@page import="java.util.List"%>
<%@page import="br.com.karirirh.entidades.Colaborador"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>

<div
	class="navbar navbar-default navbar-static-top visible-lg visible-md visible-sm visible-xs">
	<div class="container">
		<div class="navbar-header"></div>
	</div>
</div>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Férias Listar</title>

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
<script src="jQueryUI/jquery.maskedinput.js"  type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#dataFinal").datepicker({
			changeMonth : true,
			changeYear : true
		});
		$("#dataInicial").datepicker({
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

	function mat(matricula) {
		document.getElementById('matricula').value = matricula;
	}
	$(document).ready(function() {
		$('#tabela').DataTable();
	});

	function open(msg) {
		if(msg != "nada"){alert(msg)}	
	}
</script>
<%
String msg =(String)request.getAttribute("msg");
if(msg == null){
	msg = "nada";
}
%>
</head>
<body onLoad="open('<%=msg %>')">

	<form name="ferias" action="FeriasControlador" method="get">
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="modal fade" id="modal-container-958595" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="titulo">Cadastrar Férias</h4>
								</div>
								<div class="modal-body">
									<input type="hidden" name="acao" value="salvar">
									<div class="form-group">
										<label class="control-label" for="ferias">Matrícula:</label> <input
											class="form-control" name="matricula" id="matricula"
											readonly="readonly" maxlength="10" type="text">
									</div>
									<div class="form-group">
										<label class="control-label" for="ferias">Data de
											Início:</label> <input class="form-control" name="dataInicial"
											id="dataInicial" maxlength="10" placeholder="00/00/0000"
											type="text" required="required">
									</div>
									<div class="form-group">
										<label class="control-label" for="ferias">Data do Fim:</label>
										<input class="form-control" name="dataFinal" id="dataFinal"
											placeholder="00/00/0000" maxlength="10" type="text"
											required="required">
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Fechar</button>
									<button type="submit" for="ferias" class="btn btn-primary">Cadastrar</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<br />
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<jsp:include page="Cabecalho.jsp"></jsp:include>
				<fieldset>
					<legend>
						<h1>Férias</h1>
						Lista de Colaboradores
					</legend>
					<table
						class="table table-bordered table-striped visible-lg visible-md visible-sm visible-xs"
						id="tabela">
						<thead>
							<tr>
								<th class="success">Matrícula</th>
								<th class="success">Nome</th>
								<th class="success">CPF</th>
								<th class="success">CTPS</th>
								<th class="success">Salário</th>
								<th class="success">E-Mail</th>
								<th class="success">Situação</th>
								<th class="success">Cargo</th>
								<th class="success">Setor</th>
								<th class="success">FÉRIAS</th>
							</tr>
						</thead>

						<%
							List<Colaborador> listaResultado = (List<Colaborador>) request
									.getAttribute("lista");

							for (Colaborador c : listaResultado) {
						%>
						<tr>
							<td><%=c.getMatricula()%></td>
							<td><%=c.getNome()%></td>
							<td><%=c.getCpf()%></td>
							<td><%=c.getCtps()%></td>
							<td><%=c.getSalarioAtual()%></td>
							<td><%=c.getEmail()%></td>
							<td><%=c.isStatus() ? "Ativo" : "Inativo"%></td>
							<td><%=c.getCargo().getNome()%></td>
							<td><%=c.getCargo().getSetor().getNome()%></td>
							<td>
								<!-- iNICIO DA cOLUNA --> <a id="modal-958595"
								href="#modal-container-958595" role="button"
								class="btn btn-success" data-toggle="modal"
								onclick="mat('<%=c.getMatricula()%>')">Cadastrar Férias</a>
							</td>
							<!-- FINAL DA COLUNA -->


						</tr>
						<%
							}
						%>

					</table>
				</fieldset>
			</div>
		</div>
	</div>
		<jsp:include page="rodape.jsp"></jsp:include>
</body>
</html>
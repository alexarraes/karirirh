<%@page import="br.com.karirirh.entidades.HistoricoAfastamento"%>
<%@page import="java.util.List"%>
<%@page import="br.com.karirirh.entidades.Ferias"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<title>Colaboradores em Afastamento</title>

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
<link href="css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">
	$(document).ready(function() {
		$('#tabela').DataTable();
	});
</script>
</head>
<body>
	<br />
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<jsp:include page="Cabecalho.jsp"></jsp:include>
				<fieldset>
					<legend>
						<h1>Afastamento</h1>
						Colaboradores em Período de Afastamento.
					</legend>
					<table
						class="table table-bordered table-striped visible-lg visible-md visible-sm visible-xs"
						id="tabela">
						<thead>
							<tr>
								<th class="success">Matrícula</th>
								<th class="success">Nome</th>
								<th class="success">CPF</th>
								<th class="success">Cargo</th>
								<th class="success">Tipo de Afastamento</th>
								<th class="success">Observação</th>
								<th class="success">Data Inicial</th>
								<th class="success">Data Final</th>
							</tr>
						</thead>
						<%
							List<HistoricoAfastamento> listaResultado = (List<HistoricoAfastamento>) request
									.getAttribute("lista");
							for (HistoricoAfastamento afast : listaResultado) {
						%>
						<tr>
							<td><%=afast.getColaborador().getMatricula()%></td>
							<td><%=afast.getColaborador().getNome()%></td>
							<td><%=afast.getColaborador().getCpf()%></td>
							<td><%=afast.getColaborador().getCargo().getNome()%></td>
							<%
								String tipo = null;
									switch (afast.getCodDoenca()) {
									case 1:
										tipo = "Acidente de trabalho";
										break;
									case 2:
										tipo = "Doença";
										break;
									case 3:
										tipo = "Licença-maternidade";
										break;
									case 4:
										tipo = "Aborto não criminoso";
										break;
									case 5:
										tipo = "Serviço militar";
										break;
									case 6:
										tipo = "Mandato Judicial";
										break;
									case 7:
										tipo = "Outros motivos de afastamento";
										break;
									}
							%>
							<td><%=tipo%></td>
							<td><%=afast.getTipo()%></td>
							<td><%=new SimpleDateFormat("dd 'de' MMMM 'de' yyyy")
						.format(afast.getDataInicio())%></td>
							<td><%=new SimpleDateFormat("dd 'de' MMMM 'de' yyyy")
						.format(afast.getDataFim())%></td>
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
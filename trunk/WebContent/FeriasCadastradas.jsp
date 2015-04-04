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
<title>Férias Cadastradas</title>

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
						<h1>Férias</h1>
						Lista de Férias Cadastradas
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
								<th class="success">Data Inicial</th>
								<th class="success">Data Final</th>
							</tr>
						</thead>
						<%
						  DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
			           	 // date = data); 
							List<Ferias> listaResultado = (List<Ferias>) request
									.getAttribute("lista");
							for (Ferias f : listaResultado) {
						%>
						<tr>
							<td><%=f.getColaborador().getMatricula() %></td>
							<td><%=f.getColaborador().getNome() %></td>							
							<td><%=f.getColaborador().getCpf()%></td>
							<td><%=f.getColaborador().getCargo().getNome()%></td>
							<td><%=new SimpleDateFormat("dd 'de' MMMM 'de' yyyy").format(f.getDataInicio()) %></td>
							<td><%=new SimpleDateFormat("dd 'de' MMMM 'de' yyyy").format(f.getDataFim()) %></td>
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
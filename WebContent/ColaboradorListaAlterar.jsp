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
<title>Colaborador Alterar</title>
<script type="text/javascript"
	src="bootstrap-3.3.2/js/tests/vendor/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
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
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#tabela').DataTable();
	});
	function excluir(id, nome) {
		if (confirm("Deseja excluir o COLABORADOR: " + nome + "?")) {
			window.location.href = "ColaboradorControlador?acao=excluir&id=" + id
		}
	}
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
						<h1>Colaborador</h1>
						Alterar
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
								<th class="success">Excluir</th>
								<th class="success">Alterar</th>	
							</tr>
						</thead>

						<%
							List<Colaborador> listaResultado = (List<Colaborador>) request
									.getAttribute("lista");

							
							for (Colaborador c : listaResultado) {
							
						%>
						<tr>
							<td ><%=c.getMatricula()%></td>
							<td ><%=c.getNome()%></td>
							<td ><%=c.getCpf()%></td>
							<td ><%=c.getCtps()%></td>
							<td ><%=c.getSalarioAtual()%></td>
							<td ><%=c.getEmail()%></td>
							<td ><%=c.isStatus()?"Ativo":"Inativo"%></td>
							<td ><%=c.getCargo().getNome()%></td>
							<td ><%=c.getCargo().getSetor().getNome()%></td>
							<td ><a type="button"
								onclick="excluir('<%=c.getId()%>','<%=c.getNome()%>')"
								class="btn btn-block btn-danger btn-sm">Excluir<span
									class="glyphicon glyphicon-remove"></span></a></td>
							<td ><a
								class="btn btn-block btn-primary btn-sm"
								href="ColaboradorControlador?acao=btnAlterar&id=<%=c.getId()%>">Alterar<span
									class="glyphicon glyphicon-repeat"></span></a></td>
						</tr>
						<%
							}
							%>

					</table>
				</fieldset>
			</div>
		</div>
	</div>
</body>
</html>
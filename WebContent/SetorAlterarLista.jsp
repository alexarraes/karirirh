<%@page import="java.util.List"%>
<%@page import="br.com.karirirh.entidades.Setor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<div
	class="navbar navbar-default navbar-static-top visible-lg visible-md visible-sm visible-xs">
	<div class="container">
		<div class="navbar-header"></div>
	</div>
</div>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Setor Listar</title>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
	function excluir(id, nome) {
		if (confirm("Deseja excluir o setor de " + nome + "?")) {
			window.location.href = "SetorControlador?acao=excluir&id=" + id
		}
	}
</SCRIPT>
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
	$(document).ready(function() {
		$('#tabela1').DataTable();
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
						<h1>Setor</h1>
						Setores Econtrados
					</legend>
					<table
						class="table table-bordered table-striped visible-lg visible-md visible-sm visible-xs"
						id="tabela1">
						<thead>
							<tr>
								<th>ID</th>
								<th>Nome</th>
								<th>Excluir</th>
								<th>Alterar</th>
							</tr>
						</thead>

						<%
							List<Setor> listaResultado = (List<Setor>) request
									.getAttribute("lista");

							int num = 1;
							for (Setor s : listaResultado) {
								num++;
								if ((num % 2) == 0) {
						%>
						<tr>
							<td class="success"><%=s.getId()%></td>
							<td class="success"><%=s.getNome()%></td>

							<td class="success"><a type="button"
								onclick="excluir('<%=s.getId()%>','<%=s.getNome()%>')"
								class="btn btn-block btn-danger btn-sm">Excluir<span
									class="glyphicon glyphicon-remove"></span></a></td>
							<td class="success"><a
								class="btn btn-block btn-primary btn-sm"
								href="SetorControlador?acao=btnAlterar&id=<%=s.getId()%>">Alterar<span
									class="glyphicon glyphicon-repeat"></span></a></td>
						</tr>
						<%
							} else {
						%>
						<tr>
							<td><%=s.getId()%></td>
							<td><%=s.getNome()%></td>

							<td><a type="button"
								onclick="excluir('<%=s.getId()%>','<%=s.getNome()%>')"
								class="btn btn-block btn-danger btn-sm">Excluir<span
									class="glyphicon glyphicon-remove"></span></a></td>
							<td><a class="btn btn-block btn-primary btn-sm"
								href="SetorControlador?acao=btnAlterar&id=<%=s.getId()%>">Alterar<span
									class="glyphicon glyphicon-repeat"></span></a></td>
						</tr>


						<%
							}
							}
						%>

					</table>
				</fieldset>
			</div>
		</div>
	</div>
</body>
</html>
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
<title>Colaborador Medida Disciplinar</title>
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
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/logo144.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/logo114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/logo72.png">
<link rel="apple-touch-icon-precomposed" href="img/logo57.png">
<link rel="shortcut icon" href="img/logo32.png">
<script type="text/javascript">
	$(document).ready(function() {
		$('#tabela').DataTable();
	});
	function excluir(id, nome) {
		if (confirm("Registrar Medida Disciplinar ao COLABORADOR: " + nome + "?")) {
			window.location.href = "MDControlador?acao=mDBtn&id=" + id
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
						Medida Disciplinar
					</legend>
					<table
						class="table table-bordered table-striped visible-lg visible-md visible-sm visible-xs"
						id="tabela">
						<thead>
							<tr>
								<th class="success">Matrícula</th>
								<th class="success">Nome</th>
								<th class="success">CPF</th>

								<th class="success">Situação</th>
								<th class="success">Cargo</th>
					
								<th class="success">Atribuir<br>Medida</th>
									
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
						
							<td ><%=c.isStatus()?"Ativo":"Inativo"%></td>
							<td ><%=c.getCargo().getNome()%></td>
						
							<td >
									
									<center>
									
									<input onclick="excluir('<%=c.getId()%>','<%=c.getNome()%>')" type=image  src="img/addMD.png"/>
								
								</center>
									</td>
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
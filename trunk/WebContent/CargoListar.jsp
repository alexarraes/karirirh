<%@page import="java.util.List"%>
<%@page import="br.com.karirirh.entidades.Cargo"%>
<%@page import="br.com.karirirh.entidades.Setor"%>
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
<title>Cargo Listar</title>
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
<script src="jQueryUI/jquery-ui.js"></script>
<script src="jQueryUI/jquery-ui.js"></script>
<link rel="stylesheet" href="jQueryUI/jquery-ui.css">
<link href="css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">
	$(document).ready(function() {
		$('#tabela').DataTable();
	});
</script>
<script>
function descricao(descricao) {
	document.getElementById('1').value = descricao;
	
}
	$(function () {
		
		$("#dialog").dialog({
			
			autoOpen : false,
			show : {
				effect : "blind",
				duration : 1000
			},
			hide : {
				effect : "explode",
				duration : 1000
			}
			
		});

		$(".img").click(function() {
			$("#dialog").dialog("open");
		});
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
						<h1>Cargo</h1>
						Cargos Encontrados
					</legend>
					<table
						class="table table-bordered table-striped visible-lg visible-md visible-sm visible-xs"
						id="tabela">
						<thead>
							<tr>
								<th>ID</th>
								<th>Nome</th>
								<th>Salário</th>
								<!--  	<th>Qtd Funcionarios</th>-->
								<th>Setor</th>
								<th>Descrição</th>
								<th>Colaboradores</th>
							</tr>
						</thead>

						<%
							List<Cargo> listaResultado = (List<Cargo>) request
									.getAttribute("lista");
							int num = 1;
							for (Cargo c : listaResultado) {
								num++;
								if ((num % 2) == 0) {
						%>
						<tr>
							<td class="success"><%=c.getId()%></td>
							<td class="success"><%=c.getNome()%></td>
							<td class="success"><%=c.getSalario()%></td>
							<td class="success"><%=c.getSetor().getNome()%></td>
							<td class="success"><center>
									<input class="img" onclick="descricao('<%= c.getDescricao() %>')" type=image src="img/interrogacao2.png"></input>
								</center></td>

							<td class="success"><center> 
							<input type=image
									onclick="cargos('<%=c.getId()%>')"
									 src="img/colaborador24.png"></input>
							</center>
							</td>
						</tr>
					
						<%
							} else {
						%>
						<tr>
							<td><%=c.getId()%></td>
							<td><%=c.getNome()%></td>
							<td><%=c.getSalario()%></td>
							<td><%=c.getSetor().getNome()%></td>
							<td ><center>
									<input onclick="descricao('<%=c.getDescricao() %>')"class="img" type=image src="img/interrogacao2.png"></input>
								</center></td>

							<td> <center><input type=image
									onclick="cargos('<%=c.getId()%>')"
									 src="img/colaborador24.png"></input></center></td>
						</tr>

			
					<%
						}	
								
						}
							%>
							</table>
							<div id="dialog" title="Descrição do Cargo">
							<TEXTAREA id="1" readonly="readonly"></TEXTAREA>
							</div>	
				</fieldset>
			</div>
		</div>
	</div>
		<jsp:include page="rodape.jsp"></jsp:include>
</body>
</html>
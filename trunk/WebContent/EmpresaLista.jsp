<%@page import="java.util.List"%>
<%@page import="br.com.karirirh.entidades.Empresa"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<jsp:include page="EmpresaCabecalho.jsp"></jsp:include>
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

<link rel="stylesheet" href="css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Usuários</title>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
	function excluir(id, nome) {
		if (confirm("Deseja excluir o usuário " + nome + "?")) {
			window.location.href = "AdministradorControlador?acao=excluir&id=" + id
		}
	}
	$(document).ready(function(){
	    $('#tabela1').DataTable();
	});
		
</SCRIPT>



</head>
<body>

	
	<fieldset>
	<legend>Empresas Encotradas</legend>
		<table
			class="table table-bordered table-striped visible-lg visible-md visible-sm visible-xs" id="tabela1">
			<thead>
				<tr>
					<th>ID</th>
					<th>Razão Social</th>
					<th>CNPJ</th>
					<th>Excluir</th>
					<th>Alterar</th>
				</tr>
			</thead>

			<%
				List<Empresa> listaResultado = (List<Empresa>) request
						.getAttribute("lista");

				int num = 1;
				for (Empresa u : listaResultado) {
					num++;
					if ((num % 2) == 0) {
			%>
			<tr>
				<td class="success"><%=u.getId()%></td>
				<td class="success"><%=u.getRazaoSociao()%></td>
				<td class="success"><%=u.getCnpj()%></td>

				<td class="success"><a type="button"
					onclick="excluir('<%=u.getId()%>','<%=u.getRazaoSociao() %>')"
					class="btn btn-block btn-danger btn-sm">Excluir<span
						class="glyphicon glyphicon-remove"></span></a></td>
				<td class="success"><a class="btn btn-block btn-primary btn-sm"
					href="AdministradorControlador?acao=btnAlterar&id=<%=u.getId()%>">Alterar<span
						class="glyphicon glyphicon-repeat"></span></a></td>
			</tr>
			<%
				} else {
			%>
			<tr>
			<td ><%=u.getId()%></td>
				<td ><%=u.getRazaoSociao()%></td>
				<td><%=u.getCnpj()%></td>
				<td ><a type="button"
					onclick="excluir('<%=u.getId()%>','<%=u.getRazaoSociao() %>')"
					class="btn btn-block btn-danger btn-sm">Excluir<span
						class="glyphicon glyphicon-remove"></span></a></td>
				<td ><a class="btn btn-block btn-primary btn-sm"
					href="AdministradorControlador?acao=btnAlterar&id=<%=u.getId()%>">Alterar<span
						class="glyphicon glyphicon-repeat"></span></a></td>
			</tr>
			<%
				}
				}
			%>

		</table>
	</fieldset>
</body>
</html>

<jsp:include page="EmpresaRodape.jsp"></jsp:include>
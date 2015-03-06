<%@page import="java.util.List"%>
<%@page import="br.com.karirirh.entidades.Empresa"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<jsp:include page="EmpresaCabecalho.jsp"></jsp:include>

<link rel="stylesheet" href="css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Usu�rios</title>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
	function excluir(id, nome) {
		if (confirm("Deseja excluir o usu�rio " + nome + "?")) {
			window.location.href = "AdministradorControlador?acao=excluir&id=" + id
		}
	}
</SCRIPT>

</head>
<body>

	<legend>Usu�rios Encotrados</legend>
	<fieldset>
		<table
			class="table table-bordered table-striped visible-lg visible-md visible-sm visible-xs">
			<thead>
				<tr>
					<th>#</th>
					<th>Raz�o Social</th>
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
					href="UsuarioControlador?acao=alterar&id=<%=u.getId()%>">Alterar<span
						class="glyphicon glyphicon-repeat"></span></a></td>
			</tr>


			<%
				} else {
			%>
			<tr>
			<td ><%=u.getId()%></td>
				<td ><%=u.getRazaoSociao()%></td>
				<td><%=u.getCnpj()%></td>
				<td><a type="button"
					onclick="excluir('<%=u.getId()%>','<%=u.getRazaoSociao() %>')"
					class="btn btn-block btn-danger btn-sm">Excluir<span
						class="glyphicon glyphicon-remove"></span></a></td>
				<td><a class="btn btn-block btn-primary btn-sm"
					href="UsuarioControlador?acao=alterar&id=<%=u.getId()%>">Alterar<span
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
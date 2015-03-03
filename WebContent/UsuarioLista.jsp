<%@page import="java.util.List"%>
<%@page import="br.com.karirirh.entidades.Usuario"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="UsuarioCabecalho.jsp"></jsp:include>
<link rel="stylesheet" href="css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Usuários</title>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
function excluir(id, nome) {
    if (confirm("Deseja excluir o usuário "+nome+"?")) {
    	window.location.href="UsuarioControlador?acao=excluir&id="+id
    } 
}

</SCRIPT>

</head>
<body>

<legend>Usuários Encotrados</legend>	
 <fieldset>
			<table  class="table table-bordered table-striped visible-lg visible-md visible-sm visible-xs">
				<thead>
					<tr>
						<th>#</th>
						<th>Login</th>
						<th>CNPJ</th>
						<th>Senha</th>
						<th>Adm Responsável</th>
						<th>Excluir</th>
						<th>Alterar</th>
					</tr>
				</thead>
				
				<%
				List<Usuario> listaResultado = (List<Usuario>) request
						.getAttribute("lista");
			%>
				<%
					int num = 1;
					for (Usuario u : listaResultado) {
						num++;
						if ((num % 2) == 0) {
				%>

				
			
					<tr>
						<td class="success"><%=u.getId()%></td>
						<td class="success"><%=u.getLogin()%></td>
						<td class="success"><%=u.getCnpj() %></td>
						<td class="success"><%=u.getSenha()%></td>
						<td class="success"><%=u.getAdmin().getLogin()%></td>
						<td class="success"><a type="button" onclick="excluir('<%=u.getId()%>','<%=u.getLogin()%>')"  class="btn btn-block btn-danger btn-sm">Excluir<span class="glyphicon glyphicon-remove"></span></a>
				       	</td>
						<td class="success"	><a class="btn btn-block btn-primary btn-sm" href="UsuarioControlador?acao=alterar&id=<%=u.getId()%>">Alterar<span class="glyphicon glyphicon-repeat"></span></a>
						</td>
					</tr>


					<%
						} else {
					%>
					<tr>
						<td ><%=u.getId()%></td>
						<td ><%=u.getLogin()%></td>
						<td ><%=u.getCnpj()%></td>
						<td><%=u.getSenha()%></td>
						<td> <%=u.getAdmin().getLogin()%></td>
						<td>
						<a type="button" onclick="excluir('<%=u.getId()%>','<%=u.getLogin()%>')" class="btn btn-block btn-danger btn-sm">Excluir<span class="glyphicon glyphicon-remove"></span></a>
				       	</td>
						<td>
						<a class="btn btn-block btn-primary btn-sm" href="UsuarioControlador?acao=alterar&id=<%=u.getId()%>">Alterar<span class="glyphicon glyphicon-repeat"></span></a>
						</td>
						
					</tr>


					<%
						}
						}
					%>
			
			</table>
</fieldset>
</body>
</html>

<jsp:include page="UsuarioRodape.jsp"></jsp:include>
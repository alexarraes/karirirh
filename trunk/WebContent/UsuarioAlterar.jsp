<%@page import="br.com.karirirh.entidades.Usuario"%>
<%@page import="br.com.karirirh.entidades.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="UsuarioCabecalho.jsp"></jsp:include>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script>
function comprovarSenha(){
    senha1 = document.UsuarioAlt.senha.value
    senha2 = document.UsuarioAlt.senhaConfirmar.value

    if (senha1== senha2){
    	document.UsuarioAlt.submit() 
    	//alert("As duas senhas são iguais...\nRealizaríamos as ações do caso positivo")
    }else{ 	
    alert("Olá, Administrador.\nPor favor, verifique se as SENHAS coincidem.")
    UsuarioAlt.senha.focus();
    }
}
</script>


<%
HttpServletRequest httpServletRequest = (HttpServletRequest) request;
String url = httpServletRequest .getRequestURI();
HttpSession sessao = httpServletRequest .getSession();
Admin admin =(Admin)sessao.getAttribute("adminAutenticado");
%>

<legend>Alterar Dados</legend>
<%
	Usuario usu = (Usuario) request.getAttribute("usuario");
%>
<form name="UsuarioAlt" action="UsuarioControlador" method="get">
	<fieldset>
		<input type="hidden" name="acao" value="alterarCadastro"> 
		
		<label for="UsuarioAlt">ID do Administrador <%=admin.getLogin() %>:</label> <input readonly="readonly" size="5"
			class="form-control" type="text" name="idAdmin"
			value="<%=admin.getId()%>">
			 <br />

		<label for="UsuarioAlt">ID do Usuário:</label> <input readonly="readonly"
			size="5" class="form-control" type="text" name="id"
			value="<%=usu.getId()%>">
			<br />
			
		<label for="UsuarioAlt">Login:</label><input class="form-control" type="text"
			 required="required" name="login" value="<%=usu.getLogin()%>"> 
			<br />
			
		<label for="UsuarioAlt">CNPJ:</label> <input class="form-control"
			type="text" name="cnpj" required="required" MAXLENGTH="18" value="<%=usu.getCnpj()%>">
			<br />
		
		 <label for="UsuarioAlt">Senha:</label> <input class="form-control"
			type="text" required="required" name="senha"
			value="<%=usu.getSenha()%>">
			<br /> 
		
		<label for="UsuarioAlt">Corfirmar Senha:</label> <input class="form-control" 
			type="text" required="required"
			name="senhaConfirmar" value="<%=usu.getSenha()%>">
			<br />

		<button type="button" class="btn btn-primary" for="UsuarioAlt" onClick="comprovarSenha()">
			<span class="glyphicon glyphicon-ok"></span>Alterar
		</button>
		<input class="btn btn-danger" type="button" value="Voltar"
			onClick="history.go(-1)">
	</fieldset>
	<br />

</form>


</div>


</div>
</div>
<jsp:include page="UsuarioRodape.jsp"></jsp:include>

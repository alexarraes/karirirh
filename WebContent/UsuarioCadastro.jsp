<%@page import="br.com.karirirh.entidades.Admin"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="UsuarioCabecalho.jsp"></jsp:include>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script>
function comprovarSenha(){
    senha1 = document.UsuarioCadastro.senha.value;
    senha2 = document.UsuarioCadastro.senhaConfirmar.value;

    if (senha1== senha2){
    	document.UsuarioCadastro.submit() ;
    }else{ 	
    alert("Olá, Administrador.\nPor favor, verifique se as SENHAS coincidem.");
    UsuarioCadastro.senha.focus();
    }
}
</script>

<%
HttpServletRequest httpServletRequest = (HttpServletRequest) request;
HttpSession sessao = httpServletRequest .getSession();
Admin admin =(Admin)sessao.getAttribute("adminAutenticado");
%>

<legend>Cadastrar</legend>	
<%if(request.getAttribute("msg")!=null){
%>
<center><%=request.getAttribute("msg") %></center>
<%
}
	%>
  
  

<form name="UsuarioCadastro" action="UsuarioControlador" method="get">
	<fieldset>
 <input type="hidden" name="acao" value="usuarioCadastrar">
 		<label for="UsuarioCadastro">ID do Administrador <%=admin.getLogin() %>:</label> <input readonly="readonly" size="5"
			class="form-control" type="text" name="idAdmin"
			value="<%=admin.getId()%>">
			 <br /> 
		<label for="UsuarioCadastro">Login:</label> <input
			class="form-control" type="text" name="login"
			placeholder="Ex.: KaririRH" required="required">
			<br /> 
		<label for="UsuarioCadastro">CNPJ:</label> <input class="form-control"
			type="text" name="cnpj" placeholder="Ex.: 71.981.389/0001-41" required="required" MAXLENGTH="18">
			<br />
		<label for="UsuarioCadastro">Senha:</label> <input class="form-control"
			type="text" name="senha" placeholder="********" required="required" MAXLENGTH="8">
			<br />
		<label for="UsuarioCadastro" >Corfirmar Senha:</label> <input class="form-control"
			type="text" name="senhaConfirmar" placeholder="********" required="required" MAXLENGTH="8"><br />

	<button type="button" class="btn btn-success" for="UsuarioCadastro" onClick="comprovarSenha()"> <span class="glyphicon glyphicon-ok"></span> Cadastrar</button>
	<button type="reset" class="btn btn-danger"> <span class="glyphicon glyphicon-remove-sign"></span>Limpar</button>
	</fieldset>
	<br />

</form>


</div>


</div>
</div>
<jsp:include page="UsuarioRodape.jsp"></jsp:include>

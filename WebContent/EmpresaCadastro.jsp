<%@page import="br.com.karirirh.entidades.Usuario"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="EmpresaCabecalho.jsp"></jsp:include>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script>
function comprovarSenha(){
    senha1 = document.CadastroEmpresa.senha.value;
    senha2 = document.CadastroEmpresa.senhaConfirmar.value;

    if (senha1== senha2){
    	document.CadastroEmpresa.submit() ;
    }else{ 	
    alert("Olá, Administrador.\nPor favor, verifique se as SENHAS coincidem.");
    CadastroEmpresa.senha.focus();
    }
}
</script>

<%
HttpServletRequest httpServletRequest = (HttpServletRequest) request;
HttpSession sessao = httpServletRequest .getSession();
Usuario admin =(Usuario)sessao.getAttribute("administrador");
%>

<legend>Cadastrar</legend>	
<%if(request.getAttribute("msg")!=null){
%>
<center><%=request.getAttribute("msg") %></center>
<%
}
	%>
  
  

<form name="CadastroEmpresa" action="AdministradorControlador" method="get">
	<fieldset>
 <input type="hidden" name="acao" value="cadastrar">
 		<label for="CadastroEmpresa">ID do Administrador <%=admin.getLogin() %>:</label> <input readonly="readonly" size="5"
			class="form-control" type="text" name="idAdmin"
			value="<%=admin.getId()%>">
			 <br /> 
		<label for="CadastroEmpresa">Razão Social:</label> <input
			class="form-control" type="text" name="razaoSocial"
			placeholder="Ex.: KaririRH" required="required" MAXLENGTH="45">
			<br />
		<label for="CadastroEmpresa">CNPJ:</label> <input class="form-control"
			type="text" name="cnpj" placeholder="Ex.: 71.981.389/0001-41" required="required" MAXLENGTH="18">
			<br />
		<label for="CadastroEmpresa">Endereço Completo:</label> <input class="form-control"
			type="text" name="enderecoCompleto" placeholder="Ex.: Rua: Ipanema, 156 Bairro:Centro Brejo Santo-Ceará" required="required" MAXLENGTH="100">
			<br />
		<label for="CadastroEmpresa">Fone:</label> <input class="form-control"
			type="text" name="fone" placeholder="(88) 9714-1354" required="required" MAXLENGTH="45">
			<br />
		
		<label for="CadastroEmpresa">Login:</label> <input
			class="form-control" type="text" name="login"
			placeholder="Ex.: KaririRH" required="required">
			<br /> 
		
		<label for="CadastroEmpresa">Senha:</label> <input class="form-control"
			type="text" name="senha" placeholder="********" required="required" MAXLENGTH="8">
			<br />
		<label for="CadastroEmpresa">Corfirmar Senha:</label> <input class="form-control"
			type="text" name="senhaConfirmar" placeholder="********" required="required" MAXLENGTH="8"><br />

	<button type="button" class="btn btn-success" for="CadastroEmpresa"onClick="comprovarSenha()"> <span class="glyphicon glyphicon-ok"></span> Cadastrar</button>
	<button type="reset" class="btn btn-danger"> <span class="glyphicon glyphicon-remove-sign"></span>Limpar</button>
	</fieldset>
	<br />

</form>


</div>


</div>
</div>
<jsp:include page="EmpresaRodape.jsp"></jsp:include>

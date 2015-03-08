<%@page import="br.com.karirirh.entidades.Empresa"%>
<%@page import="br.com.karirirh.entidades.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="EmpresaCabecalho.jsp"></jsp:include>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script>
function comprovarSenha(){
    senha1 = document.EmpresaAlterar.senha.value
    senha2 = document.EmpresaAlterar.senhaConfirmar.value

    if (senha1== senha2){
    	document.EmpresaAlterar.submit() 
    }else{ 	
    alert("Olá, Administrador.\nPor favor, verifique se as SENHAS coincidem.")
    EmpresaAlterar.senha.focus();
    }
}
</script>

<legend>Alterar Dados</legend>
<%
	Empresa emp = (Empresa) request.getAttribute("empresa");
	Usuario usu = (Usuario) request.getAttribute("usuario");
%>
<%if(request.getAttribute("msg")!=null){
%>
<center><%=request.getAttribute("msg") %></center>
<%
}
	%>
<form name="EmpresaAlterar" action="AdministradorControlador" method="get">
	<fieldset>
 <input type="hidden" name="acao" value="alterar">
 		<label for="EmpresaAlterar">ID da Empresa:</label> <input readonly="readonly"
			class="form-control" type="text" name="idEmpresa" value="<%=emp.getId()%>">
			 <br /> 
		<label for="EmpresaAlterar">Razão Social:</label> <input
			class="form-control" type="text" name="razaoSocial"
			placeholder="Ex.: KaririRH" required="required" MAXLENGTH="45" value="<%=emp.getRazaoSociao()%>">
			<br />
		<label for="EmpresaAlterar">CNPJ:</label> <input class="form-control"
			type="text" name="cnpj" placeholder="Ex.: 71.981.389/0001-41" required="required" MAXLENGTH="18" value="<%=emp.getCnpj()%>">
			<br />
		<label for="EmpresaAlterar">Endereço Completo:</label> <input class="form-control"
			type="text" name="enderecoCompleto" placeholder="Ex.: Rua: Ipanema, 156 Bairro:Centro Brejo Santo-Ceará" required="required" MAXLENGTH="100"
			value="<%=emp.getEnderecoCompleto()%>">
			<br />
		<label for="EmpresaAlterar">Fone:</label> <input class="form-control"
			type="text" name="fone" placeholder="(88) 9714-1354" required="required" MAXLENGTH="45" value="<%=emp.getFone()%>">
			<br />
		
		<label for="EmpresaAlterar">Login:</label> <input
			class="form-control" type="text" name="login"
			placeholder="Ex.: KaririRH" required="required" readonly="readonly" value="<%=usu.getLogin()%>">
			<br /> 
		
		<label for="EmpresaAlterar">Senha:</label> <input class="form-control"
			type="text" name="senha" placeholder="********" required="required" MAXLENGTH="8" value="<%=usu.getSenha()%>">
			<br />
		<label for="EmpresaAlterar">Corfirmar Senha:</label> <input class="form-control"
			type="text" name="senhaConfirmar" placeholder="********" required="required" MAXLENGTH="8" value="<%=usu.getSenha()%>"><br />

	<button type="button" class="btn btn-primary" for="EmpresaAlterar"onClick="comprovarSenha()"> <span class="glyphicon glyphicon-ok"></span>Alterar</button>
	<input class="btn btn-danger" type="button" value="Voltar"
			onClick="history.go(-1)">
	</fieldset>
	<br />

</form>

<jsp:include page="EmpresaRodape.jsp"></jsp:include>

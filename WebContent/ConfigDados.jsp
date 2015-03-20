<%@page import="br.com.karirirh.entidades.Empresa"%>
<%@page import="br.com.karirirh.entidades.Usuario"%>

<html>

<div
	class="navbar navbar-default navbar-static-top visible-lg visible-md visible-sm visible-xs">
	<div class="container">
		<div class="navbar-header">
			<jsp:include page="Cabecalho.jsp"></jsp:include>
		</div>
	</div>
</div>

<head>
<meta charset="utf-8">
<title>Dados Empresariais</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="AlexArraes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript"
	src="bootstrap-3.3.2/js/tests/vendor/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
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
</head>

<body>


	<form name="EmpresaAlterar" action="MenuControlador" method="get">
		<fieldset>
			<input type="hidden" name="acao" value="alterar">
			<!-- Form Name -->
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<legend draggable="true">
								<h1>Dados Empresariais</h1>
							</legend>
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
							<div class="col-md-12">
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
	<button type="button" class="btn btn-warning" onClick="history.go(-1)"> 
								<span class="glyphicon glyphicon-arrow-left"> </span>Voltar
								</button>
			</div>
			</div>
			</div>
			</div>
			</div>
	</fieldset>
	<br />

</form>

</body>

</html>
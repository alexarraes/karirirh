<%@page import="br.com.karirirh.entidades.Setor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Alterar Setor</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="AlexArraes">
<link href="css/bootstrap.css" rel="stylesheet">
<script type="text/javascript"
	src="bootstrap-3.3.2/js/tests/vendor/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	function open(msg) {
		if(msg != "nada"){alert(msg)}	
	}
</script>
<%
String msg =(String)request.getAttribute("msg");
if(msg == null){
	msg = "nada";
}
%>
</head>
<body onLoad="open('<%=msg %>')">
	<form name="CadastroSetor" action="SetorControlador" method="get">
		<fieldset>
			<input type="hidden" name="acao" value="alterar">
			<!-- Form Name -->
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<legend draggable="true">
								<h1>Setor</h1>
								Alterar
							</legend>
							<div class="col-md-12">
							
								<%
									Setor setor = (Setor) request.getAttribute("setor");
								%>


								<div class="form-group" draggable="true">
									<label for="AlterarSetor">ID:</label>
									<div>
										<input id="id" name="id" type="text" readonly="readonly"
											value="<%=setor.getId()%>" class="form-control input-md"
											required="required">
									</div>
								</div>



								<div class="form-group" draggable="true">
									<label for="AlterarSetor">Nome do Setor:*</label>
									<div>
										<input id="nome" name="nome" type="text"
											value="<%=setor.getNome()%>" class="form-control input-md"
											required="required">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class=col-md-12>
						<button type="submit" class="btn btn-primary" for="AlterarSetor">
							<span class="glyphicon glyphicon-repeat"></span>Alterar
						</button>
						
						<button type="button" class="btn btn-warning" onClick="history.go(-1)"> 
								<span class="glyphicon glyphicon-arrow-left"> </span>Voltar
								</button>
					</div>
				</div>
			</div>
			
		</fieldset>
	</form>
		<jsp:include page="rodape.jsp"></jsp:include>
</body>

</html>
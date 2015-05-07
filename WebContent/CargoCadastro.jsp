<%@page import="java.util.List"%>
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
<title>Cadastro Cargo</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="AlexArraes">
<link href="css/bootstrap.css" rel="stylesheet">
<script type="text/javascript"
	src="bootstrap-3.3.2/js/tests/vendor/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script src="jQueryUI/jquery-ui.js"></script>
<link rel="stylesheet" href="resources/demos/style.css">
<link rel="stylesheet" href="jQueryUI/jquery-ui.css">
<script src="jQueryUI/jquery.maskedinput.js"  type="text/javascript"></script>
<script type="text/javascript">
function ConsisteNumerico(tam, fld, e) {
	    var key = '';
	    var i = 0;
	    var len = 0;
	    var strCheck = '0123456789';
	    var aux = '';
	    var whichCode = (window.Event) ? e.which : e.keyCode;
	    if (whichCode == 13 || whichCode == 8 || whichCode == 0)
	        return true;  // Enter
	    key = String.fromCharCode(whichCode);  // Get key value from key code
	    if (strCheck.indexOf(key) == -1)
	        return false;  // Not a valid key
	    len = tam -1;
	    aux = '';
	    for(; i < len; i++)
	        if (strCheck.indexOf(fld.value.charAt(i))!=-1)
	            aux += fld.value.charAt(i);
	    aux += key;
	    fld.value = '';
	    fld.value += aux;
	    return false;
	}

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


	<form name="CadastroCargo" action="CargoControlador" method="get">
		<fieldset>
			<input type="hidden" name="acao" value="salvar">
			<!-- Form Name -->
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<legend draggable="true">
								<h1>Cargo</h1>
								Cadastrar
							</legend>
							<div class="col-md-8">
								<!--nome-->
								<div class="form-group" draggable="true">
									<label for="CadastroCargo">Nome do Cargo:*</label>
									<div>
										<input id="nome" name="nome" type="text"
											placeholder="Ex.: Auxiliar de Acabamento"
											class="form-control input-md" required="required">
									</div>
								</div>
							</div>
							<div class="col-md-2">
								<!--salario-->
								<div class="form-group">
									<label for="CadastrarCargo">Valor do Salário R$:*</label>
									<div >
										<input id="salario" name="salario" type="text"
											placeholder="788" class="form-control input-md"
											size="10"
											onKeyPress="return(ConsisteNumerico('10',this,event))"
											required="required">
									</div>
								</div>
							</div>
						</div>
						<!--salario-->
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<label for="CadastroCargo">Setor:*</label>
							<div>
								<select id="setor" name="setor" class="form-control">
									<%
										List<Setor> listaResultado = (List<Setor>) request
												.getAttribute("lista");
										for (Setor s : listaResultado) {
									%>

									<option value="<%=s.getId()%>"><%=s.getNome()%></option>

									<%
										}
									%>
								</select>

							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<!--nome-->
					<div class="col-md-5">
						<!-- Descricao -->
						<div class="form-group">
							<label for="CadastroCargo">Descrição:*</label>
							<div>
								<textarea class="form-control" id="descricao" name="descricao"></textarea>
							</div>
						</div>
						<!-- Descricao -->
					</div>
					<div class=col-md-12>
						<button type="submit" class="btn btn-success" for="CadastroCargo">
							<span class="glyphicon glyphicon-ok"></span>Cadastrar
						</button>
						<button type="reset" class="btn btn-danger">
							<span class="glyphicon glyphicon-remove-sign"></span>Limpar
						</button>
					</div>
				</div>
		</fieldset>
	</form>
	<jsp:include page="rodape.jsp"></jsp:include>
</body>

</html>
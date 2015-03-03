<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>

<head>

 <div class="navbar navbar-default navbar-static-top visible-lg visible-md visible-sm visible-xs">
      <div class="container">
        <div class="navbar-header"> 
        <jsp:include page="Cabecalho.jsp"></jsp:include>
</div>
</div>
</div>
	
	<meta charset="utf-8">
	<title>Cadastro Cargo</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link
		href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
		rel="stylesheet">
	<script type="text/javascript"
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script type="text/javascript"
		src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	</head>	
		<body>
		
		
		
	<form name="CadastroCargo" action="CargoControlador" method="get">
		<fieldset>
		<input type="hidden" name="acao" value="salvar">
			<!-- Form Name -->
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<legend draggable="true">
								<h1>Cadastro Cargo</h1>
								Dados do Cargo
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
									<div>
										<input id="salario" name="salario" type="text"
											placeholder="788,00" class="form-control input-md"
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
									<option value="1">Option one</option>
									<option value="2">Option two</option>
								</select>

							</div>
						</div>
					</div>
				</div>
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
</body>

</html>
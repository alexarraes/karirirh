<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="style-exemplo.css" rel="stylesheet" />
<script type="text/javascript"
	src="bootstrap-3.3.2/js/tests/vendor/jquery.min.js"></script>
<script type="text/javascript" src="js/addLinhas.js"></script>

<title>Formulário dinâmico com jQuery - #Exemplo 1</title>
</head>

<body>

	<h1>Formulário dinâmico com jQuery - #Exemplo 1</h1>


	<form action="Teste" method="get" id="form-produtos">
		<input title="Informe o Tipo de Parentesco e o Nome!" name="acao"
			value="salvar" />
		<div id="wrapper-formulario">
			<div>
				<table id="grid-produtos">
					<thead>
						<tr>
							<th>Parentesco</th>
							<th>Nome</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
					<tfoot>
						<tr>
							<td colspan="2"><br /></td>
						</tr>
					</tfoot>
				</table>
				<!--Irá armazenar a quantidade de linhas-->
				<input type="hidden" value="1" name="qtdItens" />

				<button id="button-add" class="button">Adicionar Linha</button>
				<input id="button-submit" type="submit" value="Enviar"
					class="button" />
			</div>
		</div>
	</form>
</body>
</html>

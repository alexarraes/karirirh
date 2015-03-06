<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="EmpresaCabecalho.jsp"></jsp:include>
<link rel="stylesheet" href="css/bootstrap.min.css">

<legend>Buscar</legend>

<form name="EmpresaBuscar" action="AdministradorControlador"
	method="get">
	<fieldset>
		<input type="hidden" name="acao" value="buscar">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">

				<div class="form-group">
					<label for="EmpresaBuscar">Buscar Por:*</label>
					<div>
						<select id="campo" name="campo" class="form-control">
							<option value="razaoSociao">Razão Social</option>
							<option value="cnpj">CNPJ</option>
						</select>
					</div>
				</div>
			</div>
			<div class="col-md-0.1"></div>
			<div class="col-md-4">
				<label for="EmpresaBuscar">.</label> <input class="form-control"
					type="text" name="valor" placeholder="Ex.: KaririRH, karirirh">
				<BR />
			</div>
		</div>


		<button type="submit" class="btn btn-success" for="EmpresaBuscar">
			<span class="glyphicon glyphicon-search"></span> Buscar
		</button>
		<button type="reset" class="btn btn-danger">
			<span class="glyphicon glyphicon-remove-sign"></span>Limpar
		</button>
		<br /> <br /> <br />

	</fieldset>
	<br />

</form>



<jsp:include page="EmpresaRodape.jsp"></jsp:include>
</body>

</html>
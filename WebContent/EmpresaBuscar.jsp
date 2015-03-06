<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:include page="UsuarioCabecalho.jsp"></jsp:include>
<link rel="stylesheet" href="css/bootstrap.min.css">

<legend>Buscar</legend>	

<form name="UsuarioBuscar" action="UsuarioControlador" method="get">
	<fieldset>  
	<input type="hidden" name="acao" value="usuarioBuscar">
		<label for="UsuarioBuscar">Buscar por Login:</label> <input
			class="form-control" type="text" name="login"
			placeholder="Ex.: KaririRH">
			<BR/>
			

	<button type="submit" class="btn btn-success" > <span class="glyphicon glyphicon-search"></span> Buscar</button>
	<button type="reset" class="btn btn-danger"> <span class="glyphicon glyphicon-remove-sign"></span>Limpar</button>
	<br/>
	<br/>
	<br/>
	
	</fieldset>
	<br />
	
</form>

        
</div>
</div>
</div>
<jsp:include page="UsuarioRodape.jsp"></jsp:include>
</body>

</html>
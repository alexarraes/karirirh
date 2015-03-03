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
    <title>Cadastro Setor</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
    rel="stylesheet">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </head>
  
  <body>
  
  
    <form name="CadastroSetor" action="SetorControlador" method="get">
      <fieldset>
      <input type="hidden" name="acao" value="salvar">
        <!-- Form Name -->
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="row">
                <legend draggable="true">
                  <h1>Cadastro Setor</h1>Dados do Setor</legend>
                <div class="col-md-12">
                  <!--nome-->
                  <div class="form-group" draggable="true">
                    <label for="CadastorSetor">Nome do Setor:*</label>
                    <div>
                      <input id="nome" name="nome" type="text" placeholder="Ex.: Recursos Humanos"
                      class="form-control input-md" required="required">
                    </div>
                  </div>
                  </div>
                  <!--nome-->
                  <div class="col-md-5">
                    <!--Quantidade de Funcionarios-->
                    <div class="form-group" draggable="true">
                      <label for="CadastorSetor">Quantidade de Funcionarios:*</label>
                      <div>
                        <input id="qtdFuncionarios" name="qtdFuncionarios" type="text" placeholder="Ex.: 10"
                        class="form-control input-md" required="required">
                      </div>
                    </div>
                    <!--Quantidade de Funcionariss-->
                  </div>
                  <div class="col-md-2"></div>
                  <div class="col-md-5">
                    <!--qtdFerias-->
                    <div class="form-group" draggable="true">
                      <label for="CadastorSetor">Quantidade de vagas para férias:*</label>
                      <div>
                        <input id="qtdFerias" name="qtdFerias" type="text" placeholder="Ex.: 6"
                        class="form-control input-md" required="required">
                      </div>
                    </div>
                    </div>
                    </div>
                    <!--Quantidade de Funcionariss-->
                  </div>
                  <div class=col-md-12>
					<button type="submit" class="btn btn-success" for="CadastroSetor">
						<span class="glyphicon glyphicon-ok"></span>Cadastrar
					</button>
					<button type="reset" class="btn btn-danger">
						<span class="glyphicon glyphicon-remove-sign"></span>Limpar
					</button>
				</div>
                </div>
              </div>
            </div>
      
  
      </fieldset>
    </form>
  </body>

</html>
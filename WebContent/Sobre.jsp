
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html lang="pt-br">

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
<title>Sobre</title>

<meta name="AlexArraes">

<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="modal/js/jquery.min.js"></script>
<script type="text/javascript" src="modal/js/bootstrap.min.js"></script>
<script type="text/javascript" src="modal/js/scripts.js"></script>
<link href="css/font-awesome.min2.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">

</head>

<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h1>Sobre</h1>
				<hr>
				  <div id="fullcarousel-example" data-interval="false" class="carousel slide"
        data-ride="carousel">
            <div class="carousel-inner">
                <div class="item active">
                    <img src="img/banner1.jpg">
                    <div class="carousel-caption">
                       
                    </div>
                </div>
                <div class="item">
                    <img src="img/banner2.jpg">
                    <div class="carousel-caption">
                        
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#fullcarousel-example" data-slide="prev"><i class="icon-prev fa fa-angle-left"></i></a>
            <a class="right carousel-control" href="#fullcarousel-example" data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
        </div>
        <!-- fim  <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
        rel="stylesheet" type="text/css">
        <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
        rel="stylesheet" type="text/css"> -->
				
				<div class="btn-block">
					<h1 class="h3">O KaririRH</h1>
					<p align="justify">O prjeto KaririRH foi idealizado pelos
						alunos do Curso de Análise e Desenvolvimento de Sistemas da
						Faculdade Leão Sampaio, o mesmo partiu do intuito de automatizar
						os processos executados dentro do deparatamento de RH de empresas
						do setor calçadista na região caririense, o foco inicial desta
						aplicação é suprir as necessidades básicas do setor que gira em
						torno de gerir, selecionar e nortear os colaboradores da empresa.
						Dentro da aplicação o usuário terá acesso afunções voltadas a
						administração e controle de pessoal, através dele o gestor ou
						analista de RH, terá controle sobre o cadastro de novos
						colaboradores, setores e funções, seleção de currículo, controle
						de férias, atestados médico, afastamentos, demissões, histórico
						profissional e salarial por colaborador.</p>
					<p align="justify">A ideia central deste projeto é agilizar de
						forma prática e segura o trabalho do gestor de RH, dúvidas ou
						sugestões de melhorias entre em contato conosco.</p>

				</div>
				<div class="col-md-18 column">
					<div class="row">
						<div class="col-md-4">
							<div class="thumbnail">
								<img src="img/MISSAO.png" alt="missão" width="400" height="200">
								<div class="caption">
									<h3>Missão</h3>
									<p align="justify">Desenvolver, produzir softwares e
										oferecer serviços que agreguem valores aos nossos clientes,
										colaborar com o desenvolvimento tecnológico na região do
										Cariri.</p>
										<br><br>

								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="thumbnail">
								<img src="img/VISAO.png" alt="Visão" width="400" height="200">
								<div class="caption">
									<h3>Visão</h3>
									<p align="justify">Estar entre as principais empresas do
										mercado brasileiro no ramo de desenvolvimento de softwares
										empresariais e ser referencia em excelência no mercado
										tecnológico.</p>
										<br><br>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="thumbnail">
								<img src="img/VALORES.png" alt="300x200" width="400"
									height="200">
								<div class="caption">
									<h3>Valores</h3>
									<ul>

										<li><p align="justify">Respeito à cultura e
												princípios éticos e morais das pessoas.</p></li>
										<li><p align="justify">Transparência e clareza com o
												cliente.</p></li>
										<li><p align="justify">Garantir o reporte e segurança
												das informações.</p></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-20">

			<div class="caption">
				<h3 class="alert-success">Equipe de Desenvolvimento</h3>
				<div class="thumbnail">
					<ul>
						<li>Adriano Alexandre Andriola - Gerente de progetos</li>
						<li>Alex Júnior de Souza Arraes - Analista Desenvolvedor</li>
						<li>Érica Regina de Oliveira Leite - Testador</li>
						<li>José Rodrigues de Morais - Web Desingner</li>
						<li>Natanielly Rolim Rodrigues - Testador</li>
						<li>Oliveira Neres Neto - Analista Desenvolvedor</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="rodape.jsp"></jsp:include>
</body>
</html>
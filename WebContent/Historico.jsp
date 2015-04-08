<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.com.karirirh.entidades.MedidaDisciplinar"%>
<%@page import="br.com.karirirh.servlets.AfastamentoControlador"%>
<%@page import="br.com.karirirh.entidades.HistoricoAfastamento"%>
<%@page import="br.com.karirirh.entidades.Ferias"%>
<%@page import="br.com.karirirh.entidades.HistoricoSetor"%>
<%@page import="br.com.karirirh.entidades.HistoricoSalario"%>
<%@page import="br.com.karirirh.entidades.Dependente"%>
<%@page import="java.util.List"%>
<%@page import="br.com.karirirh.entidades.Telefone"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="br.com.karirirh.entidades.Colaborador"%>
<%@page import="br.com.karirirh.entidades.Empresa"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="modal/js/jquery.min.js"></script>
<script type="text/javascript" src="modal/js/bootstrap.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="page-header">
						<h1>
							Hist�rico <font color="#777777"> <span
								style="font-size: 23px; line-height: 23.3999996185303px;">Colaborador</span>
							</font>
						</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="text-muted">Informa��es Empresariais</h2>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<%
						Colaborador col = (Colaborador) request.getAttribute("colaborador");
						Empresa emp = (Empresa) request.getAttribute("empresa");
						List<HistoricoSetor> hSetores = (List<HistoricoSetor>) request.getAttribute("hSetor");
						List<HistoricoSalario> hSalarios = (List<HistoricoSalario>) request.getAttribute("hSalarios");
						List<Dependente> deps = (List<Dependente>) request.getAttribute("dependente");
						List<Telefone> tels = (List<Telefone>) request.getAttribute("telefone");
						List<Ferias> ferias = (List<Ferias>) request.getAttribute("ferias");
						List<HistoricoAfastamento> hAfastamento = (List<HistoricoAfastamento>) request.getAttribute("hAfastamento");
						List<MedidaDisciplinar> mD = (List<MedidaDisciplinar>) request.getAttribute("mD");
					%>
					<%
						String fixo=null;
						String celular=null;
						for (Telefone t : tels) {
							if (t.getTipo().equals("Fixo")) {
								fixo = t.getFone();
							} else if (t.getTipo().equals("Celular")) {
								celular = t.getFone();
							}
						}
					%>
					<p>
						A Empresa
						<%=" " + emp.getRazaoSociao() + " "%>
						com CNPJ:
						<%=" " + emp.getCnpj() + " "%>
						comunica todas as informa��es referentes ao colaborador
						<%=" " + col.getNome() + " "%>
						dentro da nossa organiza��o empresarial, por meio desse Hist�rico.
					</p>
					<p>
						<b>Localiza��o:</b>
						<%=emp.getEnderecoCompleto()%></p>
					<p>
						<b>Fone:</b>
						<%=emp.getFone()%></p>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="text-muted">Informa��es Pessoais</h2>
				</div>
			</div>
		</div>
	</div>

	<div class="section text-justify">
		<div class="background-image"
			style="background-image: url('fundoHistorico.jpg')"></div>
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<ul class="list-group">
						<li class="list-group-item"><p class="text-justify">
								<b>Nome:</b><%=col.getNome()%>&nbsp; <b>Sexo:</b><%=col.getSexo()%>&nbsp;
								<b>Data de Nascimento:</b><%=col.getDataNascimento()%>&nbsp; <b>Status:</b><%=(col.isStatus()) ? ("Ativo") : ("Inativo")%>&nbsp;
							</p></li>
						<li class="list-group-item"><b>RG:</b><%=col.getRg()%>&nbsp;
							<b>CPF:</b><%=col.getCpf()%>&nbsp; <b>CTPS:</b><%=col.getCtps()%>&nbsp;
							<b>PIS:</b><%=col.getPis()%>&nbsp; <b>Matr�cula:</b><%=col.getMatricula()%>&nbsp;</li>
						<li class="list-group-item"><b>Estado C�vil:</b><%=col.getEstadoCivil()%>&nbsp;
							<b>Escolaridade:</b><%=col.getEscolaridade()%>&nbsp; <b>�rea
								de Atua��o:</b><%=col.getCurso()%>&nbsp;</li>
						<li class="list-group-item"><b>Cargo:</b><%=col.getCargo().getNome()%>&nbsp;
							<b>Setor:</b><%=col.getCargo().getSetor().getNome()%></b>&nbsp; <b>Sal�rio:</b><%=col.getSalarioAtual()%>&nbsp;
							&nbsp; <b>Tempo Total na Empresa:</b><%=(col.isStatus()) ? (new Date().getDate() - col.getDataAdm().getDate()) : ( col
					.getDataDem().getDate()- col.getDataAdm().getDate())%> &nbsp;dia(s)</li>
						<li class="list-group-item"><b>Tipo de Contrato:</b><%=col.getContrato()%>&nbsp;
							<b>Data de Admiss�o:</b><%=new SimpleDateFormat("dd 'de' MMMM 'de' yyyy")
						.format(col.getDataAdm())%>
						<b>Data de Demiss�o:</b><%=col.getDataDem() %>
						&nbsp;</li>
						<li class="list-group-item"><b>Endere�o:</b><%=col.getRua()%>&nbsp;
							<b>N�:</b><%=col.getNumero()%>&nbsp; <b>Complemento:</b><%=col.getComplemento()%>&nbsp;
							<b>Bairo:</b><%=col.getBairro()%>&nbsp;</li>
						<li class="list-group-item"><b>Cidade:</b><%=col.getCidade()%>&nbsp;
							<b>CEP:</b><%=col.getCep()%>&nbsp; <b>UF:</b><%=col.getUf()%>&nbsp;
							<b>E-Mail:</b><%=col.getEmail()%>&nbsp;</li>
						<li class="list-group-item"><b>Fixo:</b><%=fixo %>&nbsp; <b>Celular:</b><%=celular %>&nbsp;</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<hr>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="text-muted">Dependentes</h2>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<p class="lead text-justify">S�o tr�s classes:</p>
					<ol>
						<li>C�njuge, companheiro(a) e filhos menores de 21 anos ou
							inv�lidos, <br>desde que n�o tenham se emancipado entre 16 e
							18 anos de idade;
						</li>
						<li>Pais;</li>
						<li>Irm�os n�o emancipados, menores de 21 anos ou inv�lidos.</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="well">
						<h2>Nome dos Dependentes:</h2>
						<%for(Dependente d: deps){
							%>	
						<p><%=d.getNomeDependete() %></p>
						<%} %>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<hr>
			</div>
			<div class="section">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h2 class="text-muted">Hist�rico de Sal�rios</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th class="info">Matr�cula</th>
								<th class="info">Data Inicial</th>
								<th class="info">Valor</th>
								
							</tr>
						</thead>
						<tbody>
						<%for(HistoricoSalario h: hSalarios){%>
							<tr>
								<td><%=h.getColaborador().getMatricula() %></td>
								<td><%=new SimpleDateFormat("dd 'de' MMMM 'de' yyyy")
						.format(h.getData())%></td>
								<td><%=h.getValor() %></td>
								
							</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
			<div class="section">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h2 class="text-muted">Hist�rico de Cargos</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th class="success">Matr�cula</th>
								<th class="success">Cargo</th>
								<th class="success">Setor</th>
								<th class="success">Data Inicial</th>
								<th class="success">Data Final</th>	
							</tr>
						</thead>
						<tbody>
						<%for(HistoricoSetor h: hSetores){ %>
							<tr>
								<td><%=h.getColaborador().getMatricula() %></td>
								<td><%=h.getCargo().getNome() %></td>
								<td><%=h.getCargo().getSetor().getNome() %></td>
								<td><%=new SimpleDateFormat("dd 'de' MMMM 'de' yyyy")
						.format(h.getDataInicio())%></td>
								<td><%=(h.getDataFim() != null)?new SimpleDateFormat("dd 'de' MMMM 'de' yyyy")
								.format(h.getDataFim()): "N�o possui"%></td>
							</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
			<div class="section">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h2 class="text-muted">Hist�rico de F�rias</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th class="warning">Matr�cula</th>
								<th class="warning">Data Inicial</th>
								<th class="warning">Data Final</th>
							
							</tr>
						</thead>
						<tbody>
						<%for(Ferias f : ferias){ %>
							<tr>
								<td><%=f.getColaborador().getMatricula() %></td>
								<td><%=f.getDataInicio()%></td>
								<td><%=f.getDataFim()%></td>
							</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
			<div class="section">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h2 class="text-muted">Hist�rico de Afastamento</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th class="danger">Matr�cula</th>
								<th class="danger">Tipo de Afastamento</th>
								<th class="danger">Observa��o</th>
								<th class="danger">Data Inicial</th>
								<th class="danger">Data Final</th>
							</tr>
						</thead>
						<tbody>
						<%for(HistoricoAfastamento h : hAfastamento){ %>
							<tr>
								<td><%=h.getColaborador().getMatricula() %></td>
								<%
								String tipo = null;
									switch (h.getCodDoenca()) {
									case 1:
										tipo = "Acidente de trabalho";
										break;
									case 2:
										tipo = "Doen�a";
										break;
									case 3:
										tipo = "Licen�a-maternidade";
										break;
									case 4:
										tipo = "Aborto n�o criminoso";
										break;
									case 5:
										tipo = "Servi�o militar";
										break;
									case 6:
										tipo = "Mandato Judicial";
										break;
									case 7:
										tipo = "Outros motivos de afastamento";
										break;
									}
							%>
							<td><%=tipo%></td>
							<td><%=h.getTipo() %></td>
								<td><%=h.getDataInicio()%></td>
								<td><%=h.getDataFim() %></td>
							</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
			<div class="section">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h2 class="text-muted">Registro de Medidas Disciplinares</h2>
						</div>
					</div>
				</div>
			</div>
			<%for(MedidaDisciplinar m : mD){ %>
			<div class="section">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="well">
								<h2 class="text-center"><%=m.getTipo() %></h2>
								<p><b>Nome:</b> <%=m.getColaborador().getNome() %></p>
								<p><b>Matr�cula:</b> <%=m.getColaborador().getMatricula() %></p>								
								<p><b>Data:</b><%=m.getData()%></p>
								<p class="text-center">
								<b>Motivo:</b> <%=m.getMotivo() %></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%} %>
		</div>
	</div>
	<jsp:include page="rodape.jsp"></jsp:include>
</body>

</html>






















<%@page contentType="text/html" import="java.util.*, java.text.*"
	pageEncoding="ISO-8859-1"%>
<%@page import="br.com.karirirh.entidades.Colaborador"%>
<%@page import="br.com.karirirh.entidades.Cargo"%>
<%@page import="br.com.karirirh.entidades.Empresa"%>
<%@page import="br.com.karirirh.entidades.Telefone"%>
<%@page import="br.com.karirirh.entidades.Dependente"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

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
<title>Alterar Colaborador</title>

<meta name="AlexArraes">

<script type="text/javascript" src="modal/js/jquery.min.js"></script>
<script type="text/javascript" src="modal/js/bootstrap.min.js"></script>
<script type="text/javascript" src="modal/js/scripts.js"></script>

<link href="css/font-awesome.min2.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" media="screen"
	href="DataTable/media/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="DataTable/media/css/jquery.dataTables_themeroller.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="DataTable/media/css/jquery.dataTables.min.css">
<script type="text/javascript" src="DataTable/media/js/jquery.js"></script>
<script type="text/javascript"
	src="DataTable/media/js/jquery.dataTables.js"></script>
<script type="text/javascript"
	src="DataTable/media/js/jquery.dataTables.min.js"></script>
<script src="jQueryUI/jquery-ui.js"></script>
<link rel="stylesheet" href="resources/demos/style.css">
<link rel="stylesheet" href="jQueryUI/jquery-ui.css">
<script src="jQueryUI/jquery.maskedinput.js" type="text/javascript"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
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
	$(document)
			.ready(
					function() {
						var max_fields = 5; //maximum input boxes allowed
						var wrapper = $(".input_fields_wrap"); //Fields wrapper
						var add_button = $(".add_field_button"); //Add button ID

						var x = 1; //initlal text box count
						$(add_button)
								.click(
										function(e) { //on add input button click
											e.preventDefault();
											if (x < max_fields) { //max input box allowed
												x++; //text box increment
												$(wrapper)
														.append(
																'<div><input type="text"  class="form-control input-md" name="nome'+x+'"/><a href="#" class="remove_field">Remove</a></div>'); //add input box
											}
										});

						$(wrapper).on("click", ".remove_field", function(e) { //user click on remove text
							e.preventDefault();
							$(this).parent('div').remove();
							x--;
						})
						//$(':hidden').val(x);
					});
</script>
<script>
	$(function() {
		$("#dataNasc").datepicker({
			changeMonth : true,
			changeYear : true
		});
	});

	$(function() {
		$("#accordion").accordion({
			heightStyle : "content"
		});
	});

	jQuery(function($) {
		//$("#cpf").mask("999.999.999-99");
		$("#cep").mask("99999-99");
		//$("#pis").mask("999.9999.999-9");
		//$("#celular").mask("(99)9999-9999");
		//$("#fixo").mask("(99)9999-9999");
	});

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

	<form class="form-horizontal" name="nome"
		action="ColaboradorControlador" method="get">

		<fieldset>

			<!-- Form Name -->
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<legend draggable="true">
								<h1>Colaborador</h1>
								Alterar
							</legend>
							
							<%
								Colaborador col = (Colaborador) request.getAttribute("col");
								List<Telefone> tel = (List<Telefone>) request.getAttribute("tel");
								List<Dependente> dep = (List<Dependente>) request
										.getAttribute("dep");
							%>
							<div id="accordion">
								<h3>1 - Dados Pessoais</h3>
								<div>
									<!-- Começa -->
									<div class="col-md-5">
										<!--nome-->
										<div class="form-group">
											<input type="hidden" name="acao" value="alterar"> <label
												for="nome">Nome Completo:*</label>
											<div>
												<input id="nomeCompleto" name="nomeCompleto" type="text"
													placeholder="Ex.: João da Silva" value="<%=col.getNome()%>"
													class="form-control input-md" required="required"
													oninvalid="this.setCustomValidity('[1 - Dados Pessoais] Campo NOME não preenchido.')"
													maxlength="50">
											</div>
										</div>
										<!--nome-->

										<!-- Estado Civil -->
										<div class="form-group">
											<label for="estCivil">Estado Cívil:*</label>
											<div>
												<select id="estCivil" name="estCivil" class="form-control">

													<option
														<%=(col.getEstadoCivil().equals("Solteiro(a)")) ? "selected"
					: ""%>
														value="Solteiro(a)">Solteiro(a)</option>
													<option
														<%=(col.getEstadoCivil().equals("Casado(a)")) ? "selected"
					: ""%>
														value="Casado(a)">Casado(a)</option>
													<option
														<%=(col.getEstadoCivil().equals("Viuvo(a)")) ? "selected"
					: ""%>
														value="Viuvo(a)">Viuvo(a)</option>
													<option
														<%=(col.getEstadoCivil().equals("Divorciado(a)")) ? "selected"
					: ""%>
														value="Divorciado(a)">Divorciado(a)</option>


												</select>
											</div>
										</div>
										<!-- Estado Civil -->
										<!-- Data Nascim -->
										<div class="form-group">
											<label for="nome">Data de Nascimento:*</label>
											<div>
												<input type="text" id="dataNasc" name="dataNasc" readonly="readonly"
													class="form-control input-md" placeholder="Ex.: 00/00/0000"
													value="<%=new SimpleDateFormat("dd 'de' MMMM 'de' yyyy").format(col.getDataNascimento()) %>" maxlength="10">
											</div>
										</div>
										<!-- Data Nascim -->
										<!-- Sexo -->
										<label for="sexo">Sexo:*</label>
										<div>
											<div class="radio">
												<label for="sexo-0"> <input type="radio" name="sexo"
													id="sexo-0" value="masculino"
													<%=(col.getSexo().equals("masculino") ? "checked=checked" : "")%>>Masculino
												</label>
											</div>
											<div class="radio">
												<label for="sexo-1"> <input type="radio" name="sexo"
													id="sexo-1" value="feminino"
													<%=(col.getSexo().equals("feminino") ? "checked=checked"  : "")%>>
													Feminino
												</label>
											</div>
										</div>
										<!-- SEXO -->

									</div>

									<div class="col-md-2"></div>
									<div class="col-md-5">
										<div class="form-group"></div>



										<!--rg-->
										<div class="form-group">
											<label for="nome">RG:*</label>
											<div>
												<input id="rg" name="rg" type="text"
													placeholder="Ex.: 00000000000"
													class="form-control input-md" value="<%=col.getRg()%>"
													oninvalid="this.setCustomValidity('[1 - Dados Pessoais] Campo RG não preenchido.')"
													required="required" maxlength="25">
											</div>
										</div>
										<!--cpf-->
										<div class="form-group">
											<label for="nome">CPF:*</label>
											<div>
												<input id="cpf" name="cpf" type="text"
													placeholder="Ex.: 000.000.000-00" value="<%=col.getCpf()%>"
													maxlength="14" readonly="readonly"
													oninvalid="this.setCustomValidity('[1 - Dados Pessoais] Campo CPF não preenchido.')"
													class="form-control input-md" required="required">
											</div>
										</div>
										<!--cpf-->
										
										
										<!--Dependentes-->
										<div class="form-group">
											<label for="nome">DEPENDENTES:</label>
											<div>
										<%
											for (Dependente d : dep) {
										%>
												<input type="text" readonly="readonly"
													value="<%=d.getNomeDependete()%>"
													class="form-control input-md" >
													<%
											}
										%>
											</div>
										</div>
										<!--Dependentes-->
										
										<!-- DEPENDENTES -->
										
										<div class="input_fields_wrap">
										<label for="nome">Adicionar mais Dependentes:</label>
										 <input
												class="add_field_button" type=image src="img/mais.png"></input>
											<div>
												<input class="form-control input-md" type="text"
													name="nome1">
											</div>
										</div>
										<!-- DEPENDENTES -->


									</div>

								</div>
								<!-- Termina -->

								<h3>2 - Dados Residências</h3>
								<div>
									<!--Dados Residencias  -->

									<div class="container">
										<div class="row">
											<div class="col-md-12">
												<div class="row">
													<!-- Linha 1 -->

													<div class="col-md-4">

														<!--rua-->
														<div class="form-group">
															<label for="nome">Endereço:*</label>
															<div>
																<input id="rua" name="rua" type="text"
																	placeholder="Ex.: Rua Santa Terezinha"
																	value="<%=col.getRua()%>"
																	oninvalid="this.setCustomValidity('[2 - Dados Residênciais] Campo RUA não preenchido.')"
																	class="form-control input-md" required="required">
															</div>
														</div>
														<!--rua-->

													</div>
													<div class="col-md-1"></div>
													<div class="col-md-1">

														<!--numero-->
														<div class="form-group">
															<label for="nome">Número:</label>
															<div>
																<input id="numero" name="numero" type="text"
																	maxlength="7" value="<%=col.getNumero()%>"
																	placeholder="Ex.: 9999" class="form-control input-md">
															</div>
														</div>
														<!--numero-->

													</div>
													<div class="col-md-1"></div>
													<div class="col-md-4">

														<!--Complemento-->
														<div class="form-group">
															<label for="nome">Complemento:</label>
															<div>

																<input id="complemento" name="complemento" type="text"
																	value="<%=col.getComplemento()%>"
																	placeholder="Ex.: Casa" class="form-control input-md"
																	maxlength="25">
															</div>
														</div>
														<!--Complemento-->

													</div>
													<div class="col-md-1"></div>


												</div>
												<!-- Linha 1 -->
												<div class="row">
													<!-- Linha 2 -->

													<div class="col-md-4">

														<!--bairro-->
														<div class="form-group">
															<label for="nome">Bairro:*</label>
															<div>
																<input id="bairro" name="bairro" type="text"
																	maxlength="25" value="<%=col.getBairro()%>"
																	placeholder="Ex.: Centro"
																	oninvalid="this.setCustomValidity('[2 - Dados Residênciais] Campo BAIRRO não preenchido.')"
																	class="form-control input-md" required="required">
															</div>
														</div>
														<!--bairro-->

													</div>
													<div class="col-md-1"></div>
													<div class="col-md-3">

														<!--cidade-->
														<div class="form-group">
															<label for="nome">Cidade:*</label>
															<div>
																<input id="cidade" name="cidade" type="text"
																	maxlength="40" value="<%=col.getCidade()%>"
																	placeholder="Ex.: Brejo Santo"
																	oninvalid="this.setCustomValidity('[2 - Dados Residênciais] Campo CIDADE não preenchido.')"
																	class="form-control input-md" required="required">
															</div>
														</div>
														<!--cidade-->
													</div>
													<div class="col-md-1">
														<!--UF-->
														<div class="form-group">
															<label for="selectbasic">UF:*</label>
															<div>
																<select id="estado" name="estado" class="form-control">
																	<option value="<%=col.getUf()%>" selected><%=col.getUf()%>
																	</option>
																	<option value="AC">AC</option>
																	<option value="AL">AL</option>
																	<option value="AP">AP</option>
																	<option value="AM">AM</option>
																	<option value="BA">BA</option>
																	<option value="CE">CE</option>
																	<option value="DF">DF</option>
																	<option value="ES">ES</option>
																	<option value="GO">GO</option>
																	<option value="MA">MA</option>
																	<option value="MT">MT</option>
																	<option value="MS">MS</option>
																	<option value="MG">MG</option>
																	<option value="PA">PA</option>
																	<option value="PB">PB</option>
																	<option value="PR">PR</option>
																	<option value="PE">PE</option>
																	<option value="PI">PI</option>
																	<option value="RJ">RJ</option>
																	<option value="RN">RN</option>
																	<option value="RS">RS</option>
																	<option value="RO">RO</option>
																	<option value="RR">RR</option>
																	<option value="SC">SC</option>
																	<option value="SP">SP</option>
																	<option value="SE">SE</option>
																	<option value="TO">TO</option>
																</select>
															</div>
														</div>
														<!--UF-->


													</div>
													<div class="col-md-1"></div>
													<div class="col-md-1">

														<!--cep-->
														<div class="form-group">
															<label for="nome">CEP:*</label>
															<div>
																<input id="cep" name="cep" type="text" maxlength="9"
																	placeholder="Ex.: 00000-000" value="<%=col.getCep()%>"
																	class="form-control input-md"
																	oninvalid="this.setCustomValidity('[2 - Dados Residênciais] Campo CEP não preenchido.')"
																	required="required">
															</div>
														</div>
														<!--cep-->

													</div>
													<div class="col-md-1"></div>

												</div>
												<!-- Linha 2 -->
												<div class="row">
													<!-- Linha 3 -->

													<div class="col-md-4">
														<!--Email-->
														<div class="form-group">
															<label for="nome">Email:*</label>
															<div>
																<input id="email" name="email" type="email"
																	placeholder="Ex.: exemplo@kariri.com"
																	value="<%=col.getEmail()%>"
																	oninvalid="this.setCustomValidity('[2 - Dados Residênciais] E-MAIL incorreto!')"
																	class="form-control input-md" required="required">
															</div>
														</div>
														<!--Email-->

													</div>
													<div class="col-md-1"></div>
													<div class="col-md-2">

														<!--Celular 1-->
														<div class="form-group">
															<label for="nome">Celular:*</label>
															<div>
																<%
																	for (Telefone t : tel) {
																		if (t.getTipo().equals("Celular")) {
																%>
																<input id="celular" name="celular" type="text"
																	maxlength="14" value="<%=t.getFone()%>"
																	oninvalid="this.setCustomValidity('[2 - Dados Residênciais] Campo CELULAR não preenchido.')"
																	class="form-control input-md" required="required">
																<%
																	}
																	}
																%>
															</div>
														</div>
														<!--Celular 1-->

													</div>
													<div class="col-md-1"></div>
													<div class="col-md-2">

														<!--Fixo -->
														<div class="form-group">
															<label for="nome">Fixo: </label>
															<div>
																<%
																	for (Telefone t : tel) {
																		if (t.getTipo().equals("Fixo")) {
																%>

																<input id="fixo" name="fixo" type="text" maxlength="14"
																	value="<%=t.getFone()%>"
																	placeholder="Ex.: (00)0000-0000"
																	class="form-control input-md">
																<%
																	}
																	}
																%>
															</div>
														</div>
														<!--Fixo -->

													</div>
													<div class="col-md-2"></div>

												</div>
												<!-- Linha 3 -->


											</div>
										</div>
									</div>

								</div>
								<!-- Dados Residenciais -->
								<h3>3 - Dados Profissionais</h3>
								<div>
									<!-- Dados Proficionais -->
									<div class="row">
										<!-- Linha 01 -->

										<div class="col-md-3">
											<!--Matrícula-->

											<div class="form-group">
												<label for="nome">Matrícula: </label>
												<div>
													<input id="matricula" name="matricula" type="text"
														value="<%=col.getMatricula()%>" readonly="readonly"
														class="form-control input-md"
														placeholder="Gerada Automaticamente">
												</div>
											</div>

											<!--Matrícula-->
										</div>
										<div class="col-md-1"></div>
										<div class="col-md-3">
											<!-- Data Admin -->
											<div class="form-group">
												<label for="nome">Data de Admissão:</label>
												<div>
													<input type="text" id="dataAdmin" name="dataAdmin"
														readonly="readonly"
								value="<%=new SimpleDateFormat("dd 'de' MMMM 'de' yyyy").format(col.getDataAdm()) %>"
														class="form-control input-md">
												</div>
											</div>
											<!-- Data Admin -->

										</div>
										<div class="col-md-5"></div>
									</div>
									<!-- Linha 01 -->
									<div class="row">
										<!-- Linha 02 -->
										<div class="col-md-3">
											<!--CTPS-->
											<div class="form-group">
												<label for="nome">CTPS:*</label>
												<div>
													<input id="ctps" name="ctps" type="text" maxlength="8"
														value="<%=col.getCtps()%>" placeholder="Ex.: 0000000"
														oninvalid="this.setCustomValidity('[3 - Dados Profissionais] Campo CTPS não preenchido.')"
														class="form-control input-md" required="required">
												</div>
											</div>
											<!--CTPS-->

										</div>
										<div class="col-md-1"></div>
										<div class="col-md-3">
											<!--PIS-->
											<div class="form-group">
												<label for="nome">PIS:*</label>
												<div>
													<input id="pis" name="pis" type="text" maxlength="14"
														oninvalid="this.setCustomValidity('[3 - Dados Profissionais] Campo PIS não preenchido.')"
														class="form-control input-md" required="required"
														value="<%=col.getPis()%>">
												</div>
											</div>
											<!--PIS-->

										</div>
										<div class="col-md-1"></div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="nome">Tipo de Contrato:*</label>
												<div>
													<select id="tipoContrato" name="tipoContrato"
														class="form-control">
														<option value="<%=col.getContrato()%>"><%=col.getContrato()%></option>
														<option value="Contrato por tempo Determinado">Contrato
															por tempo Determinado</option>
														<option value="Contrato por tempo Indeterminado">Contrato
															por tempo Indeterminado</option>
													</select>
												</div>
											</div>
											<!-- Tipo de Contrato -->
										</div>
										<div class="col-md-1"></div>

									</div>
									<!-- Linha 02 -->
									<div class="row">
										<!-- Linha 03 -->
										<div class="col-md-5">
											<!-- Cargo -->
											<div>
												<div class="form-group">
													<label for="nome">Cargo:*</label>
													<div>

														<select id="cargo" name="cargo" class="form-control">
															<option value="<%=col.getCargo().getId()%>">
																<%=col.getCargo().getNome() + " R$ " + col.getCargo().getSalario()%></option>
															<%
																List<Cargo> listaResultado = (List<Cargo>) request
																		.getAttribute("cargo");
																for (Cargo c : listaResultado) {
															%>

															<option value="<%=c.getId()%>"><%=c.getNome() + " R$ " + c.getSalario()%></option>

															<%
																}
															%>
														</select>
													</div>
												</div>
											</div>
											<!-- Cargo -->
										</div>
										<div class="col-md-1"></div>
										<div class="col-md-2">

											<!--Salario-->
											<div class="form-group">
												<label for="nome">Salário:*</label>
												<div>
													<input id="salario" name="salario" type="text"
														maxlength="10" value="<%=col.getSalarioAtual()%>"
														onKeyPress="return(ConsisteNumerico('10',this,event))"
														oninvalid="this.setCustomValidity('[3 - Dados Profissionais] Campo SALÁRIO não preenchido.')"
														class="form-control input-md" required="required">
												</div>
											</div>
											<!--Salario-->

										</div>
										<div class="col-md-4"></div>
									</div>
									<!-- Linha 03 -->

								</div>
								<!-- Dados Proficionais -->

								<h3>4 - Informações Extras</h3>
								<div>
									<div class="row">
										<!-- Linha 01 -->
										<div class="col-md-4">
											<!-- Escolaridade -->
											<div class="form-group">
												<label for="nome">Escolaridade:*</label>
												<div>
													<select id="escolaridade" name="escolaridade"
														class="form-control">
														<option value="<%=col.getEscolaridade()%>"><%=col.getEscolaridade()%></option>
														<option value="Fundamental - Incompleto">Fundamental
															- Incompleto</option>
														<option value="Fundamental - Completo">Fundamental
															- Completo</option>
														<option value="Médio - Incompleto">Médio -
															Incompleto</option>
														<option value="Médio - Completo">Médio - Completo</option>
														<option value="Superior - Incompleto">Superior -
															Incompleto</option>
														<option value="Superior - Completo">Superior -
															Completo</option>
														<option value="Pós-graduação (Lato senso) - Incompleto">Pós-graduação
															(Lato senso) - Incompleto</option>
														<option value="Pós-graduação (Lato senso) - Completo">Pós-graduação
															(Lato senso) - Completo</option>
														<option
															value="Pós-graduação (Stricto sensu, nível mestrado) - Incompleto">Pós-graduação
															(Stricto sensu, nível mestrado) - Incompleto</option>
														<option
															value="Pós-graduação (Stricto sensu, nível mestrado) - Completo">Pós-graduação
															(Stricto sensu, nível mestrado) - Completo</option>
														<option
															value="Pós-graduação (Stricto sensu, nível doutor) - Incompleto">Pós-graduação
															(Stricto sensu, nível doutor) - Incompleto</option>
														<option
															value="Pós-graduação (Stricto sensu, nível doutor) - Completo">Pós-graduação
															(Stricto sensu, nível doutor) - Completo</option>
													</select>
												</div>
											</div>
											<!-- escolaridade -->

										</div>
										<div class="col-md-8"></div>
										<!-- Linha 01 -->

										<div class="row">
											<!-- Linha 02 -->
											<div class="col-md-6">
												<!--Salario-->
												<div class="form-group">
													<label for="nome">Área de Atuação:</label>
													<div>
														<input id="curso" name="curso" type="text"
															value="<%=col.getCurso()%>" maxlength="50"
															class="form-control input-md">
													</div>
												</div>
												<!--Salario-->

											</div>
											<div class="col-md-6"></div>
										</div>
										<!-- Linha 02 -->
										<br /> <br /> <input type=image src="img/salvar.png"
											id="botao" value="enviar" alt="Salvar Cadastro!" />

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>


<%@page contentType="text/html" import="java.util.*, java.text.*" pageEncoding="ISO-8859-1"%>
<%@page import="br.com.karirirh.entidades.Usuario"%>
<%@page import="br.com.karirirh.entidades.Empresa"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<!doctype html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>Cadastro Colaborador</title>

<meta name="AlexArraes">

<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="jQueryUI/external/jquery/jquery.js"></script>
<script src="jQueryUI/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="jQueryUI/jquery-ui.css">
<script type="text/javascript">
$(document).ready(function() {
    var max_fields      = 5; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
   
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            $(wrapper).append('<div><input type="text"  class="form-control input-md" name="mytext[]"/><a href="#" class="remove_field">Remove</a></div>'); //add input box
        }
    });
   
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
    $(':hidden').val(x);
});

</script>
<script>
$(function() {
	$( "#dataNasc" ).datepicker({
	changeMonth: true,
	changeYear: true
	});
	});
	
	$(function() {
		$("#accordion").accordion({
			heightStyle : "content"
		});
	});
</script>
<!-- Data
<%
       int dia = Integer.parseInt((new SimpleDateFormat("dd")).format(new Date()));
        int mes = Integer.parseInt((new SimpleDateFormat("M")).format(new Date()));
        int ano = Integer.parseInt((new SimpleDateFormat("yyyy")).format(new Date()));
        %>
-->


</head>
<body>
	<form class="form-horizontal" name="nome" action="ColaboradorControlador" method="get">
		<input type="hidden" name="acao" value="salvar">
		<fieldset>
			<!-- Form Name -->
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<legend draggable="true">
								<h1>Cadastro Colaborador</h1>
								Dados Pessoais
							</legend>
							<div id="accordion">
								<h3>1 - Dados Pessoais</h3>
								<div>
									<!-- Começa -->
									<div class="col-md-5">
										<!--nome-->
										<div class="form-group">
											<label for="nome">Nome Completo:*</label>
											<div>
												<input id="nomeCompleto" name="nomeCompleto" type="text"
													placeholder="Ex.: João da Silva"
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
                                                <option value="1">Solteiro(a)</option>
                                                <option value="2">Casado(a)</option>
                                                <option value="3">Viuvo(a)</option>
                                                <option value="4">Divorciado(a)</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- Estado Civil -->
                                    <!-- Data Nascim -->
									<div class="form-group">
										<label for="nome">Data de Nascimento:*</label>
										<div>
											<input  type="text" id="dataNasc" class="form-control input-md" 
											placeholder="Ex.: 00/00/0000" maxlength="10">
										</div>
									</div>
									<!-- Data Nascim -->
									<!-- Sexo -->
                                        <label for="sexo">Sexo:*</label>
                                        <div>
                                            <div class="radio">
                                                <label for="sexo-0">
                                                    <input type="radio" name="sexo" id="sexo-0" value="masculino" checked="checked">Masculino</label>
                                            </div>
                                            <div class="radio">
                                                <label for="sexo-1">
                                                    <input type="radio" name="sexo" id="sexo-1" value="feminino">Feminino</label>
                                            </div>
                                        </div>
                                        <!-- SEXO -->

</div>

                                <div class="col-md-2"></div>
<div class="col-md-5">
<div class="form-group">
									
                                    </div>
                                    
                                    
                                    	
									<!--rg-->
									<div class="form-group">
										<label for="nome">RG:*</label>
										<div>
											<input id="rg" name="rg" type="text"
												placeholder="Ex.: 00000000000" class="form-control input-md"
												oninvalid="this.setCustomValidity('[1 - Dados Pessoais] Campo RG não preenchido.')"
												required="required" maxlength="25">
										</div>
									</div>              
                                     <!--cpf-->
                                    <div class="form-group">
                                        <label for="nome">CPF:*</label>
                                        <div>
                                            <input id="cpf" name="cpf" type="text" placeholder="Ex.: 000.000.000-00"
                                            oninvalid="this.setCustomValidity('[1 - Dados Pessoais] Campo CPF não preenchido.')"
                                            class="form-control input-md" required="required">
                                        </div>
                                    </div>
                                    <!--cpf-->
<!-- DEPENDENTES -->

		<div class="input_fields_wrap">
				<label for="nome">Dependentes:</label>
			<input  class="add_field_button" type=image src="img/mais.png"></input>
			<div>
				<input class="form-control input-md" type="text" name="nome1">
			</div>
		</div>
<!-- DEPENDENTES -->


</div>

								</div>
								<!-- Termina -->

								<h3>2 - Dados Residências</h3>
								<div><!--Dados Residencias  -->
								
				<div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row"><!-- Linha 1 -->
                            
                            <div class="col-md-4">
                            
                             <!--rua-->
                                    <div class="form-group">
                                        <label for="nome">Endereço:*</label>
                                        <div>
                                            <input id="rua" name="rua" type="text" placeholder="Ex.: Rua Santa Terezinha"
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
                                            <input id="numero" name="numero" type="text" placeholder="Ex.: 9999" class="form-control input-md">
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
                                            <input id="complemento" name="complemento" type="text" placeholder="Ex.: Casa"
                                            class="form-control input-md">
                                        </div>
                                    </div>
                             <!--Complemento-->
                            
                            </div>
                            <div class="col-md-1"></div>
                            
                            
                            </div><!-- Linha 1 -->
                            <div class="row"><!-- Linha 2 -->
                            
                            <div class="col-md-4">
                            
                            <!--bairro-->
                                    <div class="form-group">
                                        <label for="nome">Bairro:*</label>
                                        <div>
                                            <input id="bairro" name="bairro" type="text" placeholder="Ex.: Centro"
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
                                            <input id="cidade" name="cidade" type="text" placeholder="Ex.: Brejo Santo"
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
                                            <input id="cep" name="cep" type="text" placeholder="Ex.: 00000-000" class="form-control input-md"
                                            oninvalid="this.setCustomValidity('[2 - Dados Residênciais] Campo CEP não preenchido.')"
                                            required="required">
                                        </div>
                                    </div>
                            <!--cep-->
                            
                            </div>
                            <div class="col-md-1"></div>
                            
                            </div><!-- Linha 2 -->
                            <div class="row"><!-- Linha 3 -->
                            
                             <div class="col-md-4">
                             <!--Email-->
                                    <div class="form-group">
                                        <label for="nome">Email:*</label>
                                        <div>
                                            <input id="email" name="email" type="email" placeholder="Ex.: exemplo@kariri.com"
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
                                            <input id="celular" name="celular" type="text" placeholder="Ex.: (00)0000-0000"
                                            oninvalid="this.setCustomValidity('[2 - Dados Residênciais] Campo CELULAR não preenchido.')"
                                            class="form-control input-md" required="required">
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
                                            <input id="fixo" name="fixo" type="text" placeholder="Ex.: (00)0000-0000"
                                            class="form-control input-md">
                                        </div>
                                    </div>
                            <!--Fixo -->
                             
                             </div>
                             <div class="col-md-2"></div>
                            
                            </div><!-- Linha 3 -->
                            
                            
                        </div>
                    </div>
                 </div>
									
									
									
								
			
									
									
									
								</div><!-- Dados Residenciais -->
								<h3>3 - Dados Profissionais</h3>
								<div><!-- Dados Proficionais -->
								<div class="row"><!-- Linha 01 -->
								
							<div class="col-md-3">
								 <!--Matrícula-->
                				<div class="input_fields_wrap">
										<div class="form-group">
                                        <label for="nome">Matrícula: </label>
                                        <div>
                                            <input id="matricula" name="matricula" type="text" readonly="readonly"
                                            class="form-control input-md" placeholder="Gerada Automaticamente" >
                                        </div>
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
											<input  type="text" id="dataAdmin"  readonly="readonly" class="form-control input-md" 
											value="<%=dia+"/"+mes+"/"+ano%>">
										</div>
									</div>
									<!-- Data Admin -->
								
								</div>
								<div class="col-md-5"></div>
								</div><!-- Linha 01 -->
								<div class="row"><!-- Linha 02 -->
								<div class="col-md-3">
								<!--CTPS-->
                <div class="form-group">
                  <label for="nome">CTPS:*</label>
                  <div>
                    <input id="ctps" name="ctps" type="text" placeholder="Ex.: 00000000000"
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
                    <input id="pis" name="pis" type="text" placeholder="Ex.: 00000000000"
                     oninvalid="this.setCustomValidity('[3 - Dados Profissionais] Campo PIS não preenchido.')"
                    class="form-control input-md" required="required">
                  </div>
                </div>
                <!--PIS-->
								
								</div>
								<div class="col-md-1"></div>
								<div class="col-md-3">
								  <div class="form-group">
                <label for="nome">Tipo de Contrato:*</label>
                <div>
                  <select id="tipoContrato" name="tipoContrato" class="form-control">
                    <option value="Contrato por tempo Determinado">Contrato por tempo Determinado</option>
                    <option value="Contrato por tempo Indeterminado">Contrato por tempo Indeterminado</option>
                  </select>
                </div>
              </div>
              <!-- Tipo de Contrato -->
								</div>
								<div class="col-md-1"></div>
								
								</div><!-- Linha 02 -->
								<div class="row"><!-- Linha 03 -->
								<div class="col-md-5">
								<!-- Cargo -->
								  <div class="form-group">
                <label for="nome">Cargo:*</label>
                <div>
                  <select id="cargo" name="cargo" class="form-control">
                    <option value="Contrato por tempo Determinado">Contrato por tempo Determinado</option>
                    <option value="Contrato por tempo Indeterminado">Contrato por tempo Indeterminado</option>
                  </select>
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
                    <input id="salario" name="salario" type="text" value=""
                     oninvalid="this.setCustomValidity('[3 - Dados Profissionais] Campo SALÁRIO não preenchido.')"
                    class="form-control input-md" required="required">
                  </div>
                </div>
                <!--Salario-->
								
								</div>
								<div class="col-md-4"></div>
								</div><!-- Linha 03 -->
								
								</div><!-- Dados Proficionais -->
								
								<h3>4 - Informações Extras</h3><div>
								<div class="row"><!-- Linha 01 -->
								<div class="col-md-4">
								<!-- Escolaridade -->
								  <div class="form-group">
                <label for="nome">Escolaridade:*</label>
                <div>
                  <select id="escolaridade" name="escolaridade" class="form-control">
                    <option value="Contrato por tempo Determinado">Contrato por tempo Determinado</option>
                    <option value="Contrato por tempo Indeterminado">Contrato por tempo Indeterminado</option>
                  </select>
                </div>
              </div>
              <!-- escolaridade -->
								
								</div>
								<div class="col-md-8"></div><!-- Linha 01 -->
								
								<div class="row"><!-- Linha 02 -->
								<div class="col-md-6">
									<!--Salario-->
                <div class="form-group">
                  <label for="nome">Curso:</label>
                  <div>
                    <input id="curso" name="curso" type="text" 
                    class="form-control input-md" >
                  </div>
                </div>
                <!--Salario-->
								
								</div>
								<div class="col-md-6"></div>
								</div><!-- Linha 02 -->
								<br/>
								<br/>
								
								<input type=image src="img/salvar.png" id="botao" value="enviar"  alt="Salvar Cadastro!" />

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


<html lang="en">
<head>
<meta charset="utf-8">
<title>jQuery UI Dialog - Modal confirmation</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
function TestaCPF() {
	confirm("sdas")
	alert("CPF INVALIDO");
    var strCPF = document.teste.cpf.value;
	var Soma;
    var Resto;
    boolean isValido;
    Soma = 0;
	if (strCPF == "00000000000") isValido = false;
    
	for (i=1; i<=9; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (11 - i);
	Resto = (Soma * 10) % 11;
	
    if ((Resto == 10) || (Resto == 11))  Resto = 0;
    if (Resto != parseInt(strCPF.substring(9, 10)) ) isValido = false;
	
	Soma = 0;
    for (i = 1; i <= 10; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (12 - i);
    Resto = (Soma * 10) % 11;
	
    if ((Resto == 10) || (Resto == 11))  Resto = 0;
    if (Resto != parseInt(strCPF.substring(10, 11) ) ) isValido= false;
    isValido = true;
    
    
    if (false){
    	document.teste.submit() ;
    }else{ 	
    alert("CPF INVALIDO");
    teste.senha.focus();
    }
}

</script>
</head>
<body>
<div>
<fieldset>
<form action="#" name="teste" method="get" >
<label>Peso:</label>


<input type="text" id="cpf" name="cpf" size="15" maxlength="15" ><br/>

<label>Altura:</label>
<input type="text" name="altura" size="15" maxlength="10"><br/>

<button  type="button" for="teste" onClick="TestaCPF()"> ENVIAR</button> 
</form>
</fieldset>
</div>

</body>
</html>
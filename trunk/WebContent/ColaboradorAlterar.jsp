<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="jQueryUI/external/jquery/jquery.js"></script>
<script src="jQueryUI/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="jQueryUI/jquery-ui.css">
<script type="text/javascript">
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
																'<div><input type="text"  class="form-control input-md" name="nome'+x+'"/><a href="#" class="remove_field">Remover</a></div>'); //add input box
											}
										});

						$(wrapper).on("click", ".remove_field", function(e) { //user click on remove text
							e.preventDefault();
							$(this).parent('div').remove();
							x--;
						})

					});
</script>

</head>
<body>


	<form action="Teste" method="get" id="form-produtos">
		<input type="hidden" name="acao" value="salvar">

		<div class="input_fields_wrap">
		
				<label for="nome">Dependentes:</label>
			<input  class="add_field_button" type=image src="img/mais.png"></input>
			<div>
				<input class="form-control input-md" type="text" name="nome1">
			</div>
		</div>
		<input id="button-submit" type="submit" value="Enviar" class="button" />










	</form>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>jQuery UI Dialog - Animation</title>
<link rel="stylesheet" href="jQueryUI/jquery-ui.css">
<script src="jQueryUI/external/jquery/jquery.js"></script>
<script src="jQueryUI/jquery-ui.js"></script>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<script>
	$(function() {
		$("#dialog").dialog({
			autoOpen : false,
			show : {
				effect : "blind",
				duration : 1000
			},
			hide : {
				effect : "explode",
				duration : 1000
			}
		});

		$("#opener").click(function() {
			$("#dialog").dialog("open");
		});
	});
</script>
</head>
<body>

	<div id="dialog" title="Basic dialog">
		<p>This is an animated dialog which is useful for displaying
			information. The dialog window can be moved, resized and closed with
			the 'x' icon.</p>
	</div>
<input id="opener"  type=image src="img/interrogacao2.png" > 
	<button id="opener"  >Open Dialog</button>


</body>
</html>
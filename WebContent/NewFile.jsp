<html lang="en">
<head>
<meta charset="utf-8">
<title>jQuery UI Dialog - Modal confirmation</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
$(function() {
$( "#dialog-confirm" ).dialog({
resizable: false,
height:140,
modal: true,
buttons: {
"Cadastrar": function() {
$( this ).dialog( "close" );
},
Cancel: function() {
$( this ).dialog( "close" );
}
}
});
});
</script>
</head>
<body>
<div id="dialog-confirm" title="Cadastrar Férias">
<p>
<label>Peso:</label>
<input type="text" name="peso" size="15" maxlength="15"><br/>

<label>Altura:</label>
<input type="text" name="altura" size="15" maxlength="10"><br/>

<input type="submit" value="Calcular">
</p>
<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 10px 40px 0;"></span>These items will be permanently deleted and cannot be recovered. Are you sure?</p>
</div>
	<p>
		Sed vel diam id libero <a href="http://example.com">rutrum
			convallis</a>. Donec aliquet leo vel magna. Phasellus rhoncus faucibus
		ante. Etiam bibendum, enim faucibus aliquet rhoncus, arcu felis
		ultricies neque, sit amet auctor elit eros a lectus.
	</p>
</body>
</html>
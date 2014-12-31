<div class="usuarios form">
	
	<h1>El aula virtual aún no está habilitada.</h1>
	<p>Si gusta, puede cambiar su contraseña en Mi Cuenta.</p>
	
</div>
<?php
	$_SESSION['no_matriculado'] = 1;
	echo $this->element('acciones');
?>
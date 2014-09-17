<div class="usuarios form">
	
	<h1>Aún no se encuentra matriculad@.</h1>
	<p>Se habilitará cuando inicie el seminario.</p>
	
</div>
<?php
	$_SESSION['no_matriculado'] = 1;
	echo $this->element('acciones');
?>
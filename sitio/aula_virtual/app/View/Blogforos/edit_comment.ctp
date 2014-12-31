<div class="blogforo form">
	<?php
		echo '<fieldset>';
			echo '<legend>Comentario</legend>';
			echo $this->Form->create("Comentario");
			echo $this->Form->input("id");
			echo $this->Form->input('blogforo_id', array('type' => 'hidden', 'default' => ''));//setear con la sesión
			echo $this->Form->input('usuario_id', array('type' => 'hidden', 'default' => ''));//setear con la sesión
			echo $this->Form->input("comentario", array('label' => FALSE));
			echo '<br>';
			echo $this->Form->end('Guardar');
		echo '</fieldset>';
	?>
</div>
<?php
	$this->set('blog', 1); 
	echo $this->element('acciones');
?>

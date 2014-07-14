<?php
	echo $this->Form->create("Comentario");
	echo $this->Form->input("id");
	echo $this->Form->input('blogforo_id', array('type' => 'hidden', 'default' => ''));//setear con la sesión
	echo $this->Form->input('usuario_id', array('type' => 'hidden', 'default' => ''));//setear con la sesión
	echo $this->Form->input("comentario");
	echo $this->Form->end('Guardar');
?>
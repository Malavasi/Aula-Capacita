<?php
	echo $this->Form->create("Comentario");
	echo $this->Form->input('blogforo_id', array('type' => 'hidden', 'default' => $blogforoID));
	echo $this->Form->input("comentario");
	echo $this->Js->submit("Enviar Comentario",
							array('url' => array( 'action' => 'AjaxAddComment'),
							'before' => $this->Js->get('#sending')->effect('fadeIn'),
							'success' => $this->Js->get('#sending')->effect('fadeOut'),
							'update' => '#comments'));
	echo $this->Form->end();
	
	echo $this->Js->submit('Cancelar',
							array('url' => array( 'action' => 'AjaxCancel' ),
							'update' => '#formAddComment'));
	
    echo $this->Js->writeBuffer();
?>
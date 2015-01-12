<?php
	echo '<div id="formAddComment"><fieldset>';
		echo '<legend>Comentario</legend>';
		echo $this->Form->create("Comentario");
		echo $this->Form->input('blogforo_id', array('type' => 'hidden', 'default' => $blogforoID));
		echo $this->Form->input("comentario", array('label' => false));
		echo '<br>';
		echo $this->Js->submit("Enviar Comentario",
								array('url' => array( 'action' => 'AjaxAddComment'),
								'before' => $this->Js->get('#comm')->effect('fadeIn'),
								'success' => $this->Js->get('#formAddComment')->effect('fadeOut'),
								'update' => '#comments'));
		echo $this->Form->end();
		
		echo $this->Js->submit('Cancelar',
								array('url' => array( 'action' => 'AjaxCancel' ),
								'update' => '#formAddComment',
								'success' => $this->Js->get('#comm')->effect('fadeIn')));
	echo '</fieldset></div>';
	
    echo $this->Js->writeBuffer();
?>
<center>
	<div id="content-box">
		<?php
	        echo $this->Form->create('Sesiones', array('action' => 'login'));
	        echo $this->Form->input('nick', array('label' => __('Usuario', true), 'default' => ''));
	        
	        echo $this->Form->input(
			    'contrasena',
			    array(
			        'type' => 'password',
			        'label' => 'Contraseña'
			    )
			);
			echo $this->Form->end('Login');  
		?>
	</div>
</center>
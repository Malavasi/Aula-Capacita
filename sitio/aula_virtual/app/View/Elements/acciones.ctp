<?php 
if(isset($_SESSION['tipo_usuario'])) {
?>
<div class="actions">
	<h3><?php echo __('Acciones'); ?></h3>
	<ul>
        <?php
        
		if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] <= 3) {
        	echo '<li>'.$this->Html->link(__('Inicio'), array('controller' => 'Cursos','action' => 'index')).'</li>';
        }
        
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1 ) {
            echo '<li>'.$this->Html->link(__('Crear Usuario'), array('controller' => 'usuarios','action' => 'add')).'</li>';    
        }
		
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1 ) {
            echo '<li>'.$this->Html->link(__('Consultar Usuarios'), array('controller' => 'usuarios','action' => 'index')).'</li>';    
        }
        
		if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1 ) {
            echo '<li>'.$this->Html->link(__('Crear Curso'), array('controller' => 'cursos', 'action' => 'add')).'</li>';    
        }
		
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] <= 1 ) {
            echo '<li>'.$this->Html->link(__('Consultar Cursos'), array('controller' => 'cursos', 'action' => 'index')).'</li>';    
        }
		
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1 ) {
            echo '<li>'.$this->Html->link(__('Extensiones'), array('controller' => 'TiposArchivos','action' => 'index')).'</li>';    
        }
		
		if(isset($enAula) and isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] >= 2 and !isset($_SESSION['no_matriculado'])) {
			echo '<li>', $this->Html->link('Descargas', array('controller' => 'Materiales', 'action' => 'index', $_SESSION['id_curso'])), '</li>'; 
			echo '<li>', $this->Html->link('Comentarios', array('controller' => 'Blogforos', 'action' => 'index', $_SESSION['id_curso'])), '</li>';
		}
		
		if(isset($_SESSION['id_usuario']) ) {
            echo '<li>'.$this->Html->link(__('Mi Cuenta'), array('controller' => 'Usuarios','action' => 'edit', $_SESSION['id_usuario'])).'</li>'; 
        }
		
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] <= 3 and isset($archivos) ) {
            echo '<br>'.__('Archivos');
			if($_SESSION['blacklisted']) {
				echo "<strong style=\"color: red\">", 'Bloqueado.', "</strong> <br>";
			} else {
				echo '<li>'. $this->Html->link(__('Subir Material'), array('controller' => 'Materiales','action' => 'add')).'</li>';
			}
			
			if ($_SESSION['tipo_usuario'] == 1) {
				echo '<li>'.$this->Html->link(__('Consultar Materiales'), array('controller' => 'Materiales','action' => 'index')).'</li>';
			}
			 
        }
		
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] <= 3 and isset($blog) ) {
            echo '<br>'.__('Comentarios');
			
			if($_SESSION['blacklisted']) {
				echo "<strong style=\"color: red\">", 'Bloqueado.', "</strong> <br>";
			} else {
				echo '<li>'.$this->Html->link(__('Crear Tema'), array('controller' => 'Blogforos','action' => 'add')).'</li>';
			}
        }
	
		?>
	</ul>
</div>
<?php 
}
?>
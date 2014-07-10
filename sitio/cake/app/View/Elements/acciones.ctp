<div class="actions">
	<h3><?php echo __('Acciones'); ?></h3>
	<ul>
        <?php
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 )
        {
            echo '<li>'.$this->Html->link(__('Crear Usuario'), array('controller' => 'usuarios','action' => 'add')).'</li>';    
        }
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=2 )
        {
            echo '<li>'.$this->Html->link(__('Consultar Usuarios'), array('controller' => 'usuarios','action' => 'index')).'</li>';    
        }
        
		if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']==1 )
        {
            echo '<li>'.$this->Html->link(__('Crear Curso'), array('controller' => 'cursos', 'action' => 'add')).'</li>';    
        }
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=2 )
        {
            echo '<li>'.$this->Html->link(__('Consultar Cursos'), array('controller' => 'cursos', 'action' => 'index')).'</li>';    
        }
		?>
	</ul>
</div>
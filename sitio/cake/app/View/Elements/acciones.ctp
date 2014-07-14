<?php 
if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=2)
{
?>
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

        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=2 )
        {
            echo '<li>'. $this->Html->link(__('Subir Archivo'), array('controller' => 'MyFiles','action' => 'add')).'</li>';    
        }
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=3 )
        {
            echo '<li>'.$this->Html->link(__('Consultar Archivos'), array('controller' => 'MyFiles','action' => 'index')).'</li>'; 
               
        }

        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=2 and isset($editaArchivo) )
        {
            echo '<br>'.__('Archivos');
            echo '<li>'.$this->Form->postLink(__('Eliminar'), array('action' => 'delete', $this->Form->value('MyFile.id')), array(), __('¿Desea eliminar el archivo %s?', $this->Form->value('MyFile.name'))).'</li>'; 
        }
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=2 and isset($verArchivo) )
        {
            echo '<br>'.__('Archivos');
            echo '<li>'.$this->Form->postLink(__('Eliminar'), array('action' => 'delete', $myFile['MyFile']['id']), array(), __('¿Desea eliminar el archivo %s?', $this->Form->value('MyFile.name'))).'</li>'; 
            echo '<li>'.$this->Html->link(__('Editar Archivo'), array('action' => 'edit', $myFile['MyFile']['id'])).'</li>'; 
        }
        if(isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario']<=2 and isset($blog) )
        {
            echo '<br>'.__('Blog');
            echo '<li>'.$this->Html->link(__('Agregar Tema'), array('action' => 'add')).'</li>'; 
        }
		?>
	</ul>
</div>
<?php 
}
?>
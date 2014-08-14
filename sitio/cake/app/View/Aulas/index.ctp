<div class="aulas index">
	<h2><?php echo __($curso['Curso']['nombre']); ?></h2>
	<p><h3>
    <?php 
        echo $this->Html->link('Material de descargas', array('controller' => 'MyFiles', 'action' => 'index', $curso['Curso']['id'])); 
    ?></h3>
    <p><h3>
    <?php 
        echo $this->Html->link('Comentarios y preguntas', array('controller' => 'BlogForos', 'action' => 'index', $curso['Curso']['id'])); 
    ?></h3>
    <p><h3>
    <?php 
    	if (isset($_SESSION['tipo_usuario']) and $_SESSION['tipo_usuario'] == 1) {
       		echo $this->Html->link('Lista de estudiantes', array('controller' => 'Usuarios', 'action' => 'usuariosDelCurso', $curso['Curso']['id'])); 
		}
    ?></h3>
</div>

<?php echo $this->element('acciones'); ?>
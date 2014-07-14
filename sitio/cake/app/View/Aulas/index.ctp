<div class="aulas index">
	<h2><?php echo __($_SESSION['nick_curso']); ?></h2>
	<p><h3>
    <?php 
        echo $this->Html->link('Material de descargas', array('controller' => 'MyFiles', 'action' => 'index', $_SESSION['id_curso'])); 
    ?></h3>
    <p><h3>
    <?php 
        echo $this->Html->link('Comentarios y preguntas', array('controller' => 'BlogForos', 'action' => 'index', $_SESSION['id_curso'])); 
    ?></h3>
</div>

<?php echo $this->element('acciones'); ?>
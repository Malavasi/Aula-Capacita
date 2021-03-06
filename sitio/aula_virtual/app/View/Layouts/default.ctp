<?php
/**
 *
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.View.Layouts
 * @since         CakePHP(tm) v 0.10.0.1076
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */

$cakeDescription = __d('cake_dev', 'Capacita Virtual');
?>
<!DOCTYPE html>
<html>
<head>
	<?php echo $this->Html->charset(); ?>
	<title>
		<?php echo $cakeDescription ?>:
		<?php echo $title_for_layout; ?>
	</title>
	<?php
		echo $this->Html->meta('icon');

		echo $this->Html->css('style');

		echo $this->fetch('meta');
		echo $this->fetch('css');
		echo $this->fetch('script');
		echo $this->Html->script('jquery');
	?>
</head>
<body class="style-1">
<div class="wrap-header"></div>
<header id="header" class="clearfix">
		
</header>


<section class="container sbr clearfix">
		<?php echo $this->Html->image('capacita_logo.gif', array('class' => 'center')); ?>
		<!-- - - - - - - - - - - Slider - - - - - - - - - - - - - -->	

<div id="slider" class="flexslider clearfix">

	<div id="container">
		<div id="header">
			<?php echo $this->element('usuario'); ?>
		</div>
		
        <div id="content">
           	<?php echo $this->Session->flash(); ?>

			<?php echo $this->fetch('content'); ?>
		</div>
    </div>
</div>
	<footer id="footer">
		
		<ul class="copyright">
			
			<li>Derechos Reservados &copy; 2014</li>
			<li><a href="http://www.capacita.co">Capacita</a></li>
		  <li>San Jos&eacute;, Costa Rica</li>
			
		</ul><!--/ .copyright-->
	
	</footer>
</section>	


	<?php //echo $this->element('sql_dump'); ?>
</body>
</html>

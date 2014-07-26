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

$cakeDescription = __d('cake_dev', 'Aula Virtual Capacita');
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
	
		<a href="index.html" id="logo"><img src="http://www.capacita.co/images/capacita_logo.gif" alt="" width="300" height="77" title="Capacita" /></a>
		<!-- - - - - - - - - - - Slider - - - - - - - - - - - - - -->	

<div id="slider" class="flexslider clearfix">

	<div id="container">
		<div id="header">
			<h3><?php echo $this->Html->link($cakeDescription, 'http://google.com'); ?></h3>
		</div>
		
        <div id="content">
       <?php echo $this->element('usuario'); ?>
			<?php echo $this->Session->flash(); ?>

			<?php echo $this->fetch('content'); ?>
		</div>
		<div id="footer">
			<?php echo $this->Html->link(
					$this->Html->image('capacita.gif', array('alt' => $cakeDescription, 'border' => '0')),
					'http://www.capacita.co',
					array('target' => '_blank', 'escape' => false, 'id' => 'cake-powered')
				);
			?>
			<p>
				<?php echo'Aula Virtual'; ?>
			</p>
		</div>
	</div>
    <section>
</div>

	<?php //echo $this->element('sql_dump'); ?>
</body>
</html>

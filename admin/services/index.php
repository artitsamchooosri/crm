<?php
$view = isset($_GET['view']) ? $_GET['view'] : 'index';
switch ($view) {
	case 'section':
		include(base_app.'admin/services/section.php');
		break;
	case 'category_problem':
		include(base_app.'admin/services/category_problem.php');
		break;
	default:
		include(base_app.'admin/services/category_problem.php');
		break;
}
?>
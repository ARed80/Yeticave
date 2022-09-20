<?php
$is_auth = rand(0, 1);

$user_name = 'Александр';

date_default_timezone_set('Europe/Moscow');

require_once('helpers.php');
require_once('functions.php');
require_once('data.php');

$page_content = include_template('main.php', [
    'lots' => $lots,
    'categories' => $categories
]);

$layout_content = include_template('layout.php', [
    'content' => $page_content,
    'categories' => $categories,
    'user_name' => $user_name,
    'is_auth' => $is_auth,
    'title' => 'Yeticave - Главная страница'
]);

print($layout_content);

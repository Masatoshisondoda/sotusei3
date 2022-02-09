<?php

//JSからのデータを受け取る
$data = file_get_contents('php://input');
$data = json_decode($data);
// JSON形式データをPHPの配列型に変換
$data = json_decode($savedData);

var_dump($savedData);
?>

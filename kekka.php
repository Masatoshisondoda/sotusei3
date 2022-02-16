<?php

if (
    !isset($_POST['field1']) || $_POST['field1'] == '' ||
    !isset($_POST['field2']) || $_POST['field2'] == '' ||
    !isset($_POST['field3']) || $_POST['field3'] == '' ||
    !isset($_POST['field4']) || $_POST['field4'] == '' 
) {
    exit('ParamError');
}

$field1=$_POST['field1'];
$field2 = $_POST['field2'];
$field3 = $_POST['field3'];
$field4 = $_POST['field4'];
$quiz1 = $_POST['quiz1'];
$quiz2 = $_POST['quiz2'];
$quiz3 = $_POST['quiz3'];

$quizresult=$quiz1+$quiz2+$quiz3;

if($quizresult<4){
    $identify="積極型";
}
else{
    $identify="保守型";
}



$dbn = 'mysql:dbname=studyself;charset=utf8mb4;port=3306;host=localhost';
$user = 'root';
$pwd = '';

try {
    $pdo = new PDO($dbn, $user, $pwd);
} catch (PDOException $e) {
    echo json_encode(["db error" => "{$e->getMessage()}"]);
    exit();
}



$sql = 'INSERT INTO studyselflogin (id, field1, field2,field3,field4,identify) VALUES (NULL,:field1, :field2,:field3,:field4,:identify)';

$stmt = $pdo->prepare($sql);

$stmt->bindValue(':field1', $todo, PDO::PARAM_STR);
$stmt->bindValue(':field2', $field2, PDO::PARAM_STR);
$stmt->bindValue(':field3', $field3, PDO::PARAM_STR);
$stmt->bindValue(':field4', $field4, PDO::PARAM_STR);
$stmt->bindValue(':identify', $identify, PDO::PARAM_STR);

try {
    $status = $stmt->execute();
} catch (PDOException $e) {
    echo json_encode(["sql error" => "{$e->getMessage()}"]);
    exit();
}

header('Location:home.php');
exit();

?>
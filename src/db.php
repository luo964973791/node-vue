<?php
// 数据库信息
$host = 'localhost'; // 数据库主机名
$dbname = 'your_database'; // 数据库名
$username = 'your_username'; // 数据库用户名
$password = 'your_password'; // 数据库密码

try {
    // 连接数据库
    $db = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // 设置字符集，如果需要的话
    $db->exec("SET NAMES utf8");
} catch (PDOException $e) {
    // 连接失败时的处理
    echo '连接数据库失败: ' . $e->getMessage();
    die();
}
?>

<?php
$servername = "localhost"; // 여러분의 MySQL 서버 주소
$username = "root"; // 여러분의 MySQL 사용자 이름
$password = "apmsetup"; // 여러분의 MySQL 비밀번호
$dbname = "bigrolling"; // 여러분의 데이터베이스 이름

// 데이터베이스 연결 함수
function connectToDatabase() {
    global $servername, $username, $password, $dbname;
    
    $conn = mysqli_connect($servername, $username, $password, $dbname);

    // 연결 확인
    if (!$conn) {
        die("데이터베이스 연결 실패: " . mysqli_connect_error());
    }

    return $conn;
}
?>

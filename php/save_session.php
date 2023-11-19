<?php
session_start();

if (isset($_GET['id'])) {
    $productId = $_GET['id'];

    // 세션에 선택된 제품 ID 저장
    $_SESSION['selectedProductID'] = $productId;

    echo '성공';
} else {
    echo '저장 실패';
}
?>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 재고 조회 및 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        h1 {
            color: #333;
        }

        table {
            width: 50%;
            border-collapse: collapse;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
        }

        th {
            background-color: #f2f2f2;
        }

        form {
            margin: 10px;
        }

        input[type="number"] {
            width: 60px;
            padding: 5px; /* 수정된 부분: 크기 조절 */
            box-sizing: border-box; /* 수정된 부분: 크기에 패딩 포함 */
        }

        input[type="submit"] {
            padding: 5px 10px; /* 수정된 부분: 크기 조절 */
            cursor: pointer;
        }
    </style>
</head>
<body>

    <h1>상품 재고 조회 및 수정</h1>

    <?php
    // 데이터베이스 연결 설정
    $servername = "localhost";
    $username = "root";
    $password = "apmsetup";
    $dbname = "bigrolling";

    $conn = new mysqli($servername, $username, $password, $dbname);

    // 연결 확인
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // 상품 재고 조회 쿼리
    $select_query = "SELECT i.product_id, p.product_name, i.stock_quantity FROM INVENTORY i
                    JOIN PRODUCT p ON i.product_id = p.product_id";
    $result = $conn->query($select_query);

    // 결과 출력
    if ($result->num_rows > 0) {
        echo "<table>";
        echo "<tr><th>상품번호</th><th>상품이름</th><th>재고량</th><th>재고 수정</th></tr>";
        while($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>".$row["product_id"]."</td>";
            echo "<td>".$row["product_name"]."</td>";
            echo "<td>".$row["stock_quantity"]."</td>";
            echo "<td><form method='post' action='".$_SERVER["PHP_SELF"]."'>";
            echo "<input type='hidden' name='product_id' value='".$row["product_id"]."'>";
            echo "<input type='number' name='new_stock_quantity' min='0' required>";
            echo "<input type='submit' value='수정'>";
            echo "</form></td>";
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "<p>상품 재고가 없습니다.</p>";
    }

    // 재고량 수정 처리
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $product_id = $_POST["product_id"];
        $new_stock_quantity = $_POST["new_stock_quantity"];

        // 재고량 업데이트 쿼리
        $update_sql = "UPDATE INVENTORY SET stock_quantity = $new_stock_quantity WHERE product_id = $product_id";

        if ($conn->query($update_sql) === TRUE) {
            echo "<p>재고량이 성공적으로 업데이트되었습니다.</p>";
        } else {
            echo "<p>재고량 업데이트에 실패했습니다: " . $conn->error . "</p>";
        } 
    }

    // 연결 종료
    $conn->close();
    ?>

</body>
</html>
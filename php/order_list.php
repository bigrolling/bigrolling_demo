<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 조회 및 월별 주문 랭킹</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin-top: 20;
        }

        table {
            border-collapse: collapse;
            width: 50%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        form {
            margin-bottom: 20px;
            margin-top: 20px;
        }

        .space {
            height: 20px;
        }
    </style>
</head>
<body>
    <?php
    include(__DIR__ . '/db_connection.php');

    // 월별 주문 랭킹 쿼리
    $ranking_query = "SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total_price) AS total_payment
                      FROM ORDERS
                      GROUP BY month
                      ORDER BY total_payment DESC";
    $ranking_result = mysqli_query(connectToDatabase(), $ranking_query);

    // 월별 주문 랭킹 출력
    if ($ranking_result->num_rows > 0) {
        echo "<h1>주문 조회 및 월별 주문 랭킹</h1>";
        echo "<h3>주문 조회 및 월별 주문 랭킹</h3>";
        echo "<table>";
        echo "<tr><th>월</th><th>총 결제 금액</th></tr>";
        while ($row = $ranking_result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . $row["month"] . "</td>";
            echo "<td>" . $row["total_payment"] . "</td>";
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "<p>주문 기록이 없습니다.</p>";
    }
    ?>

    <div class="space"></div>

    <!-- 월 선택 폼 -->
    <form method="post">
        <label for="month">조회할 월 선택: </label>
        <input type="month" name="month" required>
        <input type="submit" value="조회">
    </form>

    <?php
    // POST로 전달된 달 정보
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $selected_month = $_POST["month"];

        // 주문 조회 쿼리
        $order_query = "SELECT * FROM ORDERS WHERE DATE_FORMAT(order_date, '%Y-%m') = '$selected_month'";
        $order_result = mysqli_query(connectToDatabase(), $order_query);

        // 결과 출력
        if ($order_result->num_rows > 0) {
            echo "<h3>{$selected_month} 주문 정보</h3>";
            echo "<table>";
            echo "<tr><th>주문 ID</th><th>사용자 ID</th><th>주문 날짜</th><th>총 가격</th></tr>";
            while ($row = $order_result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["order_id"] . "</td>";
                echo "<td>" . $row["user_id"] . "</td>";
                echo "<td>" . $row["order_date"] . "</td>";
                echo "<td>" . $row["total_price"] . "</td>";
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "<p>선택한 달에 주문이 없습니다.</p>";
        }
    }

    // 연결 종료
    mysqli_close(connectToDatabase());
    ?>
</body>
</html>
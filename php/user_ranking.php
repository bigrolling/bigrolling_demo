<?php
include(__DIR__ . '/db_connection.php');

// 사용자별 누적 결제 금액을 계산하는 쿼리
$query = "SELECT
            USER.user_id,
            USER.username,
            SUM(PAYMENT.payment_amount) AS total_amount
          FROM
            USER
          LEFT JOIN ORDERS ON USER.user_id = ORDERS.user_id
          LEFT JOIN PAYMENT ON ORDERS.order_id = PAYMENT.order_id
          GROUP BY
            USER.user_id
          ORDER BY
            total_amount DESC;";

// 쿼리 실행
$result = mysqli_query(connectToDatabase(), $query);

if (!$result) {
    die('쿼리 실행 실패: ' . mysqli_error(connectToDatabase()));
}
?>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 랭킹</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .main{
			font-family: Arial, sans-serif;
			background-color: #f2f2f2;
			margin: 0;
			padding: 0;
			display: flex;
			justify-content: center;
			/* align-items: center; */
			height: 100vh;
		}
    </style>
</head>
<body>
<?php
include('index.php');
?>
    <div class="main">
	<div style="width: 700px;">
    <h1>사용자 랭킹</h1>

    <?php if ($result) : // 결과가 있는 경우에만 아래의 내용을 표시 ?>
        <table>
            <tr>
                <th>순위</th>
                <th>사용자 이름</th>
                <th>누적 결제 금액</th>
            </tr>
            <?php
            $rank = 1;
            while ($row = mysqli_fetch_assoc($result)) :
            ?>
                <tr>
                    <td><?php echo $rank++; ?></td>
                    <td><?php echo isset($row['username']) ? $row['username'] : '사용자 정보 없음'; ?></td>
                    <td><?php echo isset($row['total_amount']) ? $row['total_amount'] : '누적 금액 정보 없음'; ?></td>
                </tr>
            <?php endwhile; ?>
        </table>
        <?php // 데이터베이스 연결 닫기 ?>
        <?php mysqli_close(connectToDatabase()); ?>
    <?php endif; ?>
    </div>
	</div>
</body>
</html>


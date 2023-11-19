<?php
include(__DIR__ . '/db_connection.php');

$productName = '';
$productID = null; // 상품 ID 초기화
$inventoryResult = null; // 재고 결과 초기화
$orderResult = null; // 주문 결과 초기화
$reviewResult = null; // 리뷰 결과 초기화

// 제품 이름 입력받기
if (isset($_POST['submit'])) {
    $productName = isset($_POST['product_name']) ? $_POST['product_name'] : '';

    // 검색어가 비어있지 않은 경우에만 쿼리 수행
    if (!empty($productName)) {
        // 상품 ID를 찾기 위한 쿼리
        $productIDQuery = "SELECT product_id FROM PRODUCT WHERE product_name LIKE '%$productName%';";
        $productIDResult = mysqli_query(connectToDatabase(), $productIDQuery);
        
        // 에러 처리 및 상품 ID 가져오기
        if ($productIDResult) {
            $productIDRow = mysqli_fetch_assoc($productIDResult);
            $productID = isset($productIDRow['product_id']) ? $productIDRow['product_id'] : null;

            // 재고 정보를 가져오기 위한 쿼리
            $inventoryQuery = "SELECT stock_quantity FROM INVENTORY WHERE product_id = $productID;";
            $inventoryResult = mysqli_query(connectToDatabase(), $inventoryQuery);

            // 주문 정보를 가져오기 위한 쿼리 (USER 테이블과 JOIN 추가)
            $orderQuery = "SELECT
                            ORDERS.order_id,
                            ORDERS.order_date,
                            ORDERS.total_price,
                            USER.username
                          FROM
                            ORDER_ITEMS
                          LEFT JOIN ORDERS ON ORDER_ITEMS.order_id = ORDERS.order_id
                          LEFT JOIN USER ON ORDERS.user_id = USER.user_id
                          WHERE
                            ORDER_ITEMS.product_id = $productID;";
            $orderResult = mysqli_query(connectToDatabase(), $orderQuery);

            // 리뷰 정보를 가져오기 위한 쿼리
            $reviewQuery = "SELECT
                              rating,
                              review_text,
                              review_date
                            FROM
                              REVIEW
                            WHERE
                              product_id = $productID;";
            $reviewResult = mysqli_query(connectToDatabase(), $reviewQuery);
        } else {
            die('쿼리 실행 실패: ' . mysqli_error(connectToDatabase()));
        }
    }
}
?>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제품 정보 검색 결과</title>
    <style>
        table {
            margin: 0 auto; 
            border-collapse: collapse;
            width: 80%; 
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        #product_name {
            width: 80%;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        form {
            margin: 20px 0; 
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
		a:hover {
			text-decoration: underline;
		}
        a {
			color: black;
			text-decoration: none;
		}
    </style>
</head>
<body>
<?php
include('index.php');
?>
<div class="main">
	<div style="width: 700px;">
    <h1>제품 정보 검색</h1>

    <!-- 사용자로부터 제품 이름을 입력받는 폼 -->
    <form method="post" action="">
        <label for="product_name">상품 이름:</label>
        <input type="text" id="product_name" name="product_name" value="<?php echo $productName; ?>">
        <input type="submit" name="submit" value="검색">
    </form>

    <?php if (mysqli_num_rows($inventoryResult) > 0 ||  mysqli_num_rows($orderResult) > 0 ||   mysqli_num_rows($reviewResult) > 0) : // 결과가 있는 경우에만 아래의 내용을 표시 ?>
        <h2>'<?php echo $productName; ?>'에 대한 제품 정보</h2>

        <?php if ($inventoryResult) : // 재고 결과가 있는 경우에만 아래의 내용을 표시 ?>
            <h3>재고 정보</h3>
            <table>
                <tr>
                    <th>재고 수량</th>
                </tr>
                <?php while ($inventoryRow = mysqli_fetch_assoc($inventoryResult)) : ?>
                    <tr>
                        <td><?php echo isset($inventoryRow['stock_quantity']) ? $inventoryRow['stock_quantity'] : '재고 정보 없음'; ?></td>
                    </tr>
                    <!-- 기타 정보 출력 -->
                <?php endwhile; ?>
            </table>
        <?php endif; ?>

        <?php if ($orderResult) : // 주문 결과가 있는 경우에만 아래의 내용을 표시 ?>
            <h3>주문 리스트</h3>
            <table>
                <tr>
                    <th>사용자 이름</th>
                    <th>주문 일자</th>
                    <th>주문 가격</th>
                </tr>
                <?php while ($orderRow = mysqli_fetch_assoc($orderResult)) : ?>
                    <tr>
                        <td><?php echo isset($orderRow['username']) ? $orderRow['username'] : '사용자 정보 없음'; ?></td>
                        <td><?php echo isset($orderRow['order_date']) ? $orderRow['order_date'] : '주문 정보 없음'; ?></td>
                        <td><?php echo isset($orderRow['total_price']) ? $orderRow['total_price'] : '주문 정보 없음'; ?></td>
                        <!-- 기타 정보 출력 -->
                    </tr>
                <?php endwhile; ?>
            </table>
        <?php endif; ?>

        <?php if ($reviewResult ) : // 리뷰 결과가 있는 경우에만 아래의 내용을 표시 ?>
            <h3>리뷰 리스트</h3>
            <table>
                <tr>
                    <th>평점</th>
                    <th>리뷰</th>
                    <th>리뷰 날짜</th>
                </tr>
                <?php while ($reviewRow = mysqli_fetch_assoc($reviewResult)) : ?>
                    <tr>
                        <td><?php echo isset($reviewRow['rating']) ? $reviewRow['rating'] : '리뷰 정보 없음'; ?></td>
                        <td><?php echo isset($reviewRow['review_text']) ? $reviewRow['review_text'] : '리뷰 정보 없음'; ?></td>
                        <td><?php echo isset($reviewRow['review_date']) ? $reviewRow['review_date'] : '리뷰 정보 없음'; ?></td>
                        <!-- 기타 정보 출력 -->
                    </tr>
                <?php endwhile; ?>
            </table>
        <?php endif; ?>

        <?php // 데이터베이스 연결 닫기 ?>
        <?php mysqli_close(connectToDatabase()); ?>
    <?php endif; ?>
    
    </div>
</div>
</body>
</html>

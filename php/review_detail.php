<?php
include(__DIR__ . '/db_connection.php');

if (isset($_GET['id'])) {
	$reviewId = $_GET['id'];

	// 리뷰 정보 가져오기
	$reviewQuery = "SELECT * FROM REVIEW WHERE review_id = $reviewId";
	$reviewResult = mysqli_query(connectToDatabase(), $reviewQuery);
	$review = mysqli_fetch_assoc($reviewResult);

	// 제품 정보 가져오기
	$productQuery = "SELECT * FROM PRODUCT WHERE product_id = " . $review['product_id'];
	$productResult = mysqli_query(connectToDatabase(), $productQuery);
	$product = mysqli_fetch_assoc($productResult);

	// 사용자 정보 가져오기
	$userQuery = "SELECT username FROM USER WHERE user_id = " . $review['user_id'];
	$userResult = mysqli_query(connectToDatabase(), $userQuery);
	$user = mysqli_fetch_assoc($userResult);
} else {
	// 리뷰 ID가 제공되지 않은 경우 처리
	echo "유효하지 않은 리뷰 ID";
	exit;
}

// 리뷰 삭제 기능
if (isset($_POST['delete_review'])) {
	$deleteQuery = "DELETE FROM REVIEW WHERE review_id = $reviewId";
	mysqli_query(connectToDatabase(), $deleteQuery);

	// 리뷰를 삭제한 후 알림창 표시 및 원래 상품 상세페이지로 리디렉션
	echo '<script>alert("삭제되었습니다.");</script>';
	echo '<script>window.location.href = "product_detail.php?id=' . $product['product_id'] . '";</script>';
	exit;
}
?>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>리뷰 상세 페이지</title>
	<style>
		a {
			color: black;
			text-decoration: none;
    	}
		a:hover {
			text-decoration: underline;
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
<div  style="width: 700px;">
	<h1>리뷰 상세 페이지</h1>

	<p><strong>제품명:</strong> <?php echo $product['product_name']; ?></p>
	<p><strong>사용자 ID:</strong> <?php echo $user['username']; ?></p>
	<p><strong>평점:</strong> <?php echo $review['rating']; ?></p>
	<p><strong>리뷰 내용:</strong> <?php echo $review['review_text']; ?></p>
	<p><strong>리뷰 날짜:</strong> <?php echo $review['review_date']; ?></p>

	<form method="post" action="">
		<button type="submit" name="delete_review">삭제</button>
	</form>

	<?php mysqli_close(connectToDatabase()); ?>
</div>
</div>
</body>
</html>

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
		body {
			font-family: 'Arial', sans-serif;
			margin: 0;
			padding: 0;
			background-color: #f4f4f4;
			color: #333;
		}

		header {
			background-color: #333;
			color: white;
			text-align: center;
			padding: 1em;
		}

		h1 {
			color: #333;
		}

		.container {
			width: 80%;
			margin: 0 auto;
			background-color: #fff;
			padding: 20px;
			border-radius: 5px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			margin-top: 20px;
		}

		p {
			margin: 10px 0;
		}

		button {
			background-color: #dc3545;
			color: white;
			border: none;
			padding: 10px 15px;
			cursor: pointer;
			border-radius: 5px;
		}

		button:hover {
			background-color: #c82333;
		}
	</style>
</head>
<body>
	<header>
		<h1>리뷰 상세 페이지</h1>
	</header>

	<div class="container">
		<h2>리뷰 상세</h2>
		<p><strong>제품명 | </strong> <?php echo $product['product_name']; ?></p>
		<p><strong>작성자 | </strong> <?php echo $user['username']; ?></p>
		<p><strong>평점 | </strong> <?php echo $review['rating']; ?></p>
		<p><strong>내용 | </strong> <?php echo $review['review_text']; ?></p>
		<p><strong>날짜 | </strong> <?php echo $review['review_date']; ?></p>

		<form method="post" action="">
			<button type="submit" name="delete_review">삭제</button>
		</form>
	</div>

	<?php mysqli_close(connectToDatabase()); ?>
</body>
</html>


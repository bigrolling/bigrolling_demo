<?php
include(__DIR__ . '/db_connection.php');

if (isset($_GET['id'])) {
	$productId = $_GET['id'];

	// 제품 정보 가져오기
	$productQuery = "SELECT PRODUCT.*, CATEGORY.category_name, BRAND.brand_name FROM PRODUCT LEFT JOIN 	CATEGORY ON PRODUCT.category_id = CATEGORY.category_id LEFT JOIN BRAND ON PRODUCT.brand_id = BRAND.brand_id WHERE PRODUCT.product_id = $productId";
	$productResult = mysqli_query(connectToDatabase(), $productQuery);
	$product = mysqli_fetch_assoc($productResult);

	// 제품 리뷰 가져오기
	$reviewQuery = "SELECT * FROM REVIEW WHERE product_id = $productId";
	$reviewResult = mysqli_query(connectToDatabase(), $reviewQuery);

	// 리뷰 평균 평점 계산
	$averageRatingQuery = "SELECT AVG(rating) AS avg_rating FROM REVIEW WHERE product_id = $productId";
	$averageRatingResult = mysqli_query(connectToDatabase(), $averageRatingQuery);
	$averageRating = mysqli_fetch_assoc($averageRatingResult)['avg_rating'];
} else {
	// 제품 ID가 제공되지 않은 경우 처리
	echo "유효하지 않은 제품 ID";
	exit;
}
?>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><?php echo $product['product_name']; ?> 상세 페이지</title>
	<style>
		
		li {
			margin-bottom: 20px;
			padding: 15px;
			border: 1px solid #ddd;
			border-radius: 8px;
			background-color: #fff;
			margin-right: 10px;
			margin-left: 10px;
		}		
		ul {
			list-style-type: none; 
			padding: 0;
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

		.back-button {
			background-color: #ddd; 
			padding: 10px 20px;
			border: none;
			border-radius: 8px;
			margin-right: auto; 
			margin-bottom: 10px;
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
	<h1><?php echo $product['product_name']; ?> 상세 페이지</h1>

	<p><strong>가격:</strong> <?php echo $product['price']; ?></p>
	<p><strong>설명:</strong> <?php echo $product['description']; ?></p>
	<p><strong>카테고리:</strong> <?php echo $product['category_name']; ?></p>
	<p><strong>브랜드:</strong> <?php echo $product['brand_name']; ?></p>
	<br><br>
	<h2>리뷰</h2>
	<?php if ($reviewResult->num_rows > 0) : ?>
		<p><strong>평균 평점:</strong> <?php echo number_format($averageRating, 2); ?></p>
		<ul>
			<?php while ($review = mysqli_fetch_assoc($reviewResult)) : ?>
				<li>
					<p><strong>평점:</strong> <?php echo $review['rating']; ?></p>
					<p>
						<a href="review_detail.php?id=<?php echo $review['review_id']; ?>">
							<?php echo $review['review_text']; ?>
						</a>
					</p>
					<p><strong>리뷰 날짜:</strong> <?php echo $review['review_date']; ?></p>
				</li>
			<?php endwhile; ?>
		</ul>
	<?php else : ?>
		<p>이 제품에 대한 리뷰가 없습니다.</p>
	<?php endif; ?>

	<a class="back-button" href="product_list.php">목록</a>


	<?php mysqli_close(connectToDatabase()); ?>
	</div>
	</div>
</body>
</html>


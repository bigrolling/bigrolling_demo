<?php
include(__DIR__ . '/db_connection.php');
session_start();

$productId = $_SESSION['selectedProductID'];

if ($productId) {

	// 제품 정보 가져오기
	$productQuery = "SELECT PRODUCT.*, CATEGORY.category_name, BRAND.brand_name FROM PRODUCT LEFT JOIN 	CATEGORY ON PRODUCT.category_id = CATEGORY.category_id LEFT JOIN BRAND ON PRODUCT.brand_id = BRAND.brand_id WHERE PRODUCT.product_id = $productId";
	$productResult = mysqli_query(connectToDatabase(), $productQuery);
	$product = mysqli_fetch_assoc($productResult);

	// 제품 리뷰 가져오기
	$reviewQuery = "SELECT * FROM REVIEW WHERE product_id = $productId";
	$reviewResult = mysqli_query(connectToDatabase(), $reviewQuery);

	// 리뷰 평균 평점 계산
	$averageRatingQuery = "SELECT AVG(rating) AS avg_rating FROM REVIEW WHERE product_id = $productId GROUP BY product_id";
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

		h2 {
			color: #333;
		}

		ul {
			list-style: none;
			padding: 0;
		}

		li {
			border: 1px solid #ddd;
			margin: 10px 0;
			padding: 10px;
			border-radius: 5px;
		}

		a {
			color: #666;
			text-decoration: none;
		}

		a:hover {
			text-decoration: underline;
		}

		a:active {
			color: #333;
		}

		.rating-star {
			font-size: x-large;
		}

		button {
			background-color: #6c757d;
			color: white;
			border: none;
			padding: 10px 15px;
			cursor: pointer;
			border-radius: 5px;
		}

		button:hover {
			background-color: #5a6268;
		}

		.back-link {
			display: inline-block;
			margin-top: 20px;
		}

		body {
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
		}

		header {
			background-color: #333;
			padding: 15px;
			text-align: center;
			color: #fff;
		}

		nav {
			display: flex;
			justify-content: center;
			background-color: #555;
			padding: 10px;
		}

		nav a {
			color: white;
			text-decoration: none;
			padding: 10px 20px;
			margin: 0 10px;
			border-radius: 5px;
			background-color: #777;
			transition: background-color 0.3s;
		}

		nav a:hover {
			background-color: #999;
			text-decoration: none;
		}
		header a {
			color: white;
			text-decoration: none;
		}

		header a:hover {
			text-decoration: none;
		}
	</style>
</head>
<body>
	<header>
		<a href="product_list.php"><h1>Big Rolling</h1></a>
	</header>

	<nav>
		<a href="product_list.php">product list</a>
		<a href="search_product.php">search product</a>
		<a href="create_product.php">create product</a>
		<a href="inventory_management.php">inventory</a>
		<a href="order_list.php">order list</a>
		<a href="user_ranking.php">user ranking</a>
	</nav>


	<div class="container">
		<h2>제품 상세</h2>
		<p><strong><?php echo $product['product_name']; ?></strong></p>
		<p class="product-description"><?php echo str_replace('.', '<br>', $product['description']); ?></p>
		<p><strong>가격 | </strong> <?php echo $product['price']; ?></p>
		<p><strong>카테고리 | </strong> <?php echo $product['category_name']; ?></p>
		<p><strong>브랜드 | </strong> <?php echo $product['brand_name']; ?></p>

		<p><br></p>
		<h2>리뷰</h2>
		<?php if ($reviewResult->num_rows > 0) : ?>
			<p class="rating-star"><strong>⭐️</strong> <?php echo number_format($averageRating, 2); ?></p>
			<ul>
		<?php while ($review = mysqli_fetch_assoc($reviewResult)) : ?>
			<li>
				<p>
					<?php
					$rating = $review['rating'];
					for ($i = 1; $i <= 5; $i++) {
						if ($i <= $rating) {
							echo '⭐️';
						}
					}
					?>
					<?php echo '(', $review['rating'],')';?>

				</p>
				<p>
					<a href="review_detail.php?id=<?php echo $review['review_id']; ?>">
						<?php echo $review['review_text']; ?>
					</a>
				</p>
				<p><?php echo $review['review_date']; ?></p>
			</li>
		<?php endwhile; ?>
	</ul>
		<?php else : ?>
			<p>이 제품에 대한 리뷰가 없습니다.</p>
		<?php endif; ?>

		<a href="product_list.php" class="back-link">
			<button>목록</button>
		</a>
	</div>

	<?php mysqli_close(connectToDatabase()); ?>
</body>
</html>


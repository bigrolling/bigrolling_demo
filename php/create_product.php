<?php
include(__DIR__ . '/db_connection.php');

// 브랜드 목록
$brandQuery = "SELECT * FROM BRAND";
$brandResult = mysqli_query(connectToDatabase(), $brandQuery);

// 카테고리 목록 
$categoryQuery = "SELECT * FROM CATEGORY";
$categoryResult = mysqli_query(connectToDatabase(), $categoryQuery);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // 입력데이터
    $productName = $_POST['product_name'];
    $price = $_POST['price'];
    $description = $_POST['description'];
    $brandName = $_POST['brand_name'];
    $categoryID = $_POST['category_id'];

    // 트랜잭션
    mysqli_begin_transaction(connectToDatabase());

    try {
        $brandID = null;
        $brandCheckQuery = "SELECT brand_id FROM BRAND WHERE brand_name = '$brandName' FOR UPDATE";
        $brandCheckResult = mysqli_query(connectToDatabase(), $brandCheckQuery);
        
        // 이미 있는 브랜드면
        if ($brandCheckResult->num_rows > 0) {
            $brandRow = mysqli_fetch_assoc($brandCheckResult);
            $brandID = $brandRow['brand_id'];
        } else { // 없는 브랜드면 새 브랜드 추가
            $brandInsertQuery = "INSERT INTO BRAND (brand_name) VALUES ('$brandName')"; 
            mysqli_query(connectToDatabase(), $brandInsertQuery);
            $brandSelectQuery = "SELECT brand_id FROM BRAND WHERE brand_name = '$brandName' FOR UPDATE";
            $brandID = mysqli_fetch_assoc(mysqli_query(connectToDatabase(), $brandSelectQuery))['brand_id'];
        }

        $productInsertQuery = "INSERT INTO PRODUCT(product_name,price,description,brand_id,category_id) VALUES ('$productName', $price, '$description', $brandID, $categoryID)";
        mysqli_query(connectToDatabase(), $productInsertQuery);

        // 트랜잭션 커밋
        mysqli_commit(connectToDatabase());
    } catch (mysqli_sql_exception $exception) {
        // 트랜잭션 롤백
        mysqli_rollback(connectToDatabase());
        throw $exception;
    } finally {
        mysqli_close(connectToDatabase());
    }

    header("Location: product_list.php"); // 다시 list로 돌아가기
    exit();
}
?>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRODUCT 추가</title>
    <style>
        label {
            display: block;
            margin-bottom: 10px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
        }
        button {
            background-color: gray;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
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
    <h1>PRODUCT 추가</h1>
    <form method="post">
        <label for="product_name">상품 이름:</label>
        <input type="text" id="product_name" name="product_name" required>

        <label for="price">가격:</label>
        <input type="number" id="price" name="price" required>

        <label for="description">상세 설명:</label>
        <input type="text" id="description" name="description" >

        <label for="brand_name">브랜드:</label>
        <input type="text" id="brand_name" name="brand_name" required>

        <label for="category_id">카테고리:</label>
        <select id="category_id" name="category_id" required>
            <?php while ($categoryRow = mysqli_fetch_assoc($categoryResult)) : ?>
                <option value="<?php echo $categoryRow['category_id']; ?>"><?php echo $categoryRow['category_name']; ?></option>
            <?php endwhile; ?>
        </select>

        <button type="submit">추가</button>
    </form>

    </div>
	</div>
</body>
</html>

<?php
include(__DIR__ . '/db_connection.php');
session_start();

// Roll up 쿼리 실행 브랜드명 > 카테고리
$sql_roll = "SELECT BRAND.brand_name, CATEGORY.category_name, COUNT(PRODUCT.product_id) AS product_count
        FROM PRODUCT
        LEFT JOIN BRAND ON PRODUCT.brand_id = BRAND.brand_id
        LEFT JOIN CATEGORY ON PRODUCT.category_id = CATEGORY.category_id
        GROUP BY BRAND.brand_name, CATEGORY.category_name WITH ROLLUP";

$result_roll = mysqli_query(connectToDatabase(), $sql_roll);


// 카테고리 목록, 카테고리별 COUNT
$cateQuery = "SELECT CATEGORY.category_id, CATEGORY.category_name, COUNT(PRODUCT.product_id) AS product_count
                FROM CATEGORY
                LEFT JOIN PRODUCT ON CATEGORY.category_id = PRODUCT.category_id
                GROUP BY CATEGORY.category_id WITH ROLLUP";
$cateResult = mysqli_query(connectToDatabase(), $cateQuery);

// 초기값. 카테고리 없으면 null
$selectedCategory = isset($_GET['category']) ? $_GET['category'] : null;
if($selectedCategory=='undefined'){
    $selectedCategory=null;
}

// 카테고리에 해당하는 PRODUCT
$sql = "SELECT PRODUCT.*, BRAND.brand_name
        FROM PRODUCT
        LEFT JOIN BRAND ON PRODUCT.brand_id = BRAND.brand_id";
if (!empty($selectedCategory)) {
    $sql .= " WHERE PRODUCT.category_id = $selectedCategory";
}
$result = mysqli_query(connectToDatabase(), $sql);

?>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제품 전체보기</title>
    <style>
        body {
            text-align: center;
        }
        h1 {
            text-align: center;
        }
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
        th {
            background-color: #f2f2f2;
        }
        .category-buttons {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .category-buttons button {
            background-color: #f2f2f2;
            border: 1px solid #ddd;
            padding: 10px 15px;
            margin: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .category-buttons button.active {
            background-color: GRAY; /* Green color or any color you prefer */
            color: white;
        }
        .container {
            display: flex;
            justify-content: center; /* 가운데 정렬합니다. */
        }
        button {
        background-color: GRAY;
        color: black;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 5px;
        }


    </style>
</head>
<body>
<?php
include('index.php');
?>
    <div class="container">
    <div style=" width: 15%">
        <h1>제품 통계</h1>
        <?php 
            $currentBrand = null;
        ?>
        <?php if ($result_roll->num_rows > 0) : ?>
            <table>
                <tr>
                    <th>브랜드</th>
                    <th>카테고리</th>
                    <th>개수</th>
                </tr>
                <?php while ($row = mysqli_fetch_assoc($result_roll)) : ?>
                    <tr <?php echo ($row['brand_name'] === null) ? 'style="background-color: #f8f8f8;"' : ''; ?>>
                        <!-- 브랜드별 > 카테고리별 count(ROLL UP) -->
                        <td <?php echo ($row['brand_name'] == $currentBrand) ? 'style="background-color: #f8f8f8;"' : '';?>>
                        <?php if ($row['brand_name'] !== $currentBrand) {
                            echo $row['brand_name'];
                            $currentBrand = $row['brand_name'];
                        } ?></td>
                        <td <?php echo ($row['category_name'] == null) ? 'style="background-color: #f8f8f8;"' : '';?>><?php echo $row['category_name']; ?></td>
                        <td><?php echo $row['product_count']; ?></td>
                    </tr>
                <?php endwhile; ?>
            </table>
        <?php else : ?>
            <p>상품이 없습니다</p>
        <?php endif; ?>

    </div>
    <div style=" width: 80%;">
    <div class="container"> 
    <h1>제품 리스트</h1>
    <div style="display: flex;flex-direction: column;align-items: center;justify-content: center;">
    <a href="create_product.php">
        <button style="font-size: 14px;margin: 20px;">+</button>
    </a>
        </div></div>
    <!-- 카테고리 선택 버튼들 -->
    <div class="category-buttons">
        <?php while ($categoryRow = mysqli_fetch_assoc($cateResult)) : ?>
            <button onclick="filterByCategory(<?php echo $categoryRow['category_id']; ?>)"
                <?php echo ($categoryRow['category_id'] == $selectedCategory) ? 'class="active"' : ''; ?>>
                <?php
                if ($categoryRow['category_id'] !== null) {
                    echo $categoryRow['category_name'] . ' (' . $categoryRow['product_count'] . ')';
                } else {
                    echo '전체 제품 (' . $categoryRow['product_count'] . ')';
                }
                ?>
            </button>
        <?php endwhile; ?>
        <!-- <button onclick="showAllProducts()" <?php echo (empty($selectedCategory)) ? 'class="active"' : ''; ?>>
            전체 제품 보기
        </button> -->
    </div>

    <?php if ($result->num_rows > 0) : ?>
        <table>
            <tr>
                <th>상품 ID</th>
                <th>상품 이름</th>
                <th>가격</th>
                <th>브랜드</th>
            </tr>
            <?php while ($row = mysqli_fetch_assoc($result)) : ?>
                <tr>
                    <td><?php echo $row['product_id']; ?></td>
                    <td>
                    <a href='#' onclick='saveAndRedirect(<?php echo $row["product_id"]; ?>); return false;' style='color:black'>
                        <?php echo $row['product_name']; ?>
                    </a>
                    </td>
                    <td><?php echo $row['price']; ?></td>
                    <td><?php echo $row['brand_name']; ?></td>
                </tr>
            <?php endwhile; ?>
        </table>
    <?php else : ?>
        <p>해당 카테고리에 상품이 존재하지 않습니다.</p>
    <?php endif; ?>

    <script>
        // 선택된 카테고리에 해당하는 제품 보여주기
        function filterByCategory(categoryId) {
            window.location.href = "product_list.php?category=" + categoryId;
        }
        // 전체 제품 보기
        function showAllProducts() {
            window.location.href = "product_list.php";
        }
        function saveAndRedirect(productId) {
            // 세션에 값 저장
            fetch('save_session.php?id=' + productId)
                .then(response => response.text())
                .then(data => {
                    // 세션에 값이 저장되면 페이지 이동
                    window.location.href = 'product_detail.php';
                })
                .catch(error => console.error('Error:', error));
        }   
    </script>
    <?php mysqli_close(connectToDatabase()); ?>
    </div>
    </div>
   
</body>
</html>


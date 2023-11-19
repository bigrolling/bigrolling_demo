<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Big Rolling</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #333;
            padding: 15px;
            text-align: center;
            color: #fff; /* 흰색으로 변경 */
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
        }
        header a {
            color: white;
            text-decoration: none;
        }

        header a:hover {
            background-color: #999;
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

</body>
</html>

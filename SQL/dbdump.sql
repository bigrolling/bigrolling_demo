-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bigrolling
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `bigrolling`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `bigrolling` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `bigrolling`;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'아디다스'),(2,'드로우핏'),(3,'내셔널지오그래픽'),(4,'반스'),(5,'폴로 랄프로렌'),(6,'캘빈클라인'),(7,'무신사 스탠다드'),(8,'키뮤어KIIMUIR'),(9,'아메스 월드와이드'),(10,'글로니GLOWNY'),(11,'톰브라운');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'아우터'),(2,'원피스'),(3,'가방'),(4,'신발'),(5,'모자'),(6,'양말'),(7,'바지'),(8,'상의'),(9,'스커트'),(10,'스포츠'),(11,'속옷');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount` (
  `discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_code` int(11) NOT NULL,
  `discount_amount` int(11) NOT NULL,
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,291993,10),(2,321331,0),(3,323331,0),(4,399992,1),(5,899992,1),(6,18288,5),(7,327731,0),(8,227131,0),(9,229931,8),(10,877674,10),(11,199921,0),(12,111112,0),(13,199999,20),(14,232771,0),(15,888888,0),(16,991821,30),(17,555345,0),(18,955345,10),(19,129999,10),(20,122111,0),(21,999992,0);
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `product_id` int(11) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  KEY `product_id` (`product_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,45),(2,87),(3,23),(4,6),(5,92),(6,14),(7,78),(8,31),(9,4),(10,77),(11,29),(12,51),(13,5),(14,38),(15,12),(16,63),(17,84),(18,7),(19,18),(20,70),(21,42),(22,89),(23,55),(24,76),(25,27),(26,68),(27,35),(28,81),(29,9),(30,73),(31,152),(32,13),(33,41),(34,67),(35,2),(36,59),(37,3),(38,49),(39,74),(40,6),(41,582),(42,88),(43,33),(44,69),(45,26),(46,72),(47,37),(48,80),(49,121),(50,166),(51,90),(52,48),(53,75),(54,32),(55,65),(56,28),(57,62),(58,86),(59,43),(60,79),(61,15),(62,53),(63,97),(64,40),(65,71),(66,24),(67,50),(68,93),(69,36),(70,61),(71,85),(72,1),(73,54),(74,78),(75,13),(76,57),(77,110),(78,46),(79,2),(80,25),(81,60),(82,94),(83,11),(84,74),(85,17),(86,67),(87,29),(88,52),(89,86),(90,45);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `order_items_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`order_items_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,2,2),(2,1,1,1),(3,4,1,1),(4,2,3,1),(5,3,4,1),(6,4,4,1),(7,5,5,3),(8,1,6,1),(9,2,6,1),(10,81,7,1),(11,83,7,1),(12,1,8,1),(13,6,9,2),(14,20,9,2),(15,31,10,1),(16,3,11,1),(17,31,12,1),(18,32,12,2),(19,33,12,1),(20,34,12,1),(21,41,13,1),(22,42,13,1),(23,1,13,1),(24,3,13,1),(25,2,13,1),(26,1,14,1),(27,2,14,1),(28,3,14,1),(29,4,14,1),(30,5,15,1),(31,9,16,1),(32,10,16,1),(33,11,16,1),(34,41,17,1),(35,42,17,1),(36,43,17,1),(37,1,18,1),(38,2,18,2),(39,3,18,1),(40,70,19,1),(41,71,19,1),(42,72,19,1),(43,4,20,1),(44,11,21,1),(45,12,21,1),(46,13,21,1),(47,14,21,1),(48,15,22,1),(49,16,22,1),(50,17,22,1),(51,21,23,1),(52,22,23,1),(53,26,24,1),(54,27,24,1),(55,28,25,1),(56,29,25,1),(57,30,25,1),(58,33,26,2),(59,41,27,1),(60,42,27,1),(61,51,28,1);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `total_price` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2023-01-20',191000),(2,2,'2023-05-01',298000),(3,3,'2023-01-01',139000),(4,4,'2023-01-12',171490),(5,2,'2023-02-01',567000),(6,2,'2023-01-06',288000),(7,7,'2023-01-09',2290000),(8,8,'2023-05-09',149000),(9,9,'2023-05-11',350600),(10,10,'2023-01-21',167200),(11,11,'2023-11-01',126490),(12,12,'2023-11-03',424000),(13,13,'2023-11-04',449290),(14,14,'2023-11-07',459400),(15,15,'2023-11-11',189000),(16,16,'2023-11-18',202900),(17,17,'2023-11-20',239800),(18,18,'2023-11-02',566000),(19,9,'2023-11-05',117000),(20,20,'2023-11-09',45000),(21,1,'2023-10-01',244000),(22,2,'2023-10-02',192600),(23,3,'2023-10-04',223200),(24,4,'2023-10-07',122200),(25,5,'2023-10-11',98065),(26,6,'2023-10-13',141800),(27,7,'2023-10-15',287300),(28,8,'2023-10-20',96400);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` int(11) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `order_id` (`order_id`),
  KEY `discount_id` (`discount_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`discount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1,'2023-01-21',171900,'카카오페이'),(2,2,2,'2023-05-01',298000,'신한은행 무통장입금'),(3,3,2,'2023-01-01',139000,'무통장입금'),(4,4,2,'2023-01-13',171490,'무통장입금'),(5,5,3,'2023-02-13',567000,'무통장입금'),(6,6,2,'2023-01-08',288000,'토스페이먼츠'),(7,7,4,'2023-01-09',2267100,'삼성카드'),(8,8,5,'2023-05-09',149000,'신한카드'),(9,9,6,'2023-05-13',333070,'무통장입금'),(10,10,7,'2023-01-23',167200,'무통장입금'),(11,11,8,'2023-11-02',126490,'농협은행'),(12,12,8,'2023-11-05',424000,'농협은행'),(13,13,9,'2023-11-08',413346,'국민카드'),(14,14,8,'2023-11-11',459400,'블랙카드'),(15,15,10,'2023-11-18',170100,'트래블월렛'),(16,16,11,'2023-11-19',202900,'12개월할부 신한'),(17,17,12,'2023-11-20',239800,'신한카드'),(18,18,13,'2023-11-05',452800,'국민카드'),(19,19,14,'2023-11-07',452800,'농협카드'),(20,20,15,'2023-11-11',45000,'토스뱅크'),(21,21,16,'2023-10-02',170800,'삼성카드 2개월할부'),(22,22,17,'2023-10-05',192600,'국민은행 계좌이체'),(23,23,18,'2023-10-15',200880,'국민은행'),(24,24,17,'2023-10-12',122200,'신한카드'),(25,25,19,'2023-10-15',88258,'카카오페이'),(26,26,20,'2023-10-20',141800,'신한은행'),(27,27,21,'2023-10-22',287300,'롯데카드'),(28,28,21,'2023-10-28',96400,'롯데카드');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'슈퍼스타 82 - 블랙 / GY3428',149000,'친환경 재생 소재가 함유된 러버 쉘토 슈즈 80년대의 아카이브 슈즈를 부활시킨 아디다스 슈퍼스타 82를 만나보세요. 오리지널 모델을 거의 완벽하게 재현하고 현대적인 터치를 가미하여 과거의 재탄생을 선보입니다.',4,1),(2,'토바코 그루엔 - 브라운 / GX6941',139000,'바람, 땅, 불에서 영감을 얻은 대자연의 에너지를 녹여낸 아디다스 토바코 스니커즈를 만나보세요. 인조 스웨이드 갑피가 아늑하고 럭셔리한 느낌을 더해줍니다.',4,1),(3,'BB 트랙탑 - 마룬 / IN1000',126490,'60년대에 등장한 베켄바우어 트랙 슈트는 오랜 세월에 걸쳐 지금까지도 계속해서 사랑받는 트랙 슈트입니다.',1,1),(4,'CLSC XL HG0352',45000,'재생 소재가 사용된 넉넉하고 실용적인 데일리 백팩',3,1),(5,'SST 칼리지 재킷',189000,'클래식 룩과 무한한 실용성의 조화. 캐주얼한 데일리웨어와 스포츠웨어, 테크니컬 아우터를 하나로 담아낸 아디다스 재킷을 만나보세요. 편연한 루즈 핏이 클래식 룩을 선사하고, 편리한 지퍼 포켓과 골조직 트리밍이 기능적인 디테일을 살려줍니다. 두 가지 면으로 구성된 양면 디자인으로 간편하게 뒤집어 스타일에 변화를 줄 수 있습니다.',1,1),(6,'아디폼 슈퍼스타 부츠',115900,'개성과 다양성을 상징하는 아디다스 슈퍼스타가 틀을 깨는 새로운 버전으로 돌아왔습니다. 과거에서 얻은 영감을 기반으로 모던한 스트리트웨어에 변화를 주도록 재구성된 아디폼 SST 부츠를 만나보세요. 지속 가능한 소재로 제작된 부츠 컷 디자인이 미래를 향해 진화하는 대담한 룩을 선사하고, 아이코닉한 쉘토가 슈퍼스타의 역사를 재조명합니다. 부드러운 폼 소재를 사용해 편안하고 기분 좋은 착화감을 제공합니다.',4,1),(7,'스케이트보딩 슈무포일 슬라이드',55000,'',4,1),(8,'TERREX JAWPAW SLIP ON H.RDY HP8650',79000,'',4,1),(9,'오거나이저 하이드로테라 AT 샌들',129000,'ADIDAS / IF7597 2023 ALL / 남 여',4,1),(10,'아딜렛 22 - 브라운',51900,'\"인류가 미래에 화성에 정착한다면 어떤 신발이 필요할까\" 라는 질문을 기반으로 탄생한 아딜렛 22 슬라이드입니다. 3D 지형도와 인류의 화성 탐사에서 영감을 얻어 중력을 초월하는 초현대적 디자인 디테일을 선보입니다. 붉은 행성을 위해 준비된 완벽한 편안함으로 두 발을 아늑하게 받쳐주고, 도시의 시선을 집중시키는 미래적 감성으로 대담한 룩을 선사합니다.',4,1),(11,'솔리드 크루 삭스',22000,'양말입니다. 검정과 하얀색이 있으니 당신의 선호에 맞게 선택하세요',6,1),(12,'퍼피 새틴 숄더 백 L - 블랙',69000,'재생 소재가 사용된 넉넉하고 실용적인 데일리 백팩',3,1),(13,'파이어버드 트랙 팬츠',84000,'클래식한 룩에 Adicolo를 접목하였습니다. 이 옷장은 여러분이 알고 사랑하는 상징적인 Firebird 스타일을 자랑하지만 현대적인 컷과 신선한 팔레트를 갖추고 있습니다. 한쪽 면의 자수 트레포일 로고와 다리 아래의 3-스트라이프는 순수한 아디다스 DNA를 반영하며, 조임 끈이 있는 신축성 있는 허리 부분이 꼭 맞는 핏을 보장합니다. ',7,1),(14,'레트로 우븐 팬츠',69000,'과거에서 영감을 얻어 미래를 향해 나아가는 아디다스 트랙 팬츠를 만나보세요. 90년대 감성의 스타일을 기반으로 오리지널 디자인을 신선하게 재해석한 레트로 룩을 선보입니다. 대비색상 라인으로 포인트준 클래식 3-스트라이프가 스포티한 시그니처 디테일을 더해줍니다. 산뜻한 화이트 스니커즈와 매치해 스타일리시한 분위기를 연출할 수 있습니다.',7,1),(15,'타이트 컷 드레스',109000,'몸매를 아름답게 살려주는 실루엣으로 스타일과 편안함의 완벽한 조화를 담아낸 아디다스 드레스를 만나보세요. 부드러운 나일론 혼방 소재, 모크넥으로 마무리된 타이트 핏의 조화로 완벽하게 몸을 감싸는 세련된 룩을 선보입니다. 스포츠에 뿌리를 둔 3-스트라이프, 매력적인 반전을 더해주는 타원 형태의 등 트임, 깔끔한 미니 트레포일이 대담하면서도 절제된 디자인을 완성합니다. 스니커즈',2,1),(16,'테이퍼드 밴딩 치노 팬츠',59400,'브랜드 / 품번 DRAW FIT / DFPT2104LBE',7,2),(17,'스트레이트 뉴트럴 컬러 데님',66600,'DRAW FIT / DFDN2302BR',7,2),(18,'와이드 뉴트럴 컬러 데님 [BEIGE]',66600,'DRAW FIT / DFDN2301BE',7,2),(19,'모즈 울 카고 와이드 밴딩 슬랙스',62300,'DRAW FIT / DFPT3109BK',7,2),(20,'맥시 테이퍼드 치노 팬츠',59400,'DRAW FIT / DFPT0001GRBE',7,2),(21,'오버사이즈 스웨이드 라인 무스탕 자켓',167200,'OVERSIZE SUEDE LINE MUSTANG JACKET [BLACK]',1,2),(22,'와이드 밴딩 치노 팬츠',56000,'한정 판매:무신사 스토어를 포함한 제한된 판매처에서만 구매 가능한 상품입니다.',7,2),(23,'린넨 밴딩 와이드 팬츠',55800,'#바지#린넨바지#와이드바지#여름바지#와이드팬츠#팬츠',3,2),(24,'패딩 리버시블 트래퍼햇 BEIGE',89000,'2022 F/W / 남 여',3,3),(25,'N233AHA850 롱비니',49000,'2023 F/W / 남',3,3),(26,'울버킷햇',59000,'',3,3),(27,'차양캡',63200,'NATIONALGEOGRAPHIC / 1481936 #로고볼캡#모자#야구모자#캡#서핑햇#로고#22S/S컬렉션',3,3),(28,'투명패치캠프캡',20065,'NATIONALGEOGRAPHIC / 1217926  2020 ALL / 남',3,3),(29,'네이쳐 면 모달 배색 드로즈',39000,'NATIONALGEOGRAPHIC / 5000040603 2022 ALL / 남',11,2),(30,'숏비니',39000,'NATIONALGEOGRAPHIC / N233AHA800065',3,3),(31,'스케이트 로우 리컨스트럭트',109000,'Vans의 가장 대표적인 하이–탑 실루엣 스케이트–하이(Sk8-Hi)를 재해석한 스케이트–로우(Sk8-Lo) 스타일은 오리지널 디테일은 그대로 남겨두고, 더욱 가볍고 편안하게 착용할 수 있도록 디자인되었습니다. 견고한 캔버스/스웨이드 소재의 어퍼, 스케이트–하이 스타일과 동일한 오리지널 직조 라벨을 부착한 설포 등으로 디자인의 통일성을 강조한 것이 특징입니다.',4,4),(32,'컴피쿠시 슬립온',59900,'반스(Vans)에서 새롭게 선보이는 기술력인 컴피쿠시(Comfy Cush)가 클래식 슬립온 실루엣에 새로운 힘을 불어넣었습니다. 구름 위를 걷는 듯한 최고급 클래스의 편안한 착화감을 경험해보세요. 컴피쿠시(Comfy Cush) 기술력으로 신발의 전체적인 형태와 고무 아웃솔을 조화롭게 몰딩하여, 편안함과 그립력 모두를 제공합니다. 특히, 고무 아웃솔은 내구성과 견인력의 밑바탕이 됩니다.',4,4),(33,'올드스쿨 플랫폼',70900,'반스의 올드스쿨 플랫폼은 클래식한 사이드 스트라이프 스케이트 신발에 견고한 캔버스 및 스웨이드 갑피, 잦은 마모를 견딜 수 있도록 강화된 토캡이 특징입니다. 또한, 유연성을 위해 패딩 처리된 칼라, 플랫폼 형태의 시그니처 고무 와플 밑창이 결합된 형태로 제작되었습니다.',4,4),(34,'컴피쿠시 어센틱',59800,'반스(Vans)에서 새롭게 선보이는 기술력인 컴피쿠시(Comfy Cush)가 어센틱 실루엣에 새로운 힘을 불어넣었습니다.',4,4),(35,'올드스쿨 - (껌)블랙:화이트',67900,'완전히 새로워진 어퍼, 몰드형 뒤꿈치 지지대, 고정형 설포 스트랩, 새로운 컷의 듀라캡(DURACAP™) 언더레이로 제작한 검솔 스케이트 Old Skool 올드스쿨은 가장 필요한 부위의 통기성과 내구성을 높여 최고의 핏을 선사합니다.',4,4),(36,'스타일 36 VR3 - 팝 블루:트루 화이트',70900,'반스에 새롭게 추가된 VR3는 지속 가능한 신발의 생산이라는 더 큰 목표를 향한 작은 한 걸음입니다. 모든 부분을 재고려, 재설계, 재구축해 보다 지속 가능한 제품이 되도록 하였습니다. 갑피에는 최소한 50% 이상의 재활용/오가닉 혹은 재사용 소재가 사용되었으며, 풋베드는 25%의 친환경 소재의 EVA폼으로 만들어져 하루종일 편안한 착용감을 제공합니다. ',4,4),(37,'어센틱 44 DX - 체커보드 트레이드윈즈',70900,'어센틱 44 DX에는 오리지널 스타일 넘버와 컬러, 고광택의 폭싱 테이프, 코튼 소재의 신발끈 그리고 10oz의 무게감 있는 캔버스 원단이 사용되어 전반적으로 높은 완성도를 확인할 수 있으며, 반스만의 고무 와플 아웃솔로 지면과의 접지력을 최대화 하였습니다.',4,4),(38,'케이블 니트 울 캐시미어 스웨터',279000,'아이코닉한 케이블 니트 스웨터를 재해석한 스웨터로, 울과 캐시미어가 섞인 이탈리아산 방적사로 제작되었습니다.',8,5),(39,'아이코닉 플래그 스웨터',399000,'미국에서 제작한 Polo Ralph Lauren의 아이코닉 아메리칸 플래그 스웨터로, 아메리칸 스타일을 향한 Ralph Lauren의 오랜 애정을 고스란히 녹여낸 디자인이 특징입니다',8,5),(40,'케이블 니트 코튼 스웨터',239000,'Polo의 가장 아이코닉한 디자인 디테일 두 가지인 텍스처 케이블니트 모티프와 시그니처 포니를 결합한 코튼 스웨터입니다.',8,5),(41,'케이블 니트 코튼 크루넥 스웨터',239000,'Polo 스타일링의 머스트해브 아이템인 슬림핏 크루넥 스웨터로, 통기성이 있는 코튼으로 제작되었으며 시그니처 케이블 니트 구조가 특징입니다',8,5),(42,'코튼 테리 윔블던 리스트밴드',48300,'윔블던 오픈을 기념하여 출시한 윔블던 캡슐의 아이코닉한 손목 보호대 입니다.가로 : 7.5cm / 세로 : 8.5cm',10,5),(43,'트래블러 스윔 트렁크',153300,'패치워크 디자인이 인상적인 트래블러 미드 트렁크입니다. 화려하면서도 클래식한 폴로 랄프 로렌만의 시그니처 디자인을 경험해 보세요.',10,5),(44,'스퀘어 반다나',159000,'폴로 랄프 로렌의 아이코닉한 포니 자수가 포인트인 스퀘어 반다나입니다. 활용도 높은 아이템으로 폴로 랄프 로렌 룩을 완성해 보세요.',10,5),(45,'여성 모던코튼 훅앤아이 브라렛 세트',120000,'CALVIN KLEIN UNDERWEAR / QF7059100+F3787AD_100',11,6),(46,'여성 서페이스 심리스 비키니',50700,'CALVIN KLEIN UNDERWEAR / QP2563ODEV',11,6),(47,'모던코튼 트라이앵글 세트',106000,'CALVIN KLEIN UNDERWEAR / QF5650_001+F3787AD_001',11,6),(48,'모던코튼 스트레치 3PK 트렁크',59500,'CALVIN KLEIN UNDERWEAR / NB2380GVZ',11,6),(49,'서페이스 심리스 노와이어 브라렛',58400,'CALVIN KLEIN UNDERWEAR / QP2225O94Q',11,6),(50,'1996 마이크로 AF 라이틀리 라인드 브라렛',53400,'CALVIN KLEIN UNDERWEAR / QF7245ADUB1',11,6),(51,'퓨쳐쉬프트 라운지 롱 슬리브 탑',96400,'CALVIN KLEIN UNDERWEAR / NM2458PET 2023 F/W / 남',11,6),(52,'우먼즈 코튼 플리츠 미니 스커트',39900,'A라인 실루엣의 우먼즈 코튼 플리츠 미니 스커트. 밀도 높은 코튼 개버딘 원단을 사용해 내구성이 우수하며 탄탄한 질감을 갖췄다. 적당한 두께로 사계절 무리 없이 착용 가능하다. 허리 밴드를 생략한 웨이스트밴들리스(Waistbandless) 타입으로 미니멀하게 디자인했다',9,7),(53,'우먼즈 코듀로이 미니 스커트',30290,'빈티지한 무드의 우먼즈 코듀로이 미니 스커트. 무릎 위로 닿는 적당한 길이의 자연스러운 세미 A라인 실루엣으로 디자인했다.',9,7),(54,'우먼즈 코듀로이 미디 스커트',38900,'빈티지한 무드의 코듀로이 미디 스커트.자연스러운 세미 A라인 실루엣에 종아리까지 내려오는 적당한 기장을 갖췄다. 코듀로이 원단은 14골(Wale)로 밀도 높게 제직했고 3%의 폴리우레탄을 포함해 신축성이 뛰어나다. 가먼트 워싱을 통해 세탁 시 발생하는 수축을 최소화하고 선명한 컬러를 구현했으며, 내구성 좋은 YKK 社의 지퍼를 사용해 완성도를 높였다. 코듀로이 특유의 자연스러운 색감과 따뜻한 질감으로 다양한 캐주얼 스타일링에 활용하기 좋은 제품이다.',9,7),(55,'우먼즈 베이식 미니 스커트',32900,'간결한 디자인의 우먼즈 베이식 미니 스커트. 하이 웨이스트 타입의 자연스러운 세미 A라인 실루엣으로 디자인했다. 4%의 폴리우레탄이 포함된 양방향 스트레치 T/R 원단을 사용해 신축성이 뛰어나며 덕분에 자유로운 활동성을 보장한다. 적당한 두께와 중량을 지녀 사계절 내내 활용할 수 있다.',9,7),(56,'데일리 푸퍼 숏 패딩 재킷',54080,'적당한 높이의 넥워머는 목을 따뜻하게 감싸준다. 앞여밈에는 내구성이 뛰어난 YKK社의 2-way VISLON® 지퍼를 사용했으며, 지퍼 사이로 찬 공기가 들어오지 않도록 내·외부에 플랩을 적용했다. 메인 포켓에는 스냅 버튼을 추가해 소지품의 분실을 방지하며, 포켓 안감으로는 부드럽고 보온성이 높은 마이크로 기모 원단을 사용했다.',1,7),(57,'트랜스폼 라운드 넥 라이트 다운 재킷',41800,'네크라인 안쪽의 스냅을 이용해 라운드 넥에서 브이 넥으로 변형할 수 있어 2가지의 네크라인으로 연출이 가능하다. 베이식한 가로 퀼팅을 적용한 디자인으로 다양한 아우터에 레이어드가 쉽고, 단독으로 입어도 좋을 만큼 겉감의 표면을 적당히 매트한 질감으로 만들었다.필파워 600FP의 덕다운을 75g 충전해 이너웨어로 입었을 때 과하지 않으면서도, 단독으로 착용했을 때 지나치게 얇지 않도록 적절한 부피를 갖췄다. ',1,7),(58,'우먼즈 데일리 푸퍼 리버서블 플리스 숏 패딩 재킷',71890,'겉감은 매트한 질감의 메카니컬 스트레치 소재를 사용했으며, TPU 래미네이팅(Thermoplastic PolyUrethane Laminating) 필름 가공을 더해 패딩프루프 기능을 지닌 원단을 사용했다. 또한, 생활 방수를 돕는 WR(Water Repellent) 가공을 더해 눈과 비바람을 막아 쾌적한 착용감을 제공한다. 이면에는 긴 모장의 플리스 원단을 사용해 원단 사이에 공기층을 형성해 보온성이 뛰어나며 가볍고 부드러운 것이 특징이다.',1,7),(59,'우먼즈 트랜스폼 라운드 넥 라이트 다운 베스트',39890,'겨울 시즌, 다양한 아우터 속 이너로 활용하기 좋은 우먼즈 트랜스폼 라운드 넥 라이트 다운 베스트.네크라인 안쪽의 스냅을 이용해 라운드 넥에서 브이 넥으로 변형할 수 있어 2가지의 네크라인으로 연출이 가능하다. 베이식한 가로 퀼팅을 적용한 디자인으로 다양한 아우터에 레이어드가 쉽고, 단독으로 입어도 좋을 만큼 겉감의 표면을 적당히 매트한 질감으로 만들었다.',1,7),(60,'코튼 워셔블 하찌 니트',59900,'[2-PACK](Half zip-up + Crew Neck selection) cotton washable hachi knit 무신사 스토어를 포함한 제한된 판매처에서만 구매 가능한 상품입니다.  KIIMUIR / KBCFUKL001KBCFUKL002',8,8),(61,'하찌 새들 크루넥 니트',49900,'KIIMUIR / KBCWUKL005',8,8),(62,'슬림핏 투톤 니트',19900,'KIIMUIR / KBCFWKL085 (Woman)(5 COLOR) Slim Fit Two-Tone Knit 무신사 스토어를 포함한 제한된 판매처에서만 구매 가능한 상품입니다.',3,8),(63,'부클 플라워 맨투맨_2',47200,'#맨투맨추천#그래픽맨투맨#스웻셔츠#맨투맨#스웨트셔츠 KIIMUIR / KBCFUTL001',8,8),(64,'이레귤러 스트라이프 니트 베스트',39900,'KIIMUIR / KBCS1KV001NY 무신사 스토어를 포함한 제한된 판매처에서만 구매 가능한 상품입니다.',8,8),(65,'코튼 오픈 카라 케이블 니트',42900,'KIIMUIR / KBCU3KS008',8,8),(66,'LABEL LEG WARMER BEIGE',59000,'AMES-WORLDWIDE / AM2DFUAB80ABE #니트#여성워머#캐주얼#여성양말#워머#컨템포러리#니트웨어',6,9),(67,'LABEL LEG WARMER BLUE',59000,'AMES-WORLDWIDE / AM2DFUAB80ABL #여성양말#컨템포러리#레이어드#워머#니트#니트웨어#캐주얼',6,9),(68,'COLORED LOGO 비니',29000,'AMES-WORLDWIDE / 21FWCP03',5,9),(69,'퍼지 비니 네이비',59000,'AMES-WORLDWIDE / AM2DFUAB61ANV',5,9),(70,'BASIC LOGO BALL CAP GREEN',39000,'AMES-WORLDWIDE / AM2CFUAB20AGN',5,9),(71,'DENNY BABY BACKPACK',128000,'GLOWNY / GY23BBG001',3,10),(72,'BONN TOTE BAG',88000,'GLOWNY / 23A0003',3,10),(73,'CHICA MINI BAG',118000,'GLOWNY / GY23BBG003',3,10),(74,'BOUNDERLESS DOWN PUFFER JACKET',29800,'GLOWNY / GY23CPD001IV',1,10),(75,'JORDAN PIGMENT ZIP-UP HOODIE후디',158000,'GLOWNY / GY23CZU004',1,10),(76,'MOSS PADDED JUMPER',228000,'GLOWNY / GY23CJK001_IV',1,10),(77,'남성 RWB 탭 디테일 브이넥 가디건',638000,'자수 및 패치, 각종 라벨, 가죽 제품 로고 양각 및 음각 방식, 개체별 제조국 등의 상품 디테일 및 브랜드 택, 브랜드 포장 봉투, 브랜드 더스트 백, 하드케이스, 보증서 등 브랜드 구성품의 경우 생산 시기 및 입출고 시점에 따라 촬영된 상품 사진 및 상세페이지상의 정보와 고객님께서 받아보는 실제 상품의 디테일이 상이할 수 있습니다.',1,11),(78,'남성 4 바 밀라노 스티치 가디건',1180000,'자수 및 패치, 각종 라벨, 가죽 제품 로고 양각 및 음각 방식, 개체별 제조국 등의 상품 디테일 및 브랜드 택, 브랜드 포장 봉투, 브랜드 더스트 백, 하드케이스, 보증서 등 브랜드 구성품의 경우 생산 시기 및 입출고 시점에 따라 촬영된 상품 사진 및 상세페이지상의 정보와 고객님께서 받아보는 실제 상품의 디테일이 상이할 수 있습니다.',1,11),(79,'남성 4 바 울 집업 후드',1872000,'자수 및 패치, 각종 라벨, 가죽 제품 로고 양각 및 음각 방식, 개체별 제조국 등의 상품 디테일 및 브랜드 택, 브랜드 포장 봉투, 브랜드 더스트 백, 하드케이스, 보증서 등 브랜드 구성품의 경우 생산 시기 및 입출고 시점에 따라 촬영된 상품 사진 및 상세페이지상의 정보와 고객님께서 받아보는 실제 상품의 디테일이 상이할 수 있습니다.',1,11),(80,'여성 4 바 버튼업 카라 니트 가디건',1199000,'자수 및 패치, 각종 라벨, 가죽 제품 로고 양각 및 음각 방식, 개체별 제조국 등의 상품 디테일 및 브랜드 택, 브랜드 포장 봉투, 브랜드 더스트 백, 하드케이스, 보증서 등 브랜드 구성품의 경우 생산 시기 및 입출고 시점에 따라 촬영된 상품 사진 및 상세페이지상의 정보와 고객님께서 받아보는 실제 상품의 디테일이 상이할 수 있습니다',1,11),(81,'남성 도니골 케이블 4 바 브이넥 가디건',840000,'그레이 / MKC409AY1506055',1,11),(82,'남성 RWB 암 밴드 집업 후드',897000,'자수 및 패치, 각종 라벨, 가죽 제품 로고 양각 및 음각 방식, 개체별 제조국 등의 상품 디테일 및 브랜드 택, 브랜드 포장 봉투, 브랜드 더스트 백, 하드케이스, 보증서 등 브랜드 구성품의 경우 생산 시기 및 입출고 시점에 따라 촬영된 상품 사진 및 상세페이지상의 정보와 고객님께서 받아보는 실제 상품의 디테일이 상이할 수 있습니다.',1,11),(83,'여성 캐시미어 4 바 클래식 브이넥 가디건',1450000,'네이비 / FKC001A00011415 ',1,11),(84,'남성 4바 재킷',1050000,'자수 및 패치, 각종 라벨, 가죽 제품 로고 양각 및 음각 방식, 개체별 제조국 등의 상품 디테일 및 브랜드 택, 브랜드 포장 봉투, 브랜드 더스트 백, 하드케이스, 보증서 등 브랜드 구성품의 경우 생산 시기 및 입출고 시점에 따라 촬영된 상품 사진 및 상세페이지상의 정보와 고객님께서 받아보는 실제 상품의 디테일이 상이할 수 있습니다',1,11),(85,'여성 4 바 맨투맨',525000,'THOM BROWNE / FJT002A00535415FW23',8,11),(86,'남성 4바 크루 맨투맨',390000,'THOM BROWNE / MJT383A06910265FW23',8,11),(87,'남성 코튼 피케 센터 백 스트라이프 릴렉스 핏 반소매 티셔츠',299000,'자수 및 패치, 각종 라벨, 가죽 제품 로고 양각 및 음각 방식, 개체별 제조국 등의 상품 디테일 및 브랜드 택, 브랜드 포장 봉투, 브랜드 더스트 백, 하드케이스, 보증서 등 브랜드 구성품의 경우 생산 시기 및 입출고 시점에 따라 촬영된 상품 사진 및 상세페이지상의 정보와 고객님께서 받아보는 실제 상품의 디테일이 상이할 수 있습니다.',8,11),(88,'여성 4 바 레이어드 롱 셔츠',1450000,'자수 및 패치, 각종 라벨, 가죽 제품 로고 양각 및 음각 방식, 개체별 제조국 등의 상품 디테일 및 브랜드 택, 브랜드 포장 봉투, 브랜드 더스트 백, 하드케이스, 보증서 등 브랜드 구성품의 경우 생산 시기 및 입출고 시점에 따라 촬영된 상품 사진 및 상세페이지상의 정보와 고객님께서 받아보는 실제 상품의 디테일이 상이할 수 있습니다.',8,11),(89,'여성 마드라스 체크 셔닐 트위드 라운드 칼라 유틸리티 재킷',2809000,'자수 및 패치, 각종 라벨, 가죽 제품 로고 양각 및 음각 방식, 개체별 제조국 등의 상품 디테일 및 브랜드 택, 브랜드 포장 봉투, 브랜드 더스트 백, 하드케이스, 보증서 등 브랜드 구성품의 경우 생산 시기 및 입출고 시점에 따라 촬영된 상품 사진 및 상세페이지상의 정보와 고객님께서 받아보는 실제 상품의 디테일이 상이할 수 있습니다.',1,11),(90,'여성 4바 블레이저 재킷',135000,'THOM BROWNE / FBC010V06146415SS23 병행수입',1,11),(91,'럭셔리 로우탑 스니커즈 - 화이트 / LX750',169000,'하이엔드 소재와 정교한 디자인이 결합된 럭셔리 로우탑 스니커즈. 편안한 착용감과 세련된 룩으로 도심 속에서 눈에 띄는 존재감을 선보입니다.',4,1),(92,'우븐 패션 토트백 - 블루 / WB430',98000,'세련된 우븐 패턴이 돋보이는 패션 토트백. 다양한 수납 공간과 튼튼한 소재로 일상의 모든 소지품을 손쉽게 담을 수 있습니다.',3,2),(93,'스트라이프 코튼 셔츠 - 네이비 / ST120',59900,'스트라이프 패턴이 돋보이는 코튼 셔츠. 가벼운 소재로 시원한 착용감을 제공하며, 다양한 스타일과 어우러지는 클래식한 디자인입니다.',8,3),(94,'캐주얼 데님 팬츠 - 블랙 / DN550',74900,'편안한 착용감과 다양한 스타일링이 가능한 캐주얼 데님 팬츠. 블랙 컬러로 세련된 룩을 연출하며, 일상에서 편안하게 착용할 수 있습니다.',7,5),(95,'테일러드 블레이저 - 그레이 / BL710',129000,'정교한 테일러링이 돋보이는 그레이 블레이저. 다양한 스타일에 어울리는 클래식한 디자인으로, 단정하고 세련된 분위기를 연출합니다.',1,3),(96,'플로럴 프린트 원피스 - 핑크 / FD220',89000,'화사한 플로럴 프린트가 돋보이는 여성스러운 원피스. 시원한 소재와 편안한 실루엣으로 여름철 쿨한 룩을 완성합니다.',2,6),(97,'스포츠 런닝화 - 그린 / RN330',109000,'편안한 착용감과 스포티한 디자인의 런닝화. 경량 소재와 쿠션성 있는 밑창으로 편안한 운동을 즐길 수 있습니다.',4,7),(98,'코튼 크루 넥 티셔츠 - 화이트 / CT480',34900,'심플하면서도 세련된 화이트 티셔츠. 다양한 코디에 활용 가능하며, 부드러운 코튼 소재로 편안한 착용을 선사합니다.',8,3),(99,'레더 슬리퍼 - 브라운 / LS620',69000,'고급스러운 레더 소재로 제작된 브라운 슬리퍼. 편안한 착용감과 세련된 디자인으로 캐주얼한 룩에 포인트를 더합니다.',4,8),(100,'러블리 플라워 드레스 - 민트 / FD350',75000,'사랑스러운 플라워 패턴이 돋보이는 민트 컬러 드레스. 여성스러운 실루엣으로 다가가며, 가벼운 소재로 시원한 착용감을 선사합니다.',2,6),(101,'카라라운드 코튼 셔츠 - 화이트 / CS240',49900,'카라 디테일이 돋보이는 화이트 코튼 셔츠. 심플하면서도 세련된 디자인으로 다양한 코디에 활용 가능합니다.',8,3),(102,'헤링본 패턴 가디건 - 그레이 / CD180',89000,'고급스러운 헤링본 패턴이 돋보이는 그레이 가디건. 부드러운 소재와 편안한 핏으로 캐주얼한 룩에 따뜻함을 더합니다.',1,3),(103,'스트레치 캐주얼 쇼츠 - 네이비 / SH520',45000,'스트레치 소재로 편안한 착용감을 선사하는 네이비 캐주얼 쇼츠. 여름철 시원하게 착용할 수 있으며, 다양한 상황에 어울리는 아이템입니다.',7,5),(104,'플리츠 미니 스커트 - 핑크 / SK670',59000,'유니크한 플리츠 디자인이 돋보이는 핑크 미니 스커트. 여성스러운 실루엣으로 다양한 상의와 매치하여 세련된 스타일을 연출할 수 있습니다.',9,6),(105,'린넨 캐주얼 셔츠 - 베이지 / LS330',57900,'가볍고 시원한 린넨 소재로 제작된 베이지 캐주얼 셔츠. 다양한 하의와 매치하여 쿨하면서도 세련된 룩을 완성할 수 있습니다.',8,3),(106,'릴렉스핏 코튼 티 - 그레이 / RT280',29900,'릴렉스한 핏으로 편안한 착용감을 선사하는 그레이 코튼 티셔츠. 다양한 하의와 매치하여 캐주얼한 데일리 룩을 완성합니다.',8,3),(107,'캔버스 슬립온 스니커즈 - 화이트 / SN410',69000,'캔버스 소재와 심플한 디자인으로 인기 있는 화이트 슬립온 스니커즈. 편안한 착용감과 다양한 스타일에 어울리는 아이템입니다.',4,1),(108,'스트라이프 펜슬 스커트 - 네이비 / SK810',62000,'스트라이프 패턴이 돋보이는 네이비 펜슬 스커트. 여성스러운 실루엣과 고급스러운 디자인으로 세련된 룩을 연출할 수 있습니다.',9,6),(109,'클래식 라이더 재킷 - 블랙 / RJ920',178000,'클래식한 라이더 재킷의 블랙 컬러 버전. 가죽 소재와 터틀넥 디자인으로 스타일리시한 룩을 완성할 수 있는 아우터입니다.',1,3),(110,'포켓 스트라이프 셔츠 - 블루 / SS340',55900,'포켓 디테일이 돋보이는 블루 스트라이프 셔츠. 시원한 느낌의 소재로 제작되어 여름철 시원하게 착용할 수 있습니다.',8,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returns` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `return_date` date NOT NULL,
  `return_reason` text DEFAULT NULL,
  PRIMARY KEY (`return_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `returns_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
INSERT INTO `returns` VALUES (1,8,'2023-05-20','색상이 기대와 너무 다릅니다'),(2,10,'2023-01-30','불량품입니다');
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review_text` text DEFAULT NULL,
  `review_date` date NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,4,'발도 편하고 디자인도 이쁜게 너무 마음에 들어요 사이즈는 정사이즈 잘 맞는듯','2023-03-20'),(2,1,2,3,'무난하게 이쁜 커플템으로 잘 신고다니고있습니다','2023-05-10'),(3,4,1,2,'생각보다 작아서 짐이 많이 안들어가요','2023-09-11'),(4,2,3,2,'나랑 잘어울려요 아주 조아요','2023-01-30'),(5,3,4,4,'가성비 좋아요','2023-03-01'),(6,5,2,5,'가족끼리 다같이 맞췄는데 너무 이뻐요','2023-11-01'),(7,1,8,1,'색이 화면과 너무 달라요..','2023-05-20'),(8,9,20,4,'앵간함','2023-05-30'),(9,3,11,5,'신상 기대한만큼 이쁩니다','2023-11-20'),(10,1,14,5,'이런걸 기다려왔다고!','2023-11-21'),(11,2,14,5,'이런걸 기다려왔다고!','2023-11-21'),(12,3,14,5,'이런걸 기다려왔다고!','2023-11-21'),(13,4,14,5,'이런걸 기다려왔다고!','2023-11-21'),(14,5,15,3,'무난합니다 질은 좋아요','2023-11-27'),(15,1,18,5,'색깔이 진짜 이뻐요','2023-11-18'),(16,2,18,4,'인조 갑피라는데 진짜같아요','2023-11-18'),(17,3,18,5,'지금 날씨에 딱이에요','2023-11-18'),(18,70,19,4,'계속 좋은 니트 찾았는데 좋아요','2023-11-19'),(19,71,19,5,'니트의 계절이다','2023-11-19'),(20,72,19,5,'프린팅이 실제로 보면 엄청 귀여워요','2023-11-19'),(21,11,1,5,'아디다스 세일로 득템했어요!! 다들 쿠폰 받아서 노려보세요','2023-11-01'),(22,12,1,4,'아디다스 세일로 득템했어요!! 다들 쿠폰 받아서 노려보세요','2023-11-03'),(23,13,1,5,'아디다스 세일로 득템했어요!! 다들 쿠폰 받아서 노려보세요','2023-11-01'),(24,14,1,4,'아디다스 세일로 득템했어요!! 다들 쿠폰 받아서 노려보세요','2023-11-01'),(25,15,2,5,'역시 바지 맛집','2023-11-11'),(26,16,2,5,'역시 바지 맛집','2023-11-11'),(27,17,2,5,'역시 바지 맛집','2023-11-11'),(28,21,3,5,'여기 와이딩 밴딩 치노 팬츠랑 같이샀는데 둘이 조합이 좋아요','2023-11-01'),(29,22,3,5,'바지가 쫀쫀해서 기분이 조크든요','2023-11-01'),(30,26,4,4,'모자가 따듯하고 좋아요','2023-11-01'),(31,27,4,5,'귀까지 따뜻해서 잘산듯해요','2023-11-01'),(32,28,4,3,'무난무난해요','2023-11-21'),(33,29,4,5,'이 브랜드 모자 여러개 사봤는데 이게 제일 이뻐요','2023-11-21'),(34,30,4,4,'색도 이쁘고 힙해요','2023-11-21'),(35,33,6,5,'커플 신발로 샀어요 마음에든다','2023-11-21'),(36,42,7,4,'손목아팠는데 편해지고 효과 좋아요 잘 보호해줌','2023-11-11'),(37,41,7,5,'참 이쁜옷ㅎㅎ','2023-11-11'),(38,51,8,5,'살면서 입은것중에 제일 편함','2023-11-01');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping` (
  `shipping_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `ship_date` date DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`shipping_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (1,1,'경기도 성남시 수정로 129','2023-02-01','배송완료'),(2,2,'서울 서대문구','2023-05-04','배송완료'),(3,3,'경기도 용인시 수지구','2023-01-04','배송완료'),(4,4,'서울 중구','2023-05-04','배송완료'),(5,5,'서울 서대문구','2023-03-04','배송완료'),(6,7,'제주도 ','2023-02-04','배송완료'),(7,8,'송파구','2023-05-14','배송완료'),(8,9,'송파 이편한세상','2023-05-24','배송중'),(9,10,'삼성역 이편한세상','2023-01-26','배송완료'),(10,11,'구리시 117동 1901호','2023-11-05','배송완료'),(11,12,'강원도 속초 바다앞','2023-11-30','배송중'),(12,13,'강원도 춘천시 닭갈비집','2023-12-01','배송 준비중'),(13,14,'경기도 성남시 좋은아파트','2023-11-19','배송완료'),(14,15,'경기도 안산 탄천아파트','2023-11-25','배송중'),(15,16,'경기도 수원시','2023-11-28','배송 준비중'),(16,18,'마포구청 앞','2023-11-05','배송완료'),(17,19,'서울 서대문구','2023-11-06','배송완료'),(18,20,'서울 중구','2023-11-22','배송중'),(19,21,'서울 을지로3가','2023-10-04','배송완료'),(20,22,'서울 뚝섬공원 푸르지오','2023-10-10','배송완료'),(21,23,'서울 잘살아아파트','2023-10-24','배송완료'),(22,24,'경기도 안산시 행복동','2023-10-19','배송완료'),(23,25,'경기도 용인시 수지구 죽전동','2023-10-20','배송완료'),(24,27,'대구광역시 성심당','2023-10-24','배송완료'),(25,28,'부산광역시 해운데호텔 202호','2023-10-30','배송완료');
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'허채린','julia@naver.com','여자','010-2600-0982'),(2,'하채민','hihi@naver.com','여자','010-1231-5522'),(3,'허채은','sallygood@naver.com','여자','010-3211-2344'),(4,'한지민','jimmin@naver.com','여자','010-6933-3211'),(5,'하지영','jiji@naver.com','여자','010-3933-3210'),(6,'김광수','wowkwangsu@naver.com','남자','010-1993-2221'),(7,'금광석','gold@naver.com','남자','010-9988-2001'),(8,'김도리','diri@naver.com','남자','010-2338-2773'),(9,'김방식','bangbang@naver.com','남자','010-3333-7777'),(10,'김민식','minmin@naver.com','남자','010-3544-7666'),(11,'박수지','suji@naver.com','여자','010-2610-0982'),(12,'박신지','sinjji@naver.com','여자','010-3211-321'),(13,'방죠미','sallygood@naver.com','여자','010-8766-9877'),(14,'배사랑','love@naver.com','여자','010-9877-9877'),(15,'배순자','sunsun@naver.com','여자','010-7899-7899'),(16,'강해민','strong@naver.com','남자','010-9999-7778'),(17,'고준서','gogogo@naver.com','남자','010-9988-7989'),(18,'노혁우','nonono@naver.com','남자','010-2338-9999'),(19,'노혁구','nonogu@naver.com','남자','010-7887-7777'),(20,'나혁수','namememe@naver.com','남자','010-9777-9999'),(21,'부지민','jimmm@naver.com','여자','010-2133-0982'),(22,'박혜원','hyewon@naver.com','여자','010-1231-7665'),(23,'장가영','goaway@naver.com','여자','010-7655-2344'),(24,'정민영','minmin00@naver.com','여자','010-5677-7777'),(25,'정신주','jungsin@naver.com','여자','010-6877-8688'),(26,'모영수','0water@naver.com','남자','010-8666-2221'),(27,'문진영','jin00@naver.com','남자','010-9988-8777'),(28,'마필수','need@naver.com','남자','010-2338-4555'),(29,'마동석','strongman@naver.com','남자','010-4655-7777'),(30,'민인서','inseo@naver.com','남자','010-3544-9503'),(31,'이소리','sound@naver.com','여자','010-5433-0982'),(32,'이바영','hey@naver.com','여자','010-1231-3455'),(33,'임다영','all@naver.com','여자','010-3211-1322'),(34,'임도영','dodo@naver.com','여자','010-1233-3211'),(35,'이은경','silver@naver.com','여자','010-3933-3322'),(36,'신구영','old0@naver.com','남자','010-1993-6546'),(37,'신석군','sinsuckgi@naver.com','남자','010-4566-2001'),(38,'최성민','sungmin@naver.com','남자','010-2338-6544'),(39,'최하영','hi00@naver.com','남자','010-3333-6456'),(40,'최훈영','0hun0hun@naver.com','남자','010-4653-7666'),(41,'김서영','su00zero@naver.com','여자','010-1233-0982'),(42,'심수재','waterjae@naver.com','여자','010-1231-3111'),(43,'심지혜','wisdom@naver.com','여자','010-9777-2344'),(44,'김신영','new0zero@naver.com','여자','010-6933-8677'),(45,'김진사','jin@naver.com','여자','010-3455-3210'),(46,'하석진','suck@naver.com','남자','010-3455-7666'),(47,'허정무','mumumu@naver.com','남자','010-9988-7655'),(48,'추성훈','sunghun@naver.com','남자','010-9999-2773'),(49,'채두영','twozero@naver.com','남자','010-3333-4020'),(50,'이정훈','sung12233@naver.com','남자','010-4241-0100'),(51,'이대훈','dae88@naver.com','남자','010-2334-2200'),(52,'서장훈','seo564@naver.com','남자','010-3623-3364'),(53,'이수근','leee@naver.com','여자','010-3899-8322'),(54,'이성근','sung@naver.com','남자','010-8262-2888'),(55,'김성재','kimss@naver.com','남자','010-3521-7542'),(56,'이동건','dongdongs@naver.com','남자','010-9632-4232'),(57,'유지석','ssun@naver.com','남자','010-5432-2542'),(58,'유정원','one@naver.com','여자','010-4221-4367'),(59,'박혜원','parktwo@naver.com','여자','010-5436-7544'),(60,'송지원','songz@naver.com','여자','010-3212-6543'),(61,'최유진','jjin@naver.com','여자','010-6445-3345'),(62,'김영진','zero@naver.com','남자','010-4425-8646'),(63,'김민희','mhee@naver.com','여자','010-3865-6532'),(64,'김은영','kkkjjj@naver.com','여자','010-3343-6329'),(65,'최지원','jiwon@naver.com','여자','010-9422-0053'),(66,'최재영','young@naver.com','여자','010-4525-4532'),(67,'나정현','hhyun@naver.com','여자','010-3245-0373'),(68,'최민영','choimy@naver.com','여자','010-7462-9273'),(69,'정유라','yoo@naver.com','여자','010-5232-6543'),(70,'유혜진','yyy@naver.com','여자','010-8223-4628'),(71,'김민영','min@naver.com','여자','010-3828-4993'),(72,'김민수','minsoo@naver.com','남자','010-4829-9226'),(73,'이현수','sssu@naver.com','남자','010-3972-9727'),(74,'김민지','kkmj@naver.com','여자','010-5363-2345'),(75,'김지연','kim@naver.com','여자','010-5678-1234'),(76,'이성호','lee.sh@naver.com','남자','010-8765-4321'),(77,'장미영','rose@naver.com','여자','010-2345-6789'),(78,'송승현','songss@naver.com','남자','010-7890-1234'),(79,'한지수','hansoo@naver.com','여자','010-4321-5678'),(80,'오승민','ohoh@naver.com','남자','010-6543-7890'),(81,'하지연','hahajiji@naver.com','여자','010-1221-1234'),(82,'김승민','sosomanysungmin@naver.com','남자','010-0000-5678'),(83,'정유라','imura@naver.com','남자','010-1211-7890');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-20 11:28:08

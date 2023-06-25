-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: opd
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `categorieId` int NOT NULL AUTO_INCREMENT,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`categorieId`),
  FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'VEG PIZZA','A delight for veggie lovers! Choose from our wide range of delicious vegetarian pizzas, it\'s softer and tastier','2021-03-17 18:16:28'),(2,'NON-VEG PIZZA','Choose your favourite non-veg pizzas from the Domino\'s Pizza menu. Get fresh non-veg pizza with your choice of crusts & toppings','2021-03-17 18:17:14'),(3,'PIZZA MANIA','Indulge into mouth-watering taste of Pizza mania range, perfect answer to all your food cravings','2021-03-17 18:17:43'),(4,'SIDES ORDERS','Complement your pizza with wide range of sides available at Domino\'s Pizza India','2021-03-17 18:19:10'),(5,'BEVERAGES','Complement your pizza with wide range of beverages available at Domino\'s Pizza India','2021-03-17 21:58:58'),(6,'CHOICE OF CRUSTS','Fresh Pan Pizza Tastiest Pan Pizza. ... Domino\'s freshly made pan-baked pizza; deliciously soft ,buttery,extra cheesy and delightfully crunchy.','2021-03-18 07:55:28'),(7,'BURGER PIZZA','Domino’s Pizza Introducing all new Burger Pizza with the tag line looks like a burger, tastes like a pizza. Burger Pizza is burger sized but comes in a small pizza box. It is come with pizza toppings such as herbs, vegetables, tomato sauce and mozzarella,','2021-03-18 08:06:30'),(8,'CHOICE OF TOPPINGS','CHOICE OF TOPPINGS','2021-03-18 08:13:47');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `contactId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint NOT NULL,
  `orderId` int NOT NULL DEFAULT '0' COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`contactId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactreply`
--

DROP TABLE IF EXISTS `contactreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactreply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contactId` int NOT NULL,
  `userId` int NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactreply`
--

LOCK TABLES `contactreply` WRITE;
/*!40000 ALTER TABLE `contactreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverydetails`
--

DROP TABLE IF EXISTS `deliverydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverydetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint NOT NULL,
  `deliveryTime` int NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderId` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverydetails`
--

LOCK TABLES `deliverydetails` WRITE;
/*!40000 ALTER TABLE `deliverydetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliverydetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `pizzaId` int NOT NULL,
  `itemQuantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (1,1,15,1),(2,2,15,1),(3,2,14,1),(4,3,27,1),(5,4,23,1),(6,5,23,1),(7,6,31,1),(8,7,32,1),(9,8,23,1),(10,9,23,1),(11,10,23,1),(12,10,22,1),(13,11,15,1),(14,12,23,1),(15,13,23,1),(16,14,14,1),(17,15,3,1),(18,16,53,1),(19,16,39,1),(20,17,22,1),(21,18,14,1),(22,19,51,1),(23,19,50,1),(24,20,13,1),(25,21,13,1),(26,22,13,1),(27,23,13,1),(28,24,4,1),(29,25,22,1),(30,26,14,1),(31,27,14,1),(32,28,1,1),(33,29,1,1),(34,30,1,1),(35,31,48,1);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int NOT NULL,
  `phoneNo` bigint NOT NULL,
  `amount` int NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,'Kumaram village garividi mandal Vizianagaram district., ',123456,9441157596,249,'0','0','2023-06-25 16:21:28'),(2,5,'efp, jnkj',252654,1234567890,498,'0','0','2023-06-25 19:44:09'),(3,5,'rwfopie, oweifhi',123456,1234567890,149,'0','0','2023-06-25 19:51:15'),(4,5,'werthj, fghjklouoiy',123456,1234567890,99,'0','0','2023-06-25 19:53:17'),(5,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,1234567890,99,'0','0','2023-06-25 19:54:39'),(6,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,99,'0','0','2023-06-25 19:56:34'),(7,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,99,'0','0','2023-06-25 20:00:21'),(8,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,99,'0','0','2023-06-25 20:03:31'),(9,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,99,'0','0','2023-06-25 20:05:29'),(10,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,248,'0','0','2023-06-25 20:18:49'),(11,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,249,'0','0','2023-06-25 20:21:00'),(12,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,99,'0','0','2023-06-25 20:31:35'),(13,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,99,'0','0','2023-06-25 20:36:10'),(14,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,249,'0','0','2023-06-25 20:37:29'),(15,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,149,'0','0','2023-06-25 20:39:10'),(16,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,65,'0','0','2023-06-25 20:40:21'),(17,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,149,'0','0','2023-06-25 21:28:05'),(18,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,249,'0','0','2023-06-25 21:29:48'),(19,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,90,'0','0','2023-06-25 22:03:36'),(20,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,199,'0','0','2023-06-25 22:10:48'),(21,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,199,'0','0','2023-06-25 22:12:46'),(22,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,199,'0','0','2023-06-25 22:17:03'),(23,5,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,199,'0','0','2023-06-25 22:33:00'),(24,6,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',123456,9441157596,249,'0','0','2023-06-25 22:57:11'),(25,6,'Kumaram village garividi mandal Vizianagaram district., 1234567890[]',252654,9441157596,149,'0','0','2023-06-25 23:05:15'),(26,6,'Kumaram village garividi mandal Vizianagaram district., difgyer',123456,9441157596,249,'0','0','2023-06-25 23:30:12'),(27,6,'Kumaram village garividi mandal Vizianagaram district., difgyer',123456,9441157596,249,'0','0','2023-06-25 23:40:29'),(28,6,'Kumaram village garividi mandal Vizianagaram district., difgyer',123456,9441157596,99,'0','0','2023-06-25 23:41:10'),(29,6,'Kumaram village garividi mandal Vizianagaram district., difgyer',123456,9441157596,99,'0','0','2023-06-25 23:43:53'),(30,6,'Kumaram village garividi mandal Vizianagaram district., difgyer',123456,9441157596,99,'0','0','2023-06-25 23:45:45'),(31,6,'Kumaram village garividi mandal Vizianagaram district., difgyer',123456,9441157596,139,'0','0','2023-06-25 23:47:39');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza` (
  `pizzaId` int NOT NULL AUTO_INCREMENT,
  `pizzaName` varchar(255) NOT NULL,
  `pizzaPrice` int NOT NULL,
  `pizzaDesc` text NOT NULL,
  `pizzaCategorieId` int NOT NULL,
  `pizzaPubDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pizzaId`),
  FULLTEXT KEY `pizzaName` (`pizzaName`,`pizzaDesc`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (1,'Margherita',99,'A hugely popular margherita, with a deliciously tangy single cheese topping\r\n\r\n',1,'2021-03-17 21:03:26'),(2,'Double Cheese Margherita',199,'The ever-popular Margherita - loaded with extra cheese... oodies of it',1,'2021-03-17 21:20:58'),(3,'Farm House\r\n',149,'A pizza that goes ballistic on veggies! Check out this mouth watering overload of crunchy, crisp capsicum, succulent mushrooms and fresh tomatoes\r\n\r\n',1,'2021-03-17 21:22:07'),(4,'Peppy Paneer',249,'Chunky paneer with crisp capsicum and spicy red pepper - quite a mouthful!\r\n\r\n',1,'2021-03-17 21:23:05'),(5,'Mexican Green Wave\r\n',149,'A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes and jalapeno with a liberal sprinkling of exotic Mexican herbs.\r\n\r\n',1,'2021-03-17 21:23:48'),(6,'Deluxe Veggie\r\n',319,'For a vegetarian looking for a BIG treat that goes easy on the spices, this one\'s got it all.. The onions, the capsicum, those delectable mushrooms - with paneer and golden corn to top it all.\r\n\r\n',1,'2021-03-17 21:24:38'),(7,'Veg Extravaganza\r\n',299,'A pizza that decidedly staggers under an overload of golden corn, exotic black olives, crunchy onions, crisp capsicum, succulent mushrooms, juicyfresh tomatoes and jalapeno - with extra cheese to go all around.\r\n\r\n',1,'2021-03-17 21:25:42'),(8,'Cheese N Corn\r\n',199,'Cheese I Golden Corn',1,'2021-03-17 21:26:31'),(9,'PANEER MAKHANI\r\n',219,'Paneer and Capsicum on Makhani Sauce',1,'2021-03-17 21:27:21'),(10,'VEGGIE PARADISE\r\n',299,'Goldern Corn, Black Olives, Capsicum & Red Paprika\r\n\r\n',1,'2021-03-17 21:28:06'),(11,'FRESH VEGGIE',149,'Onion I Capsicum',1,'2021-03-17 21:28:49'),(12,'Indi Tandoori Paneer\r\n',349,'It is hot. It is spicy. It is oh-so-Indian. Tandoori paneer with capsicum I red paprika I mint mayo\r\n\r\n',1,'2021-03-17 21:29:41'),(13,'PEPPER BARBECUE CHICKEN',199,'Pepper Barbecue Chicken I Cheese',2,'2021-03-17 21:34:37'),(14,'CHICKEN SAUSAGE',249,'Chicken Sausage I Cheese',2,'2021-03-17 21:35:31'),(15,'Chicken Golden Delight\r\n',249,'Mmm! Barbeque chicken with a topping of golden corn loaded with extra cheese. Worth its weight in gold!\r\n\r\n',2,'2021-03-17 21:36:36'),(16,'Non Veg Supreme\r\n',399,'Bite into supreme delight of Black Olives, Onions, Grilled Mushrooms, Pepper BBQ Chicken, Peri-Peri Chicken, Grilled Chicken Rashers\r\n\r\n',2,'2021-03-17 21:37:21'),(17,'Chicken Dominator',319,'Treat your taste buds with Double Pepper Barbecue Chicken, Peri-Peri Chicken, Chicken Tikka & Grilled Chicken Rashers',2,'2021-03-17 21:38:13'),(18,'PEPPER BARBECUE & ONION\r\n',249,'Pepper Barbecue Chicken I Onion',2,'2021-03-17 21:39:49'),(19,'CHICKEN FIESTA',199,'Grilled Chicken Rashers I Peri-Peri Chicken I Onion I Capsicum',2,'2021-03-17 21:40:58'),(20,'Indi Chicken Tikka',349,'The wholesome flavour of tandoori masala with Chicken tikka I onion I red paprika I mint mayo',2,'2021-03-17 21:41:49'),(21,'TOMATO',99,'Juicy tomato in a flavourful combination with cheese I tangy sauce',3,'2021-03-17 21:44:44'),(22,'VEG LOADED',149,'Tomato | Grilled Mushroom |Jalapeno |Golden Corn | Beans in a fresh pan crust',3,'2021-03-17 21:45:34'),(23,'CHEESY',99,'Orange Cheddar Cheese I Mozzarella',3,'2021-03-17 21:46:21'),(24,'CAPSICUM',99,'Capsicum',3,'2021-03-17 21:47:07'),(25,'ONION',99,'onion',3,'2021-03-17 21:47:51'),(26,'GOLDEN CORN',139,'Golden Corn',3,'2021-03-17 21:48:44'),(27,'PANEER & ONION',149,'Creamy Paneer | Onion',3,'2021-03-17 21:49:36'),(28,'CHEESE N TOMATO',149,'A delectable combination of cheese and juicy tomato',3,'2021-03-17 21:50:20'),(29,'Garlic Breadsticks',99,'The endearing tang of garlic in breadstics baked to perfection.',4,'2021-03-17 22:01:33'),(30,'Stuffed Garlic Bread',99,'Freshly Baked Garlic Bread stuffed with mozzarella cheese, sweet corns & tangy and spicy jalapeños',4,'2021-03-17 22:02:50'),(31,'Veg Pasta Italiano White',99,'Penne Pasta tossed with extra virgin olive oil, exotic herbs & a generous helping of new flavoured sauce.',4,'2021-03-17 22:03:44'),(32,'Non Veg Pasta Italiano White',99,'Penne Pasta tossed with extra virgin olive oil, exotic herbs & a generous helping of new flavoured sauce.',4,'2021-03-17 22:05:08'),(33,'Cheese Jalapeno Dip',35,'A soft creamy cheese dip spiced with jalapeno.',4,'2021-03-17 22:06:06'),(34,'Cheese Dip',35,'A dreamy creamy cheese dip to add that extra tang to your snack.',4,'2021-03-17 22:06:59'),(35,'Lava Cake',99,'Filled with delecious molten chocolate inside.',4,'2021-03-17 22:08:13'),(36,'Butterscotch Mousse Cake',149,'A Creamy & Chocolaty indulgence with layers of rich, fluffy Butterscotch Cream and delicious Dark Chocolate Cake, topped with crunchy Dark Chocolate morsels - for a perfect dessert treat!',4,'2021-03-17 22:08:58'),(37,'Lipton Ice Tea',25,' 250ml',5,'2021-03-17 22:12:53'),(38,'Mirinda',35,'500ml',5,'2021-03-17 22:13:38'),(39,'PEPSI BLACK CAN',45,'PEPSI BLACK CAN',5,'2021-03-17 22:14:24'),(40,'Pepsi\r\n',52,'500ml',5,'2021-03-17 22:16:29'),(41,'7Up',52,'500ml',5,'2021-03-17 22:17:08'),(42,'Cheese Burst',249,'Crust with oodles of yummy liquid cheese filled inside.',6,'2021-03-18 07:57:27'),(43,'Classic Hand Tossed',249,'Dominos traditional hand stretched crust, crisp on outside, soft & light inside.',6,'2021-03-18 07:59:52'),(44,'Wheat Thin Crust',299,'Presenting the light healthier and delicious light wheat thin crust from Dominos.',6,'2021-03-18 08:00:39'),(45,'Fresh Pan Pizza',299,'Tastiest Pan Pizza.Ever.\r\nDomino’s freshly made pan-baked pizza; deliciously soft ,buttery,extra cheesy and delightfully crunchy.',6,'2021-03-18 08:01:29'),(46,'New Hand Tossed',299,'Classic Domino\'s crust. Fresh, hand stretched.',6,'2021-03-18 08:03:17'),(47,'BURGER PIZZA- CLASSIC VEG',129,'Bite into delight! Witness the epic combination of pizza and burger with our classic Burger Pizza, that looks good and tastes great!',7,'2021-03-18 08:09:17'),(48,'BURGER PIZZA- PREMIUM VEG',139,'The good just got better! Treat yourself to the premium taste of the Burger Pizza, that looks good and tastes great with paneer and red paprika.',7,'2021-03-18 08:09:59'),(49,'BURGER PIZZA- CLASSIC NON VEG',149,'For all the meat cravers, try the classic non-veg Burger Pizza loaded with the goodness of burger and the greatness of pizza.',7,'2021-03-18 08:10:37'),(50,'Extra Cheese',35,'Extra Cheese',8,'2021-03-18 08:14:52'),(51,'veg toppings',55,'Black Olives, Crisp Capsicum, Paneer, Mushroom, Golden Corn, Fresh Tomato, Jalapeno, Red Pepper & Babycorn.',8,'2021-03-18 08:15:36'),(52,'Non Veg Toppings',55,'Barbeque Chicken, Hot \'n\' Spicy Chicken,Chunky Chicken and Chicken Salami.',8,'2021-03-18 08:16:29'),(53,'Packaged Drinking Water',20,'Drinking Water	',5,'2021-03-18 08:20:40');
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitedetail`
--

DROP TABLE IF EXISTS `sitedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitedetail` (
  `tempId` int NOT NULL AUTO_INCREMENT,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint NOT NULL,
  `contact2` bigint DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tempId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitedetail`
--

LOCK TABLES `sitedetail` WRITE;
/*!40000 ALTER TABLE `sitedetail` DISABLE KEYS */;
INSERT INTO `sitedetail` VALUES (1,'admin','bhaskararao1212@gmail.com',2427183346,9441157596,'AZ Nagar Hyderabad','2023-06-25 12:03:25');
/*!40000 ALTER TABLE `sitedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewcart`
--

DROP TABLE IF EXISTS `viewcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viewcart` (
  `cartItemId` int NOT NULL AUTO_INCREMENT,
  `pizzaId` int NOT NULL,
  `itemQuantity` int NOT NULL,
  `userId` int NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cartItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewcart`
--

LOCK TABLES `viewcart` WRITE;
/*!40000 ALTER TABLE `viewcart` DISABLE KEYS */;
INSERT INTO `viewcart` VALUES (4,14,5,4,'2023-06-25 10:54:04');
/*!40000 ALTER TABLE `viewcart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-25 23:58:13

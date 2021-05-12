/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ gameshopdb /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE gameshopdb;

DROP TABLE IF EXISTS customers;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `email` varchar(60) NOT NULL,
  `house_number` int NOT NULL,
  `postcode` varchar(8) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS orders;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `date_placed` date NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS products;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO customers(customer_id,name,email,house_number,postcode) VALUES(1,'Jeff','jeff@song.com',13,'X52 8AQ'),(2,'Shelly','shelly@shelly.com',215,'27258'),(3,'Mark','mark@mark.com',215,'27258'),(4,'Jerry','jerry@jerry.com',209,'27258'),(5,'Linda','linda@linda.com',2145,'27253');

INSERT INTO orders(order_id,customer_id,product_id,date_placed,quantity) VALUES(1,1,1,'2020-03-23',10),(2,1,1,'2020-03-23',10),(3,1,1,'2020-03-23',10),(4,1,1,'2020-03-23',10),(5,1,1,'2020-03-23',10);
INSERT INTO products(product_id,title,price,stock) VALUES(1,'Sitar Hero',42.99,35),(2,'Call of Duty',50.99,50),(3,'Star Wars',45.99,30),(4,'PacMan',19.99,25),(5,'X-Wing Fighter',54.99,40);
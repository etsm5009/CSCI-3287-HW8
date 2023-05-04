CREATE TABLE `call_traffic` (
  `callID` int NOT NULL,
  `calldate` datetime DEFAULT NULL,
  `customerID` int NOT NULL,
  `duration_minutes` int DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `cost` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`callID`, `customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `call_traffic`(`callID`, `calldate`, `customerID`, `duration_minutes`, `type`, `cost`) values
(1, '2022-02-26 15:25:00', 3, 10, 'local', 0),
(2, '2022-02-27 08:57:00', 1, 4, 'national', 2),
(3, '2022-03-15 08:57:00', 4, 7, 'national', 3.5),
(4, '2022-03-16 13:00:00', 2, 8, 'international', 0),
(5, '2022-03-21 08:38:00', 4, 10, 'international', 10),
(6, '2022-03-26 15:25:00', 3, 10, 'local', 0),
(7, '2022-03-29 11:12:00', 2, 30, 'international', 0),
(8, '2022-04-02 09:40:00', 1, 10, 'national', 5),
(9, '2022-04-26 15:25:00', 3, 10, 'local', 0),
(10, '2022-05-07 16:10:00', 2, 23, 'international', 0),
(11, '2022-05-12 10:05:00', 4, 2, 'national', 1),
(12, '2022-05-26 15:25:00', 3, 10, 'local', 0),
(13, '2022-06-01 12:23:00', 1, 4, 'national', 2);

CREATE TABLE `cancellation` (
  `cancellationID` int NOT NULL,
  `cancellation_date` date DEFAULT NULL,
  `customerID` int DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cancellationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `cancellation`(`cancellationID`, `cancellation_date`, `customerID`, `reason`) values
(1, '2022-05-23', 3, 'I cannot call my dad 1 state away');

CREATE TABLE `customer` (
  `customerID` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `customerID_UNIQUE` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `customer`(`customerID`, `name`, `address`, `phone`, `email`, `birthdate`) values

(1, 'Bill', '145 Washington Ave', '555-555-5555', 'bill@gmail.com', '1999-08-04'), 
(2, 'Susanne', '683 17th St', '555-555-5556', 'susie123@gmail.com', '1985-06-21'), 
(3, 'Cameron', '1845 Pine Way', '555-555-5567', 'camstheman@gmail.com', '1969-12-14'),
(4, 'Murat', '9996 Arapahoe St', '555-555-5678', 'murat16@gmail.com', '2001-02-16');

CREATE TABLE `customer_plan` (
  `customerID` int NOT NULL,
  `planID` varchar(45) NOT NULL,
  PRIMARY KEY (`customerID`,`planID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `customer_plan`(`customerID`, `planID`) values
(3, 1),
(3, 3),
(1, 2),
(2, 4),
(4, 2);

CREATE TABLE `plan` (
  `planID` int NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `cost` decimal(9,2) DEFAULT NULL,
  `features` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`planID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `plan`(`planID`, `type`, `name`, `duration`, `cost`, `features`) values

(1, 'local', 'basic', '3 months', 7.89, 'unlimited local call and text'),
(2, 'national', 'standard', '2 month', 10.89, 'national call and unlimited text'),
(3, 'national', 'premium', '1 months', 15.89, 'unlimited national call and text'),
(4, 'international', 'mr. worldwide', '1 month', 20.89, 'unlimited international call or text');

CREATE TABLE `transaction` (
  `transactionID` int NOT NULL,
  `type` varchar(45) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(9,2) DEFAULT NULL,
  `customerID` int NOT NULL,
  `planID` int NOT NULL,
  PRIMARY KEY (`transactionID`,`customerID`,`planID`),
  UNIQUE KEY `transactionID_UNIQUE` (`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `transaction`(`transactionID`, `type`, `date`, `amount`, `customerID`, `planID`) values

(1, 'activation', '2022-02-24', 10.89, 1, 2),
(2, 'activation', '2022-02-26', 7.89, 3, 1),
(3, 'activation', '2022-03-02', 20.89, 2, 4),
(4, 'activation', '2022-03-15', 10.89, 4, 2),
(5, 'renewal', '2022-04-02', 20.89, 2, 4),
(6, 'renewal', '2022-04-24', 10.89, 1, 2),
(7, 'renewal', '2022-05-02', 20.89, 2, 4),
(8, 'upgrade', '2022-05-15', 15.89, 4, 3),
(9, 'cancellation', '2022-05-26', 0, 3, 2),
(10, 'activation', '2022-05-28', 15.89, 3, 3),
(11, 'renewal', '2022-06-02', 20.89, 2, 4),
(12, 'renewal', '2022-06-15', 15.89, 4, 3),
(13, 'renewal', '2022-06-24', 10.89, 1, 2),
(14, 'renewal', '2022-06-28', 15.89, 3, 3);
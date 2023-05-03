CREATE TABLE `call_traffic` (
  `callID` int NOT NULL,
  `calldate` datetime DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `cost` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`callID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cancellation` (
  `cancellationID` int NOT NULL,
  `cancellation_date` datetime DEFAULT NULL,
  `customerID` int DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cancellationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

CREATE TABLE `customer_plan` (
  `customerID` int NOT NULL,
  `planID` varchar(45) NOT NULL,
  PRIMARY KEY (`customerID`,`planID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `plan` (
  `planID` int NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `cost` decimal(9,2) DEFAULT NULL,
  `features` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`planID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

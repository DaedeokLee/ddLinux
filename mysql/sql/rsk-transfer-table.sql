CREATE TABLE `TRANSFER` (
  `blockNumber` int(11) NOT NULL,
  `blockHash` varchar(66) DEFAULT NULL,
  `transactionHash` varchar(66) DEFAULT NULL,
  `transactionIndex` int(11) DEFAULT NULL,
  `address` varchar(42) DEFAULT NULL,
  `id` varchar(50) DEFAULT NULL,
  `from` varchar(42) DEFAULT NULL,
  `to` varchar(42) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `signature` varchar(66) DEFAULT NULL,
  `raw_data` varchar(66) DEFAULT NULL,
  `raw_topics1` varchar(66) DEFAULT NULL,
  `raw_topics2` varchar(66) DEFAULT NULL,
  `raw_topics3` varchar(66) DEFAULT NULL,
  PRIMARY KEY (`blockNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

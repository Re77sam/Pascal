use wkdb;

CREATE TABLE `tbclientes` (
  `Codigo` int NOT NULL AUTO_INCREMENT COMMENT 'Codigo do cliente',
  `Nome` varchar(150) DEFAULT NULL COMMENT 'Nome do cliente',
  `Cidade` varchar(150) DEFAULT NULL COMMENT 'Cidade do cliente',
  `UF` char(2) DEFAULT NULL COMMENT 'UF do cliente',
  PRIMARY KEY (`Codigo`)
) 

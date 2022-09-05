use wkdb;

CREATE TABLE `tbprodutos` (
  `Codigo` int NOT NULL AUTO_INCREMENT COMMENT 'Codigo do produto',
  `Descricao` varchar(150) DEFAULT NULL COMMENT 'Descricao do produto',
  `PrecoVenda` decimal(10,2) DEFAULT NULL COMMENT 'Preco de venda do produto',
  PRIMARY KEY (`Codigo`)
) 

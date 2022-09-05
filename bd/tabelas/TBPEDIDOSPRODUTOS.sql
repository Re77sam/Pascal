CREATE TABLE `tbpedidosprodutos` (
  `Autoincrem` int(11) NOT NULL COMMENT 'Identificador do item do pedido',
  `NumeroPedido` int(11) NOT NULL COMMENT 'Numero do pedido',
  `CodigoProduto` int(11) DEFAULT NULL COMMENT 'Codigo do produto',
  `Quantidade` int(11) DEFAULT NULL COMMENT 'Quantidade do produto selecionado',
  `VlrUnitario` decimal(10,2) DEFAULT NULL COMMENT 'Valor unitario do produto',
  `VlrTotal` decimal(10,2) DEFAULT NULL COMMENT 'Valor total do produto',
  PRIMARY KEY (`NumeroPedido`),
  KEY `fk_tbpedidosprodutos_tbpedidosdadosgerais_idx` (`NumeroPedido`),
  KEY `fk_tbpedidosprodutos_tbprodutos_idx` (`CodigoProduto`),
  CONSTRAINT `fk_tbpedidosprodutos_tbpedidosdadosgerais` FOREIGN KEY (`NumeroPedido`) REFERENCES `tbpedidosdadosgerais` (`NumeroPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbpedidosprodutos_tbprodutos` FOREIGN KEY (`CodigoProduto`) REFERENCES `tbprodutos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

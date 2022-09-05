CREATE TABLE `tbpedidosdadosgerais` (
  `NumeroPedido` int(11) NOT NULL COMMENT 'Numero do pedido',
  `DataEmissao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data da emissao',
  `CodigoCliente` int(11) NOT NULL COMMENT 'Codigo do cliente',
  `ValorTotal` decimal(10,2) DEFAULT NULL COMMENT 'Valor total do pedido',
  PRIMARY KEY (`NumeroPedido`,`CodigoCliente`),
  KEY `fk_tbpedidosdadosgerais_tbclientes_idx` (`CodigoCliente`),
  CONSTRAINT `fk_tbpedidosdadosgerais_tbclientes` FOREIGN KEY (`CodigoCliente`) REFERENCES `tbclientes` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

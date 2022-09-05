USE wkdb;
DELIMITER $$
DROP PROCEDURE IF exists SP_InserirPedido $$
CREATE PROCEDURE SP_InserirPedido(
	in 	pNumeroPedido int, 		
        pCodigoCliente int,
        pValorTotal DECIMAL(10,2)
)
begin
	INSERT INTO tbpedidosdadosgerais (NumeroPedido, CodigoCliente, ValorTotal)
		Select 
			pNumeroPedido, 
            pCodigoCliente,
            pValorTotal;
end $$

DELIMITER ;

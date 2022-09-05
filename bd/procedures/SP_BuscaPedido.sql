USE wkdb;
DELIMITER $$
DROP PROCEDURE IF exists SP_BuscaPedido $$
CREATE PROCEDURE SP_BuscaPedido(in pNumeroPedido int)
begin
	SELECT * FROM tbpedidosdadosgerais
    WHERE 1 = 1
    AND NumeroPedido = pNumeroPedido
	LIMIT 1;
end $$

DELIMITER ;

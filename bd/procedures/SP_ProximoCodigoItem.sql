DELIMITER $$
DROP PROCEDURE IF exists SP_ProximoCodigoItem $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProximoCodigoItem`(in pNumeroPedido INT)
begin
    SELECT 
		MAX(Autoincrem) as ProximoCod
	FROM tbpedidosprodutos
    WHERE NumeroPedido = pNumeroPedido;    
end$$
DELIMITER ;

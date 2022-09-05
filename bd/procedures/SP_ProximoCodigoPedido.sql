DELIMITER $$
DROP PROCEDURE IF exists SP_ProximoCodigoPedido $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProximoCodigoPedido`()
begin
    SELECT 
		MAX(NumeroPedido) as ProximoCod
	FROM tbpedidosdadosgerais;
    
end$$
DELIMITER ;

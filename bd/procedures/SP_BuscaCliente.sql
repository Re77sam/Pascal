DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BuscaCliente`(in pCodigo int,pNome Varchar(150))
begin
	if pCodigo = 0 then
		set pCodigo = null;
	end if;
	if pNome = '' then
		set pNOME = null;
	end if;
	SELECT * FROM TBCLIENTES
    WHERE 1 = 1
    AND Codigo = ifnull(pCodigo,Codigo)
    AND Nome = ifnull(pNome,Nome)
	LIMIT 1;
end$$
DELIMITER ;

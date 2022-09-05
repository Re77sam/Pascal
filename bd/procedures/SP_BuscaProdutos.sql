USE wkdb;
DELIMITER $$
DROP PROCEDURE IF exists SP_BuscaProduto $$
CREATE PROCEDURE SP_BuscaProduto(in pCodigo int, pDescricao Varchar(150))
begin
	if pCodigo = 0 then
		set pCodigo = null;
	end if;
	if pDescricao = '' then
		set pDescricao = null;
	end if;
	SELECT * FROM tbprodutos
    WHERE 1 = 1
    AND Codigo = ifnull(pCodigo,Codigo)
    AND Descricao = ifnull(pDescricao,Descricao)
	LIMIT 1;
end $$

DELIMITER ;

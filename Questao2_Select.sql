SELECT 
vendedor_nome, venda_valor, venda_ano
FROM [RADIX].[dbo].[Vendedor] A
	INNER JOIN (
			SELECT  
			vendedor_id, 
			venda_valor,
			DATEPART(YEAR,venda_data) as venda_ano,
			ROW_NUMBER() OVER (PARTITION BY vendedor_id ORDER BY venda_valor DESC) AS idx_max
			FROM [RADIX].[dbo].[Venda]
			WHERE DATEPART(YEAR,venda_data) = 2016
			) B ON A.vendedor_id = B.vendedor_id
WHERE B.idx_max = 1
ORDER BY B.venda_valor DESC
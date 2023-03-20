tabelaa
INSERT INTO tabelab VALUES (2,'b') ;
INSERT INTO tabelab VALUES (3,'e');
INSERT INTO tabelab VALUES (4,'f');


SELECT a.nome
from tabelaa a,tabelab b
WHERE a.nome= b.nome;

SELECT a.nome
FROM tabelaa a INNER JOIN tabelab b
  ON a.nome = b.nome ;
  
SELECT a.nome 
FROM tabelaa a NATURAL JOIN tabelab b;

SELECT a.nome , b.nome
FROM tabelaa a LEFT JOIN tabelab b
 ON a.nome = b.nome;
  ##definições das expressoes
  ##'select' o que eu quero?
  ## 'from' de onde eu vou pegar?
  ## 'where' como(condição)
  SELECT a.nome , b.nome
FROM tabelaa a right JOIN tabelab b
 ON a.nome = b.nome
 
 union
 
 SELECT a.nome , b.nome
FROM tabelaa a right JOIN tabelab b
 ON a.nome = b.nome
 WHERE a.nome IS NULL ## ira mostrar só os valores nulo da tabela desejada 

 
  
  
  SELECT DESCRICAO,PRECODEVENDA
  FROM PRODUTO
  WHERE PRECODEVENDA >(SELECT AVG(PRECODEVENDA)
                      FROM produto)
  
  
  
  
  
  
  
  
  SELECT nome,salario
  FROM empregado
  where salario>= (SELECT MIN(salario)
                  FROM cargo)
                  
            AND salario<=(SELECT MAX(salario)
                          FROM cargo)
                                                    
                          
                          
                          
   /*todos os produto vendidos*/
   SELECT descricao, estoque
   FROM produto
   WHERE id in (SELECT idproduto
             FROM itemvenda)
   

/*SELECIONE O NOME DO CLIENTE E O NOME DE SEU REPRESENTANTE*/	
	SELECT b.nome,a.nome
	FROM  cliente a INNER join representante b
	ON b.id=a.id
	   
/*SELECIONE TODAS AS INFORMAÇOES DA ULTIMA VENDA*/
SELECT a.id,a.datemissao,b.nome,c.descricao 
FROM venda a,cliente b,formapagto c
WHERE a.idcliente=b.id
and a.idformapagto=c.id 
AND a.id =(select max(id)
           FROM venda)
           

           

/*SELECIONE AS VENDAS COM DATA DE EMISSAO MENOR QUE A MAIOR DATA DE EMISSAO*/
SELECT* 
FROM venda
WHERE datemissao <(select max(datemissao)  
           FROM venda)
/*outra forma de fazer*/

SELECT a.id,a.datemissao,b.nome,c.descricao 
FROM venda a,cliente b,formapagto c
WHERE a.idcliente=b.id
and a.idformapagto=c.id 
AND a.id <(select max(id)
           FROM venda)

/*exercicio4 */
SELECT a.id,b.nome,b.telefone,a.datemissao 
FROM venda a,cliente b
WHERE a.idcliente=b.id
AND a.datemissao = (select min(datemissao)
                    FROM venda)


           
           

           
           
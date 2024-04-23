CREATE TABLE tb_wine_reviews(
cod_wine SERIAL PRIMARY KEY,
country VARCHAR(100),
description VARCHAR(300),
points INT,
price REAL
);

SELECT * FROM tb_wine_reviews;

DROP TABLE tb_wine_reviews;


-- 2)
DO $$
DECLARE
v_country VARCHAR(100);
media_price NUMERIC;
BEGIN
	FOR v_country IN SELECT DISTINCT country FROM tb_wine_reviews LOOP
		SELECT AVG(price) INTO media_price FROM tb_wine_reviews WHERE country = v_country;
		RAISE NOTICE '% : Preço medio = %', v_country, media_price;
	END LOOP;
END $$	


--3)
DO $$
DECLARE
    wine_country VARCHAR(100);
    max_description TEXT;
    cur_wines CURSOR FOR
        SELECT DISTINCT country
        FROM tb_wine_reviews; 
BEGIN
    OPEN cur_wines;
    FETCH NEXT FROM cur_wines INTO wine_country;
    WHILE FOUND LOOP
        SELECT description INTO max_description
        FROM tb_wine_reviews
        WHERE country = wine_country
        ORDER BY LENGTH(description) DESC
        LIMIT 1;

        RAISE NOTICE 'País - % | Descrição mais longa = %', wine_country, max_description;
		
        FETCH NEXT FROM cur_wines INTO wine_country;
    END LOOP;	
   CLOSE cur_wines;
END $$;


-- 4)
CREATE TABLE tb_cursores(
id SERIAL PRIMARY KEY,
nome_pais VARCHAR(100),
preco_medio REAL,
descricao_mais_longa VARCHAR(300)
);


-- 5)


-- 6)



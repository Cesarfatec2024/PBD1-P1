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
CREATE TABLE tb_wine_reviews(
cod_wine SERIAL PRIMARY KEY,
country VARCHAR(100),
description VARCHAR(300),
points INT,
price REAL
);

SELECT * FROM tb_wine_reviews;

DROP TABLE tb_wine_reviews;

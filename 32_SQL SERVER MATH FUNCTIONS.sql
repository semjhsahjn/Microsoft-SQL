CREATE DATABASE SQLServerMathFunctions;
USE SQLServerMathFunctions;

-- ABS() - Mutlak değer
-- Bir sayının mutlak (pozitif) değerini döndürür
SELECT ABS(-25.7);

-- CEILING() - Yukarı yuvarlama
-- Sayıyı bir üst tam sayıya yuvarlar
SELECT CEILING(3.9);

-- FLOOR() - Aşağı yuvarlama
-- Sayıyı bir alt tam sayıya yuvarlar
SELECT FLOOR(15.9);

-- ROUND (Yuvarlama - En Yakına)
SELECT ROUND(3.9,0);

-- POWER() - Üs alma
-- Bir sayının üssünü alır (x^y)
SELECT POWER(2,3);

-- SQRT() - Karekök
-- Bir sayının karekökünü alır
SELECT SQRT(81);

-- SQUARE() - Kare alma
-- Bir sayının karesini alır
SELECT SQUARE(10);

-- PI() - Pi sayısı
-- Pi sayısını (3.14159...) döndürür
SELECT PI();

-- SIGN() - İşaret belirleme
-- Sayının işaretini döndürür (-1, 0, veya 1)
SELECT SIGN(-10);
SELECT SIGN(0);
SELECT SIGN(10);

-- RAND() - Rastgele sayı
-- 0 ile 1 arasında rastgele ondalık sayı üretir
SELECT RAND();

-- % (Modulo) - Kalan bulma
--  Bölme işleminden kalanı döndürür
SELECT 19 % 2;

-- GREATEST(x, y, z) 
-- Verilen sayılar içinden en büyüğünü seçer.
SELECT GREATEST(1,2,3,4,5);

-- LEAST(x, y, z) 
-- Verilen sayılar içinden en küçüğünü seçer.
SELECT LEAST(1,2,3,4,5);


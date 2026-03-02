CREATE DATABASE SQLServerAdvancedFunctions;
USE SQLServerAdvancedFunctions;

-- CAST() - Tip dönüştürme
-- Bir değeri belirtilen veri tipine dönüştürür
SELECT CAST(123.45 AS INT);

-- COALESCE() - İlk NULL olmayan değer
-- Listedeki ilk NULL olmayan değeri döndürür
SELECT COALESCE(NULL,NULL,'Merhaba','Dunya');

-- ISNULL() - NULL kontrolü ve değiştirme
--  NULL ise belirtilen değeri, değilse orijinal değeri döndürür
SELECT ISNULL(NULL,'Varsayılan');

-- NULLIF() - Eşitse NULL döndür
-- İki değer eşitse NULL, değilse ilk değeri döndürür
SELECT NULLIF(10, 10)  -- Sonuç: NULL

-- IIF() - Koşullu değer döndürme
--  Koşul doğruysa bir değer, yanlışsa başka değer döndürür
SELECT IIF(2>1,'True','False'); -- True
SELECT IIF(2<1,'True','False'); -- False

-- ISNUMERIC() - Sayısal değer kontrolü
--  İfadenin sayısal olup olmadığını test eder (1 veya 0)
SELECT ISNUMERIC('123'); -- 1
SELECT ISNUMERIC('A1A'); -- 0

-- CURRENT_USER - Şu anki kullanıcı
-- SQL Server'daki mevcut kullanıcı adını döndürür
SELECT CURRENT_USER;

-- SYSTEM_USER - Sistem giriş adı
-- Mevcut kullanıcının login adını döndürür
SELECT SYSTEM_USER;



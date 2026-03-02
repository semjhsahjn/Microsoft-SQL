CREATE DATABASE SQLServerDateFunctions;
USE SQLServerDateFunctions;

-- GETDATE() - Şu anki tarih/saat
-- Sunucunun şu anki tarih ve saatini döndürür
SELECT GETDATE();

-- DATEADD() - Tarih ekleme
-- Tarihe belirtilen süreyi ekler
SELECT DATEADD(DAY,7,GETDATE()); -- 7 gün sonrası
SELECT DATEADD(MONTH,2,GETDATE()); -- 2 ay sonrası
SELECT DATEADD(YEAR,1,GETDATE()); -- 1 yil sonrası

-- DATEDIFF() - Tarih farkı
-- İki tarih arasındaki farkı hesaplar
SELECT DATEDIFF(DAY,'2026-03-01','2026-03-10');

-- YEAR() - Yıl alma
-- Tarihten yıl değerini döndürür
SELECT YEAR(GETDATE());

-- MONTH() - Ay alma
-- Tarihten ay değerini döndürür
SELECT MONTH(GETDATE());

-- DAY() - Gün alma
-- Tarihten gün değerini döndürür
SELECT DAY(GETDATE());

-- DATEPART() - Tarih parçası alma
-- Tarihin belirtilen bölümünü döndürür
SELECT DATEPART(HOUR,GETDATE());

-- DATENAME() - Tarih adı alma
-- Tarihin belirtilen bölümünün adını döndürür
SELECT DATENAME(WEEKDAY,GETDATE());

-- ISDATE() - Tarih kontrolü
-- Değerin geçerli tarih olup olmadığını kontrol eder
SELECT ISDATE('2026-03-02'); -- 1
SELECT ISDATE('2026-03-99'); -- 0



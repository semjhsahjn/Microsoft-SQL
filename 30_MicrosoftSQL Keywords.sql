/*
Microsoft SQL Keywords

SELECT -> Veritabanından veri çeker
INSERT INTO -> Tabloya yeni veri ekler
UPDATE -> Var olan veriyi günceller
DELETE -> Tablodan veri siler
TRUNCATE TABLE -> Tablodaki tüm verileri hızlıca siler (geri alınmaz)
CREATE -> Yeni nesne oluşturur (TABLE,VIEW,PROCEDURE,DATABASE vb.)
CREATE TABLE -> Yeni tablo oluşturur
CREATE DATABASE -> Yeni veritabanı oluşturur
CREATE VIEW -> Yeni view oluşturur
CREATE PROCEDURE -> Stored Procedure oluşturur
CREATE INDEX -> Index oluşturur
ALTER -> Var olan nesneyi değiştirir
ALTER TABLE -> Tablonun yapısını değiştirir
DROP -> Bir nesneyi tamamen siler
DROP TABLE -> Tabloyu siler
DROP DATABASE -> Veritabanı siler
DROP VIEW -> View siler
PRIMARY KEY -> Her kaydı benzersiz ve not null yapan anahtar
FOREIGN KEY -> İki tablo arasında ilişki kurar
UNIQUE -> Sütundaki tüm değerlerin benzersiz olmasını sağlar
NOT NULL -> Sütuna boş değer girmesini engeller
CHECK -> Belirli bir şart koyar
DEFAULT -> Varsayılan değer atar
CONSTRAINT -> Kısıtlamaya isim vermeyi sağlar
WHERE -> Filtreleme yapar
AND -> İki şartı da doğru olmalı
OR -> Şartlardan biri doğru olmalı
NOT -> Şartın tersini alır
BETWEEN -> Belirli aralıkta değer seçer
IN -> Birden fazla değer kontrol eder
EXISTS -> Alt sorguda kayıt varmı kontrol eder
LIKE -> Desene göre arama yapar
IS NULL -> Boş değer kontrolü yapar
IS NOT NULL -> Boş olmayanları getirir
ORDER BY -> Sonucu sıralar
ASC -> Artan Sıralama (Default)
DESC -> Azalan Sıralama
GROUP BY -> Gruplama yapar
HAVING -> Gruplanmış veriyi filtreler
DISTINCT -> Tekrarsız veri getirir
TOP -> Belirli sayıda kayıt getirir
INNER JOIN -> İki tabloda eşleşen kayıtları getirir
LEFT JOIN -> Sol dairenin tamamı + sağdaki ortaklar.
RIGHT JOIN -> Sağ dairenin tamamı + soldaki ortaklar.
FULL JOIN -> Her iki tablonun tamamını getirir
AS -> Takma ad verir
EXEC -> Stored Procedure çalıştırır
SET -> Değer atar veya ayar yapar
VALUES -> INSERT sırasında veri belirtir
UNION -> İki SELECT sorgusunu birleştirir
UNION ALL -> İki SELECT sorgusunu birleştirir (Tekrarlı olabilir)
BACKUP DATABASE -> Veritabanı yedeği alır
IDENTITY -> Otomatik artan sütun oluşturur
GO -> Batch ayırıcıdır (SSMS)'de kullanılır.
COALESCE(d1,d2,dn) -> Parametrede verilen sütunlardan boş olmayan ilk değeri döndürür
OFFSET -> belirttiğin sayı kadar satırı atlamanı sağlar.
FETCH -> OFFSET ile belirli bir miktar satırı atladıktan sonra, oradan itibaren kaç tane satırı almak istediğini söyler.
REGEXP_LIKE() -> LIKE komutunun çok daha güçlü ve detaylı versiyonudur.
*/
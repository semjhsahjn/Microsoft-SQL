/*
ANY (Herhangi biri)
ANY operatörü, bir değeri bir listedeki sonuçlarla karşılaştırırken,
"En az bir tanesi bile şartı sağlıyorsa kabul et" mantığıyla çalışır.
*/

-- 1. Tablo: Ürünler
CREATE TABLE Urunler (
    UrunID INT,
    UrunAdi VARCHAR(50),
    Fiyat DECIMAL(10,2)
);

-- 2. Tablo: Sipariş Detayları (Hangi üründen kaç adet satılmış)
CREATE TABLE SiparisDetay (
    SiparisID INT,
    UrunID INT,
    Adet INT
);

-- Verileri Ekleyelim
INSERT INTO Urunler VALUES (1, 'Laptop', 15000), (2, 'Telefon', 8000), (3, 'Mouse', 500);
INSERT INTO SiparisDetay VALUES (101, 1, 5), (102, 2, 12), (103, 3, 2);



-- UrunID si Adetlerden herhangi birinden büyükse o satırın bilgilerini getir
SELECT *
FROM dbo.Urunler
WHERE UrunID > ANY(SELECT Adet FROM dbo.SiparisDetay);


/*
ALL operatörü, bir değeri bir listedeki (alt sorgudan gelen) tüm sonuçlarla
karşılaştırırken kullanılır. Adından da anlaşılacağı üzere,
şartın geçerli olması için karşılaştırdığın değerin
listedeki İSTİSNASIZ HERKESİ geçmesi veya şartı sağlaması gerekir.
*/



-- UrunID si Bütün Adet Sayılarından Küçük Olan satırı getir
SELECT *
FROM dbo.Urunler
WHERE UrunID < ALL(SELECT Adet FROM dbo.SiparisDetay);

CREATE DATABASE INDEXsection;
USE INDEXsection;

/*
SQL'de INDEX (Dizin) Nedir?
Bir veritabanında binlerce değil, milyonlarca satır veri olduğunu hayal edin.
Aradığınız tek bir satırı bulmak için bilgisayarın tüm tabloyu baştan sona okuması çok uzun sürer.
İşte Index, bu arama sürecini saniyelere indiren sihirli bir araçtır.

Sorgu Hızı (Performans):
SELECT sorgularınızın (özellikle WHERE şartı içerenlerin) ışık hızında çalışmasını sağlar.

Sistem Yükünü Azaltmak:
Bilgisayarın işlemcisi (CPU) tüm tabloyu taramak yerine sadece Index'e bakar, böylece yorulmaz.
*/

/*
"Bir veritabanı tablosunu, milyonlarca rastgele sayfadan oluşan devasa bir kitap yığını olarak hayal edin.
Index, bu yığının en başına eklenen akıllı bir **'Adres Defteri'**dir.
Siz bir veriyi aradığınızda,
SQL Server milyonlarca sayfayı tek tek çevirip okumak yerine (buna Table Scan denir),
önce bu küçük ve sıralı adres defterine bakar.
Aradığınız bilginin hangi sayfa ve hangi satırda olduğunu oradan anında bulur
ve doğrudan o noktaya gider (buna Index Seek denir).
Sonuç olarak Index; veriyi fiziksel olarak kopyalamaz,
sadece verilerin nerede olduğunu sıralı bir liste halinde tutarak,
bilgisayarın saniyelerce sürecek 'arama' yorgunluğunu mikrosaniyelere indirir."
*/

-- Örnek tablo oluşturalım
CREATE TABLE BuyukTablo (
    ID INT IDENTITY(1,1),
    Ad VARCHAR(50),
    Sayi INT,
    Tarih DATETIME
);

-- 2 Milyon Veri Ekleme
INSERT INTO BuyukTablo (Ad, Sayi, Tarih)
SELECT TOP 2000000
    'Kisi_' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR(10)),
    ABS(CHECKSUM(NEWID())) % 1000,
    DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 365, GETDATE())
FROM sys.all_objects a
CROSS JOIN sys.all_objects b;

SELECT * FROM dbo.BuyukTablo;


-- Aşağıda SELECT sorgusunun Ram üzerinde ne kadarlık bir okuma gerçekleştirdiğine bakmak için
-- IO (disk ve bellek kullanımı)
SET STATISTICS IO ON
SELECT * FROM dbo.BuyukTablo
WHERE Ad = 'Kisi_6464';

-- logical reads 10014 -> Yukarıdaki sorgu için 10014 adet page (1 page = 8kilobayt) okudu).

SELECT (10014*8)/1024 
-- 78 Megabayt lık bir okuma gerçekleştirdi.
GO
SP_SPACEUSED BuyukTablo -- reserved sütununda tablonun boyutunu gösterir
SELECT 80136/1024; -- Tablonun kendisi zaten 78 Megabayt değerinde olduğunu göreceksiniz.

-- Bu ne demek ?
-- Yani olayın aslı şu , 53,54 Satırında Yazdığımız 1 SELECT sorgusu için TABLONUN TAMAMINI OKUDU.
-- Tablonun Daha Çok Verilerle Tutulacağını Düşünürsek ....

-- 53 VE 54 NUMARALI SORGUYU SEÇİP (CTRL L) yaptığınızda tarama yöntemini göreceksiniz.
-- Bizim Olusturdugumuz tabloda PRIMARY KEY OLMADIGI İÇİN (TABLE SCAN) ile taradı.
-- PRIMARY KEY OLSAYDI (CLUSTERED INDEX SCAN)


-- 1-) TABLE SCAN -> 
-- SQL Server, tabloyu başından sonuna kadar tarar.
-- Sorguda aradığın veri nerede olursa TABLOYU TAMAMEN okur.
-- Büyük tabloda çok yavaş olabilir.

-- 2-) CLUSTERED INDEX SCAN ->
-- Clustered Index = tablo fiziksel olarak sıralı (ID gibi)
-- SQL Server, index sırasını kullanarak tarar
-- Gerekirse Table Scan gibi tüm indexi okur, ama çoğu zaman arama daha hızlıdır.

-- Biz Ad Sütununa göre Sorguladık dolayısıyla hepsine teker teker bakıyor.

-- 1 Tabloda 1 tane (Clustered INDEX) olabilir. 
-- AMMA (NON Clustered INDEX) 1'den fazla olabilir.

-- Biz neyi arıyoruz (Ad) sütununu Ozaman Biz bu (Ad) sütununa (NON-CLUSTERED INDEX) koyarsak daha hızlı getirebilirmiyiz?
-- Evet getiririz.

/*
Eğer SQL Server'da sadece CREATE INDEX yazarsan,
SQL bunu otomatik olarak Non-Clustered Index (Kümelenmemiş İndeks) olarak kabul eder
ve o şekilde oluşturur.
*/
-- Kodun yapısı: CREATE INDEX [Index_Adı] ON [Tablo_Adı] ([Sütun_Adı])

-- Bu örneği tekrar Ad Sütununda Deneyelim

SET STATISTICS IO ON
SELECT * FROM dbo.BuyukTablo
WHERE Ad = 'Kisi_6464';
--logical reads 10052

-- NON-CLUSTERED INDEX SCAN işlemi
CREATE INDEX IX_Adsutunu
ON dbo.BuyukTablo (Ad);

-- Tekrar Deneyelim
SET STATISTICS IO ON
SELECT * FROM dbo.BuyukTablo
WHERE Ad = 'Kisi_6464';
-- logical reads 4

SELECT 10014/4; -- Sistem Tam Olarak 2503 Kat Daha Hızlı Çalıştı.!


/*
GENEL NOT:
NOT:
- Logical Reads’in azalması = sorgunun daha az veri okuması = daha hızlı çalışması demektir.
- INT gibi küçük, ardışık değerlerde index farkı düşük olabilir.
- VARCHAR veya UNIQUE değerlerde index farkı dramatik olur.
- Clustered Index: tablo fiziksel olarak sıralanır (1 adet). Primary Key genelde Clustered Index oluşturur.
- Non-Clustered Index: tabloyu değiştirmez, arama listesini oluşturur (1 tablodan birden fazla olabilir).
*/







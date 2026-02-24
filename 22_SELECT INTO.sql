/*
SELECT INTO, SQL dünyasının "Hızlı Kopyala-Yapıştır" aracıdır.
Bir tablodaki verileri seçer ve bu verilerle yepyeni bir tablo oluşturup içine yapıştırır.

Normalde bir tablo oluşturmak için önce CREATE TABLE ile kolonları tanımlarız,
sonra INSERT INTO ile verileri ekleriz. SELECT INTO ise bu iki adımı tek satırda halleder.
*/

/* Syntax
(Tüm Tabloyu Kopyalar)

SELECT * INTO Yeni_Tablo_Adi
FROM Kaynak_Tablo_Adi;

(Belirli Sütunları Kopyalar)
SELECT Sutun1, Sutun2, Sutun3
INTO Yeni_Tablo_Adi
FROM Kaynak_Tablo_Adi;

(Belirli Satırları Kopyalar)
SELECT * INTO Yeni_Tablo_Adi
FROM Kaynak_Tablo_Adi
WHERE Sütun_Adi = 'Şart';
*/

/* Syntax
(Yapı Kopyalama)
Bazen sadece tablonun iskeletini (kolon isimlerini ve veri tiplerini)
kopyalamak istersin ama içindeki verileri istemezsin.

SELECT * INTO Bos_Yeni_Tablo
FROM Mevcut_Tablo
WHERE 1 = 0; -- 1 hiçbir zaman 0'a eşit olmayacağı için hiçbir veri kopyalanmaz.
*/


--Önce kopyalayacağımız orijinal verileri oluşturalım.

-- Ana tablomuzu oluşturuyoruz
CREATE TABLE Personel_Merkez (
    ID INT,
    Ad VARCHAR(50),
    Departman VARCHAR(50),
    Maas INT,
    Sehir VARCHAR(20)
);

-- İçine 5 tane örnek veri atıyoruz
INSERT INTO Personel_Merkez VALUES 
(1, 'Ahmet', 'Yazılım', 45000, 'İstanbul'),
(2, 'Ayşe', 'Pazarlama', 38000, 'Ankara'),
(3, 'Mehmet', 'Yazılım', 50000, 'İzmir'),
(4, 'Canan', 'İK', 35000, 'İstanbul'),
(5, 'Selim', 'Pazarlama', 42000, 'Bursa');



-- 1-> Personel_Merkez isimli tabloyu birebir aynı veriler ve yapısıyla Personel_Yedek isimli tablo oluştur
SELECT * FROM dbo.Personel_Merkez; -- Kopyasını alacagımız tablo

SELECT * INTO Personel_Yedek
FROM dbo.Personel_Merkez;

SELECT * FROM dbo.Personel_Yedek; -- Personel_Merkezi 'den kopyaladıgımız tablo


-- 2-> Personel_Merkez isimli tablodan sadece Ad,Maas Sütünlarını alarak Personel_Ad_Maas isimli tablo olştur.

SELECT Ad,Maas INTO Personel_Ad_Maas
FROM dbo.Personel_Merkez;

SELECT * FROM dbo.Personel_Ad_Maas;



-- 3-> Filtreli Kopyalama (Özel Liste) 
-- Personel_Merkez isimli tablodan sadece 'Yazılım' departmanında çalışanları
-- Yazilim_Ekibi isimli yeni bir tablo oluştur.

SELECT * INTO Yazilim_Ekibi
FROM dbo.Personel_Merkez
WHERE dbo.Personel_Merkez.Departman = 'Yazılım';

SELECT * FROM dbo.Yazilim_Ekibi;


-- 4-> Sadece Yapıyı Kopyalama
-- Bana Personel_Merkez ile aynı sütunlara sahip ama
-- içi bomboş olan Yeni_Personel_Taslak adında bir tablo oluştur

SELECT * INTO Yeni_Personel_Taslak
FROM dbo.Personel_Merkez
WHERE 1 = 0;
-- Kontrol: SELECT * FROM Yeni_Personel_Taslak; (Hiç veri göremeyeceksin)
SELECT * FROM dbo.Yeni_Personel_Taslak;


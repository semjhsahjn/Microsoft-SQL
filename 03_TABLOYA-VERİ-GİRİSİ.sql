-- TABLOYA VERI GIRISI - INSERT

-- Kitaplar tablosunu goruntuleyin
SELECT * FROM dbo.kitaplar;


/*  
========================  ORNEK  ========================
 Kitaplar tablosuna 1, 'Savaş ve Barış’, 'Lev Tolstoy’, 1869, 'Tarihi’  degerleri ile bir kayit ekleyin
=========================================================
 */

 INSERT INTO dbo.kitaplar
 VALUES (1,'Savaş ve Barış','Lev Tolstoy',1869,'Tarihi');



 
/*  
========================  ORNEK  ========================
 Kitaplar tablosuna 11, ‘Araba Sevdasi’  degerleri ile bir kayit ekleyin
=========================================================
 */

 INSERT INTO dbo.kitaplar (kitap_id,kitap_adi)
 VALUES (11,'Araba Sevdasi');

 SELECT * FROM dbo.kitaplar;

 /*  
========================  ORNEK  ========================
 İçerisinde id, isim, not_ortalamasi, adres ve last_modification (tarih) sütunları olan 
 bir öğrenciler tablosu oluşturun. 
=========================================================
 */
 
 CREATE TABLE ogrenciler (
    id INT,
    isim VARCHAR(50),
    not_ortalamasi INT,
    adres VARCHAR(100),
    last_modification DATE
 );





 SELECT * FROM dbo.ogrenciler;
 /*  
========================  ORNEK  ========================
Ogrenciler tablosundaki tum sutunlara 
123456789, 'Ali Can', 11, 'Istanbul,bakirkoy', '2020-10-14'  
değerlerini girerek bir ogrenci ekleyin. 
=========================================================
 */

 INSERT INTO dbo.ogrenciler 
 VALUES (123456789, 'Ali Can', 11, 'Istanbul,bakirkoy', '2020-10-14');


 /*  
========================  ORNEK  ========================
Ogrenciler tablosuna sadece id ve isim değeri olarak
234565678, ‘Veli Cem' 
bilgilerine sahip bir ogrenci ekleyin. 
=========================================================
 */

 INSERT INTO dbo.ogrenciler (id,isim)
 VALUES (234565678, 'Veli Cem');

 /*  
========================  ORNEK  ========================
 Kitaplar tablosuna null deger olmadan coklu veri girisi saglayiniz.
 NOT : Kitaplar tablosu daha önce oluşturulduğu için, yeni kayıt eklemeden önce, 
       tablonun ve sütunların son durumunu kontrol etmek gerekir.
=========================================================
 */

 INSERT INTO kitaplar
VALUES
(2,'Suç ve Ceza','Fyodor Dostoyevski',1866,'Psikolojik'),
(3,'Anna Karenina','Lev Tolstoy',1877,'Aşk'),
(4,'1984','George Orwell',1949,'Politik'),
(5,'Büyük Umutlar','Charles Dickens',1861,'Dram'),
(6,'Don Kişot','Miguel de Cervantes',1605,'Macera'),
(7,'Gurur ve Önyargi','Jane Austen',1813,'Dram'),
(8,'Monte Kristo Kontu','Alexandre Dumas',1844,'Macera'),
(9,'Faust','Johann Wolfgang',1808,'Felsefi'),
(10,'Ulysses','James Joyce',1922,'Modernist');





 /*  
========================  ORNEK  ========================
 Personel tablosuna null deger olmadan coklu veri girisi saglayiniz.
=========================================================
 */

 INSERT INTO personel
VALUES
(1,'Ahmet','CELİK','1988-10-06','Muhasebeci',45000),
(2,'Ayse','DEMİR','1988-12-06','Mudur',55000);


 TRUNCATE TABLE personel;  /*personel tablosundaki butun satilari (kayitlari) siler.*/

 /*  
========================  ORNEK  ========================
 İçerisinde urun id, müşteri isim ve urun isim sütunları olan bir müşteriler tablosu oluşturun. 
=========================================================
 */

 CREATE TABLE musteriler(
    urun_id INT ,
    musteri_isim VARCHAR(40),
    urun_isim VARCHAR(40)
 );



 -- musteriler tablosundaki tum datalari goruntuleyin

 SELECT * FROM dbo.musteriler;


 -- Müşteriler tablosuna null değer olmadan çoklu veri girişi yapin.

 INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');


 /*  
========================  ORNEK  ========================
 İçerisinde ulke_adi, ulke_adi_uzun_yazilis, ISO_Kodu, ulke_kodu, baskent_turkce 
 ve baskent_ingilizce sutunlari olan bir ulkeler tablosu oluşturun. 
=========================================================
 */

 CREATE TABLE ulkeler(
    ulke_adi VARCHAR(50),
    ulke_adi_uzun_yazilis VARCHAR(50),
    ISO_Kodu CHAR(3),
    ulke_kodu CHAR(2),
    baskent_turkce VARCHAR(50),
    baskent_ingilizce VARCHAR(50)
 );


 insert into ulkeler values('Afganistan', 'Afganistan İslam Cumhuriyeti', 'AFG', 'AF', 'Kâbil', 'Kabul');
insert into ulkeler values('Almanya', 'Almanya Federal Cumhuriyeti', 'DEU', 'DE', 'Berlin', 'Berlin');
insert into ulkeler values('Andora', 'Andora Prensliği', 'AND', 'AD', 'Andora La Vella', 'Andorra la Vella');
insert into ulkeler values('Arjantin', 'Arjantin Cumhuriyeti', 'ARC', 'AR', 'Buenos Aires', 'Buenos Aires');
insert into ulkeler values('Arnavutluk', 'Arnavutluk Cumhuriyeti', 'ALB', 'AL', 'Tiran', 'Tiran');
insert into ulkeler values('Azerbaycan', 'Azerbaycan Cumhuriyeti', 'AZE', 'AZ', 'Bakü', 'Baku');
insert into ulkeler values('Bahama Adaları', 'Bahama Milletler Topluluğu', 'BHS', 'BS', 'Nassau', 'Nassau');
insert into ulkeler values('Bahreyn', 'Bahreyn Krallığı', 'BHR', 'BH', 'Manama', 'Manama');
insert into ulkeler values('Bangladeş', 'Bangladeş Halk Cumhuriyeti', 'BGD', 'BD', 'Dakka', 'Dhaka');
insert into ulkeler values('Belçika', 'Belçika Krallığı', 'BEL', 'BE', 'Brüksel', 'Brussels');






 -- ulke adi ve ulke kodu sutunlarini listeleyin

 SELECT ulke_adi , ulke_kodu FROM dbo.ulkeler;
  SELECT * FROM dbo.ulkeler;


 -- ulke baskent isimlerini turkce ve ingilizce olarak listeleyin

 SELECT baskent_turkce , baskent_ingilizce FROM dbo.ulkeler;



 /*  
========================  ORNEK  ========================
 Icerisinde ulke_adi, baskent_turkce ve baskent_nufusu sütunları olan bir başkentler tablosu oluşturun.
=========================================================
 */
    
 CREATE TABLE baskentler(
    ulke_adi VARCHAR(50),
    baskent_turkce VARCHAR(50),
    baskent_nufusu INT);





  -- tum tabloyu goruntuleyin

  SELECT * FROM dbo.baskentler;





   /*  
========================  ORNEK  ========================
 baskentler tablosuna null deger olmadan coklu veri girisi saglayiniz.
=========================================================
 */

 insert into baskentler values('Afganistan', 'Kâbil', '3140853');
insert into baskentler values('Almanya', 'Berlin', '3520000');
insert into baskentler values('Andora', 'Andora La Vella', '22884');
insert into baskentler values('Arjantin', 'Buenos Aires', '2891082');
insert into baskentler values('Arnavutluk', 'Tiran', '763634');
insert into baskentler values('Azerbaycan', 'Bakü', '2204200');
insert into baskentler values('Bahama Adaları', 'Nassau', '248948');
insert into baskentler values('Bahreyn', 'Manama', '140616');
insert into baskentler values('Bangladeş', 'Dakka', '8906000');
insert into baskentler values('Belçika', 'Brüksel', '1080790');

SELECT * FROM dbo.baskentler;
/*
 ===============================================
           WHERE ile Filtreleme
 ===============================================
 */

  /*  
========================  ORNEK  ========================
kitaplar tablosunda Lev Tolstoy'a ait kitapların ismini, yayın tarihini ve kategorisini listeleyin
=========================================================
 */

 SELECT kitap_adi,yayin_yili,kategori FROM dbo.kitaplar
 WHERE yazar_adi = 'Lev Tolstoy';

 /*  
========================  ORNEK  ========================
kitaplar tablosunda turu macera olan kitapların kitap ve yazar adlarını listeleyin
=========================================================
 */

 SELECT kitap_adi , yazar_adi FROM dbo.kitaplar
 WHERE kategori = 'macera';


 /*  
========================  ORNEK  ========================
İçinde id, isim, soy isim, yas, şehir sütunları bulunan people isimli bir tablo oluşturun 
ve içine null değer barındırmayan kayıtlar ekleyin.
=========================================================
 */

 CREATE TABLE people (
    id INT,
    isim VARCHAR(50),
    soyisim VARCHAR(50),
    yas INT,
    sehir VARCHAR(50)
 );

 INSERT INTO people  VALUES (1,'Ahmet', 'Yılmaz', 30, 'Ankara');
INSERT INTO people  VALUES (2,'Mehmet', 'Kara', 25, 'İstanbul');
INSERT INTO people  VALUES (3,'Ayşe', 'Kaya', 22, 'İzmir');
INSERT INTO people  VALUES (4,'Fatma', 'Güneş', 28, 'Bursa');
INSERT INTO people  VALUES (5,'Ali', 'Çelik', 35, 'Antalya');
INSERT INTO people  VALUES (6,'Elif', 'Demir', 29, 'Ankara');
INSERT INTO people  VALUES (7,'Can', 'Özdemir', 33, 'İstanbul');
INSERT INTO people  VALUES (8,'Deniz', 'Arslan', 24, 'İzmir');
INSERT INTO people  VALUES (9,'Selin', 'Yıldız', 27, 'Bursa');
INSERT INTO people  VALUES (10,'Emre', 'Koç', 31, 'Antalya');
INSERT INTO people  VALUES (11,'Zeynep', 'Çınar', 26, 'Konya');
INSERT INTO people  VALUES (12,'Oğuz', 'Kaplan', 40, 'Samsun');
INSERT INTO people  VALUES (13,'Burcu', 'Ertuğrul', 22, 'Trabzon');
INSERT INTO people  VALUES (14,'Kaya', 'Durmaz', 35, 'Diyarbakır');
INSERT INTO people  VALUES (15,'Seda', 'Aydın', 28, 'Eskişehir');


/*  
========================  ORNEK  ========================
People tablosundan isim ve soy isim bilgilerini listeleyin.
=========================================================
 */
 SELECT isim,soyisim FROM dbo.people;

   /*  
========================  ORNEK  ========================
People tablosundan sehir degeri Antalya olan kisileri listeleyin.
=========================================================
 */

 SELECT * FROM dbo.people
 WHERE sehir = 'Antalya';

   /*  
========================  ORNEK  ========================
People tablosundan yas degeri 22 olan kisileri listeleyin.
=========================================================
 */
 SELECT * FROM dbo.people
 WHERE yas = 22;

 SELECT * FROM dbo.people;


   /*  
========================  ORNEK  ========================
People tablosundan sehir degeri Ankara olan kişilerin 
yas, isim ve soyisim bilgilerini listeleyin.
=========================================================
 */

 SELECT yas,isim,soyisim FROM dbo.people
 WHERE sehir = 'Ankara';


 

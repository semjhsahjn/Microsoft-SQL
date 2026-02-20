USE SqlDersleri;

 /* 
===============================================
		       SELECT - DISTINCT
===============================================

 SQL'de, bir sorgu sonucu setinden 
 yalnızca benzersiz (tekrar etmeyen) değerleri seçmek için kullanılır.
 */

  /*  
========================  ORNEK  ========================
 Icerisinde id, musteri_isim, urun_ismi, satis_miktari ve urun_kg_fiyati 
 sutunlari bulunan manav tablosu olusturun
=========================================================
 */
 CREATE TABLE manav(
	id INT,
	musteri_isim VARCHAR(50),
	urun_ismi VARCHAR(50),
	satis_miktari DECIMAL(6,2),
	urun_kg_fiyati DECIMAL(6,2)
 );

 -- manav tablosuna null barindirmayan kayitlar girin

 INSERT INTO manav
 VALUES
	(101,'Ali','Portakal',5,25),
    (102,'Veli','Karpuz',10,20),
	(101,'Ali','Elma',3,30),
    (104,'Leyla','Armut',2.5,40),
    (103,'Ayse','Kavun',4,40),
    (101,'Ali','Uzum',2,40),
    (102,'Veli','Elma',2,25),
    (103,'Ayse','Uzum',2,35),
	(104,'Leyla','Elma',2,20),
    (103,'Ayse','Portakal',4,20),
	(105,'Cem','Karpuz',8,20),
	(104,'Leyla','Kavun',3,45),
	(105,'Cem','Armut',2,35);

	 /*  
========================  ORNEK  ========================
 Manav listesinde satilan urun cesitlerini listeleyin
=========================================================
 */

 SELECT DISTINCT urun_ismi FROM dbo.manav;

  /*  
========================  ORNEK  ========================
 Manav listesinde musterileri tekil olarak listeleyin
=========================================================
 */
 SELECT DISTINCT musteri_isim FROM dbo.manav;

 -- ayni isimde farkli müsteriler olabilecegin dolayi id ile yapilabilir.

 SELECT DISTINCT id, musteri_isim FROM dbo.manav;

  /*  
========================  ORNEK  ========================
 Manav listesindeki farkli fiyatlari tekil olarak listeleyin
=========================================================
 */

 SELECT DISTINCT urun_kg_fiyati FROM dbo.manav;

  /*  
========================  ORNEK  ========================
 Kitaplar tablosundaki tum kitap isimlerini TEKRARSIZ OLARAK listeleyin
=========================================================
 */

 SELECT DISTINCT kitap_adi FROM dbo.kitaplar;


  /*  
========================  ORNEK  ========================
 Kitaplar tablosundaki yazarlari TEKRARSIZ olarak listeleyin
=========================================================
 */

 SELECT DISTINCT yazar_adi FROM dbo.kitaplar;

  /*  
========================  ORNEK  ========================
 Kitaplar tablosundaki 1860 ile 1890 yillari arasinda kitap yayinlayan yazarlari 
 TEKRARSIZ olarak listeleyin
=========================================================
 */

 SELECT DISTINCT yazar_adi FROM dbo.kitaplar
 WHERE yayin_yili BETWEEN 1860 AND 1890;

  /*  
========================  ORNEK  ========================
  Icerisinde id, musteri_adi, urun_adi ve siparis_tarihi
  sutunlari bulunan siparisler tablosu olusturun
=========================================================
 */

 CREATE TABLE siparisler (
    id INT ,
    musteri_adi VARCHAR(50),
    urun_adi VARCHAR(50),
    siparis_tarihi DATE
);

-- siparisler tablosuna kayitlar girin

INSERT INTO siparisler (musteri_adi, urun_adi, siparis_tarihi) 
VALUES  ('Ahmet Yılmaz', 'Laptop', '2023-01-10'),
		('Ayşe Kaya', 'Akıllı Telefon', '2023-01-12'),
		('Mehmet Öz', 'Laptop', '2023-02-05'),
		('Ahmet Yılmaz', 'Akıllı Telefon', '2023-02-10'),
		('Ayşe Kaya', 'Tablet', '2023-02-20'),
		('Ahmet Yılmaz', 'Laptop', '2023-02-25');


 /*  
========================  ORNEK  ========================
     Siparisler tablosuna gore hangi urunler siparis edilmis. 
    (Urunler UNIQUE (benzersiz) olmali)
=========================================================
 */
 
 SELECT DISTINCT urun_adi FROM dbo.siparisler;


  /*  
========================  ORNEK  ========================
 Siparisler tablosundaki verilere gore subat ayi icerisinde satilan
 urunleri benzersiz olarak listeleyiniz
=========================================================
 */

 SELECT DISTINCT urun_adi FROM dbo.siparisler
 WHERE MONTH(siparis_tarihi) = '02';

 SELECT * FROM dbo.siparisler;



USE SqlDersleri;

/*
============================== JOIN ISLEMLERI ===============================

JOIN, iki veya daha fazla tabloyu ortak bir sütun üzerinden birleştirerek 
ilişkili verileri tek bir sonuç kümesi olarak gösterir.

JOIN sütun bazlı çalışır. 
Yani farklı tablolardaki sütunları yan yana getirir.

UNION ise birden fazla SELECT sorgusunun sonuçlarını 
alt alta ekleyerek birleştirir. 
Satır bazlı çalışır ve tablolar arasında ilişki olmasına gerek yoktur.
Ancak sütun sayısı ve veri tipleri uyumlu olmalıdır.

Özet:
- JOIN → İlişkili tabloları yatay (sütun bazlı) birleştirir.
- UNION → Sonuçları dikey (satır bazlı) birleştirir.

=============================================================================
*/

/*  
========================  ORNEK  ========================
 İçerisinde sirket_adi, ulke, ve calisan_sayisi olan 
 sirket_personel_sayisi tabloyu oluşturun ve kayitlar ekleyin.
=========================================================
 */

 CREATE TABLE sirket_personel_sayisi (
	sirket_adi VARCHAR(100),
	ulke VARCHAR(50),
	calisan_sayisi INT
 );


 INSERT INTO sirket_personel_sayisi  VALUES
('TechNova', 'Türkiye', 120),
('GreenEnergy Inc.', 'Almanya', 250),
('FutureLogix', 'ABD', 400),
('SkyMedia', 'Türkiye', 95),
('NextGenSoft', 'Almanya', 180); 

SELECT* FROM dbo.sirket_personel_sayisi;


/*  
========================  ORNEK  ========================
 İçerisinde sirket_adi, ulke ve kazanc sutunlari olan 
 sirket_kazanc tablosunu oluşturun ve kayitlar ekleyin.
=========================================================
 */

 CREATE TABLE sirket_kazanc (
	sirket_adi VARCHAR(100),
	ulke VARCHAR(50),
	kazanc DECIMAL(12,2)
 );

 -- sirket_kazanc tablosuna null icermeyen kayitlar girin

 INSERT INTO sirket_kazanc  VALUES
('TechNova', 'Türkiye', 1500000.00),       
('GreenEnergy Inc.', 'Almanya', 2750000.50), 
('SkyMedia', 'Türkiye', 900000.75),        
('FutureLogix', 'ABD', 5200000.00),        
('OceanicWare', 'İtalya', 1300000.25),     
('LogiTrack', 'Almanya', 2100000.00),      
('Innovatex', 'ABD', 3100000.40);  

SELECT * FROM dbo.sirket_kazanc;

/*
============================== JOIN ISLEMLERI ===============================

 Olusturdugumuz 2 tabloda da 
 şirket isimleri var ama şirketlerin çalışan sayısı bir tabloda, 
 kazançları ise diğer tabloda. 
 Şirket isimleri, çalışan sayısı ve kazançları tek bir tabloda gösterilmek istenirse, 
 bu tablolar JOIN ile birleştirilebilir.
 
 ANCAK birleştirme yapılmadan önce bir karar verilmelidir.

 Cunku, iki tablodaki şirket isimlerinde ortak olanlar olduğu gibi 
 farklı olanlar da var.

 Birleştirme işlemi için aşağıdaki seçeneklerden biri seçilebilir.

 - İki tabloda ortak olan şirketleri ve bilgilerini getir

 - Personel sayısı tablosundaki şirketleri ve bilgilerini getir, 
   bu şirketlerin varsa kazanç bilgilerini de getir
   
 - Kazanç tablosundaki şirketleri ve bilgilerini getir, 
   bu şirketlerin varsa çalışan sayısı bilgilerini de getir
   
 - İki tablodan herhangi birinde olan tüm şirketleri 
   ve var olan bilgilerini getir.

=============================================================================
*/ 

/*
=============================== INNER JOIN  ==================================
 İki tabloda ortak olarak bulunan (kesişim kümesi) dataları 
 baz alarak yeni bir tablo olusturmak için kullanılır.

 SELECT satirinda tabloda görünmesi istenen sütunlar yazılırken 
 table_name.field_name seklinde yazılmalıdır.

 FROM satirinda table_name yazilirken iki tabloyu da belirtmek icin
   1.table_name  INNER JOIN  2.table_name 
 yazilmalidir.

 İki tablodaki veriler hangi sutundaki data uzerinden eslestirilecek ise 
 ON satirinda yazılmalıdır.

 
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 INNER JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
    
================================================================================
*/

/*  
========================  ORNEK  ========================
 İki tabloda ortak olan şirketlerin 
 isim, çalışan sayısı ve kazanç bilgilerini tek bir tabloda gösterin.
=========================================================
 */

 SELECT ps.sirket_adi,ps.calisan_sayisi,k.kazanc
 FROM dbo.sirket_personel_sayisi ps
 INNER JOIN
 dbo.sirket_kazanc k
 ON ps.sirket_adi = k.sirket_adi;


 /*
================================= LEFT JOIN  ===================================
 LEFT JOIN, 1. tablodan (sol tablo) SELECT ile seçilen sütunlardaki 
 tüm kayıtları getirir. 

 Ancak, diğer tablodan (sağ tablo) sadece ON ile belirtilen koşula uyan kayıtları getirir. 

 Yani sola yazılan tablodaki tüm kayıtlar 
 ve sağdaki tabloda varsa bu kayıtlara ek datalar ortak bir tabloda gösterilir, 
 sağ tabloda o kayda ait ek data yoksa o kısımlar bos kalır.

 İlk yazılan tablodaki kayıtların tamamını aldığı için 
 hangi tablodaki kayıtlar baz alınmak isteniyorsa 
 o tablo sola yazılmalı ve mümkün olduğunca sütunlar o tablodan alınmalıdır.
 
     Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 LEFT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
   
================================================================================
*/

/*  
========================  ORNEK  ========================
 Personel sayısı tablosundaki şirketlerin isim ve çalışan sayısı bilgilerini getirin, 
 bu şirketlerin varsa kazanç bilgilerini de ayni tabloda gösterin.
=========================================================
 */

 SELECT ps.sirket_adi,ps.calisan_sayisi,k.kazanc
 FROM dbo.sirket_personel_sayisi ps
 LEFT JOIN
 dbo.sirket_kazanc k 
 ON ps.sirket_adi = k.sirket_adi;

 
/*
=============================== RIGHT JOIN  ==================================
 RIGHT JOIN 2. tablodan (sağ tablo) SELECT ile seçilen sütunlardaki tüm kayıtları getirir. 

 İlk tablodan ise (sol tablo) sadece ON ile belirtilen koşula uyan kayıtları getirir. 

 Yani sağa yazılan tablodaki tüm kayıtlar 
 ve soldaki tabloda varsa bu kayıtlara ek datalar ortak bir tabloda gösterilir, 
 sol tabloda o kayda ait ek data yoksa o kısımlar bos kalır.
   
 LEFT JOIN ve RIGHT JOIN ikisi de ayni isi yapar, 
 farkları FROM satırındaki yazılış sıralamasıdır.  

 Biri ile yapılan işlem FROM satırındaki tablo yazılış sırası değiştirilerek 
 diğeri ile de yapılabilir.
   
        
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 RIGHT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
    
==============================================================================
*/  


/*  
========================  ORNEK  ========================
 Kazanç tablosundaki şirketlerin isim ve kazanç bilgilerini getirin, 
 bu şirketlerin varsa çalışan sayısı bilgilerini de ayni tabloda gösterin.
=========================================================
 */

 SELECT k.sirket_adi,k.kazanc,ps.calisan_sayisi
 FROM dbo.sirket_personel_sayisi  ps
 RIGHT JOIN 
 dbo.sirket_kazanc k
 ON ps.sirket_adi = k.sirket_adi;


 /*
=============================== FULL JOIN ===============================

Microsoft SQL Server, FULL OUTER JOIN yapısını direkt olarak destekler. 
Yani LEFT JOIN ve RIGHT JOIN'i UNION ile birleştirmeye gerek yoktur.

FULL JOIN, iki tabloyu birleştirir ve her iki tabloda da olan veya sadece bir tabloda 
olan tüm kayıtları getirir. Ortak olmayan sütunlar için NULL değeri döner.

- Her iki tabloda da aynı isimdeki sütunlar varsa, tablo_adi.sutun_adi şeklinde 
  belirtmek iyi bir pratiktir.

Syntax
---------
SELECT tablo1.sutun1, tablo1.sutun2, tablo2.sutun1, tablo2.sutun2, ...
FROM tablo1
FULL OUTER JOIN tablo2
ON tablo1.sutun = tablo2.sutun;

Açıklama:
- İki tabloda da aynı sirket_id varsa, değerler yan yana gelir.
- Sadece bir tabloda olan kayıtlar için diğer tablodaki sütunlar NULL olur.
- FULL OUTER JOIN, LEFT JOIN + RIGHT JOIN'in birleşimi gibidir.

Her iki tablodaki tüm veriyi kayıpsız birleştir, eksik olan hücreleri boş bırak.
===============================================================================
*/

/*  
========================  ORNEK  ========================
iki tablonun herhangi birinde olan tum sirketlerin isim ve ulkelerini
ve varsa bu şirketlerin calisa sayisi bilgilerini ve kazanc bilgilerini ayni tabloda gösterin
=========================================================
 */

 SELECT k.sirket_adi,k.ulke,k.kazanc,ps.calisan_sayisi
 FROM dbo.sirket_personel_sayisi ps
 FULL JOIN 
 dbo.sirket_kazanc k
 ON ps.sirket_adi = k.sirket_adi;


 /*  
========================  ORNEK  ========================
 Icerisinde bolum_id, bolum_isim ve konum field'lari olan 
 bolümler tablosu oluşturun. 
 Bolum_id field’i Primary Key olsun ve içine null olmayan değerler ekleyin.
=========================================================
 */
 

CREATE TABLE bolumler (
      bolum_id   INT PRIMARY KEY,
      bolum_isim VARCHAR(14),
      konum      VARCHAR(13)
    );
 
INSERT INTO bolumler VALUES (10,'MUHASEBE','IST');
INSERT INTO bolumler VALUES (20,'MUDURLUK','ANKARA');
INSERT INTO bolumler VALUES (30,'SATIS','IZMIR');
INSERT INTO bolumler VALUES (40,'ISLETME','BURSA');
INSERT INTO bolumler VALUES (50,'DEPO', 'YOZGAT');
INSERT INTO bolumler VALUES (60,'SATIS', 'CORUM'); 


/*  
========================  ORNEK  ========================
 Icerisinde personel_id, personel_isim, meslek, mudur_id, maas ve bolum_id field'lari olan 
 personeller tablosu oluşturun.  
 Bolum_id field’i Foreign Key olsun 
 ve tabloya kayitlar ekleyin.
=========================================================
 */

 CREATE TABLE personeller (
      personel_id   INT ,
      personel_isim VARCHAR(10),
      meslek        VARCHAR(9),
      mudur_id      INT,
      maas          INT,
      bolum_id      INT,
      CONSTRAINT bolumID_fk FOREIGN KEY(bolum_id)
      REFERENCES bolumler(bolum_id)
    );
    
    
    INSERT INTO personeller VALUES (7369,'AHMET','KATIP',1111,800,20);
    INSERT INTO personeller VALUES (7499,'BAHATTIN','SATIS',1222,1600,30);
    INSERT INTO personeller VALUES (7521,'NESE','SATISE',1222,1250,30);
    INSERT INTO personeller VALUES (1111,'MUZAFFER','MUDUR',7839,2975,20);
    INSERT INTO personeller VALUES (7654,'MUHAMMET','SATIS',1222,1250,30);
    INSERT INTO personeller VALUES (1222,'EMINE','MUDUR',7839,2850,30);
    INSERT INTO personeller VALUES (1333,'HARUN','MUDUR',7839, 2450,10);
    INSERT INTO personeller VALUES (7788,'MESUT','ANALIST',1111,3000,20);
    INSERT INTO personeller VALUES (7839,'SEHER','BASKAN',NULL,5000,10);
    INSERT INTO personeller VALUES (7844,'DUYGU','SATIS',1222,1500,30);
    INSERT INTO personeller VALUES (7876,'ALI','KATIP',1111,1100,20);
    INSERT INTO personeller VALUES (7900,'MERVE','KATIP',1222,950,30);
    INSERT INTO personeller VALUES (7902,'NAZLI','ANALIST',1111,3000,20);
    INSERT INTO personeller VALUES (7934,'EBRU','KATIP',1333,1300,10);
    INSERT INTO personeller VALUES (7956,'SIBEL','MIMAR',1333,3300,60);
    INSERT INTO personeller VALUES (7933,'ZEKI','MUHENDIS',1333,4300,60);



    /*  
========================  ORNEK  ========================
 SATIS ve MUHASEBE bölümlerinde çalışanların 
 isimlerini ve bölümlerini, önce bolum sonra isim sıralı olarak listeleyin. 
=========================================================
 */

 SELECT p.personel_isim,b.bolum_isim
FROM dbo.personeller p LEFT JOIN dbo.bolumler b
ON p.bolum_id = b.bolum_id
ORDER BY b.bolum_isim,p.personel_isim;


/*  
========================  ORNEK  ========================
 SATIS, ISLETME ve DEPO bölümlerinde çalışanların isimlerini ve bölümlerini 
 isim sıralı olarak listeleyiniz
  	
 NOT: Çalışanı olmasa bile bolum ismi listelenmelidir.
=========================================================
 */
 

SELECT p.personel_isim , b.bolum_isim
FROM bolumler b left join personeller p
ON b.bolum_id = p.bolum_id
WHERE b.bolum_isim in('SATIS','ISLETME','DEPO')
ORDER BY b.bolum_isim;



/*  
========================  ORNEK  ========================
 Çalışan tüm personelin isimlerini bolum isimlerini ve maaşlarını 
 bolum ters sıralı ve maaş sıralı listeleyin.

=========================================================
 */
 

SELECT p.personel_isim,b.bolum_isim,p.maas
FROM personeller p left join bolumler b
ON p.bolum_id = b.bolum_id
ORDER BY b.bolum_isim DESC , p.maas ASC;


/*  
========================  ORNEK  ========================
 SATIS ve MUDURLUK bölümlerinde çalışan personelden 
 maaşları 2000 den büyük olanların isimlerini, bolum isimlerini ve maaşlarını 
 bolüme ve isme göre sıralayarak listeleyin. 
=========================================================
 */
 
SELECT p.personel_isim,b.bolum_isim,p.maas
FROM personeller p left join bolumler b
ON p.bolum_id = b.bolum_id
WHERE b.bolum_isim in('SATIS','MUDURLUK') AND p.maas > 2000
ORDER BY b.bolum_isim,p.personel_isim;

/*
===============================================
		LIKE OPERATORU 
===============================================

 metin ifadelerinde belirli bir desenle eşleşen verileri sorgulamak için 
 kullanılan bir karşılaştırma operatörüdür.

  /*  
========================  ORNEK  ========================
 People tablosunda yasi 30’dan buyuk olan kişilerin bilgilerini listeleyin.
=========================================================
 */
 */
 SELECT * FROM dbo.people
 WHERE yas > 30;

  /*  
========================  ORNEK  ========================
 İçerisinde id, isim ve maas sütunları bulunan 
 çalışanlar tablosu oluşturun ve içine null barındırmayan kayıtlar ekleyin.
=========================================================
 */

 CREATE TABLE calisanlar (
	id INT NOT NULL,
	isim VARCHAR(50) NOT NULL,
	maas VARCHAR(50) NOT NULL
 );

 ALTER TABLE calisanlar
 ALTER COLUMN maas CHAR(5) NOT NULL;

 INSERT INTO calisanlar
VALUES
('10001','Ahmet Aslan',7000),
('10002','Mehmet Yilmaz',12000),
('10003','Meryem',7215),
('10004','Veli Han',5000),
('10005','Mustafa Ali',5500),
('10006','Ayse Can',5600),
('10010','Ayse',4700),
('10009','Ayse Cemile',4000),
('10008','Ayse Fatma',4300),
('10007','Beyza Ayse',7700),
('10011','Yeliz Alina',12700);

SELECT * FROM calisanlar;

  /*  
========================  ORNEK  ========================
 calisanlar tablosundan dort harfli personeli listeleyin
=========================================================
 */

 SELECT * FROM dbo.calisanlar
 WHERE isim LIKE '____';


   /*  
========================  ORNEK  ========================
 calisanlar tablosundan isminde a bulunan personeli listeleyin.
=========================================================
 */

 SELECT * FROM dbo.calisanlar
 WHERE isim LIKE '%a%';


  /*  
========================  ORNEK  ========================
 calisanlar tablosundan ismi 'a' ile biten personeli listeleyin.
=========================================================
 */

 SELECT * FROM dbo.calisanlar
 WHERE isim LIKE '%a';

   /*  
========================  ORNEK  ========================
 calisanlar tablosundan isminin 2. harfi 'e' olan personeli listeleyin.
=========================================================
 */
 
 SELECT * FROM dbo.calisanlar
 WHERE isim LIKE '_e%';

   /*  
========================  ORNEK  ========================
 calisanlar tablosundan Isminin 2. harfi 'e' olup 
 diger harflerinde 'y' olan personeli listeleyin
=========================================================
 */

 SELECT * FROM dbo.calisanlar
 WHERE isim LIKE '_e%y%';


   /*  
========================  ORNEK  ========================
 calisanlar tablosundan maasi 5 haneli olan personel isimlerini listeleyin
=========================================================
 */

 SELECT * FROM dbo.calisanlar
 WHERE LEN(maas) = 5;

 EXEC sp_help 'dbo.calisanlar';

SELECT maas FROM dbo.calisanlar;


  /*  
========================  ORNEK  ========================
 calisanlar tablosundan isminin 1. harfi 'a' ve 7. harfi 'a' olan 
 personeli listeleyin
=========================================================
 */

 SELECT* FROM dbo.calisanlar
 WHERE isim LIKE 'a_____a%';


   /* 
===============================================
		   REGEXP_LIKE OPERATORU 
===============================================

 bir sütundaki verinin belirli bir düzenli ifadeye (regex) uyup uymadığını 
 kontrol etmek için kullanılır.

 [!-~]   	=> Butun karakterleri karsilayan tek bir karakter
[a-zA-Z0-9] => Harf ve rakamlari temsil eden bir karakter
^      		=> baslangici belirtir
$      		=> bitisi belirtir.  
|      		=> veya anlaminda kullanilir.
.      	    => herhangi bir tek karakter anlamina gelir
*/

  /*  
========================  ORNEK  ========================
 İçerisinde id, kelime ve harf_sayisi sütunları bulunan 
 kelimeler tablosu oluşturun ve içine null barındırmayan kayıtlar ekleyin.
=========================================================
 */

 CREATE TABLE kelimeler (
	id INT unique,
	kelime VARCHAR(50),
	harf_sayisi INT
 );

 INSERT INTO kelimeler VALUES 
    (1001, 'hot', 3),
	(1002, 'hat', 3),
	(1003, 'hit', 3),
	(1004, 'hbt', 3),
	(1005, 'hct', 3),
    (1006, 'adem', 4),
    (1007, 'selim', 5),
    (1008, 'yusuf', 5),
    (1009, 'hip', 3),
    (1010, 'HOT', 3),
    (1011, 'hOt', 3),
    (1012, 'h9t', 3),
    (1013, 'hoot', 4),
    (1014, 'haaat', 5),
    (1015, 'hooooot', 7),
	(1016, 'h-t', 3),
    (1017, 'h?t', 3),
    (1018, 'hOOOt', 5),
    (1019, 'O', 1);



 /*  
========================  ORNEK  ========================
 Kelimeler tablosundan icerisinde 'ot' veya 'at' bulunan kelimeleri listeleyin
=========================================================
 */

 SELECT * FROM dbo.kelimeler
 WHERE REGEXP_LIKE(kelime,'ot|at');

--  Case Sensitive (Büyük/Küçük Harfe Duyarlı) olmak isteniyorsa sorgu sonuna 'c' seklinde patern eklenir.
  
  /*  
========================  ORNEK  ========================
 Kelimeler tablosundan icerisinde 'ot' veya 'at' bulunan kelimeleri 
 case sensitive olarak listeleyin.
=========================================================
 */

 SELECT * FROM dbo.kelimeler
 WHERE REGEXP_LIKE(kelime,'ot|at','c');

   /*  
========================  ORNEK  ========================
 Kelimeler tablosunda icinde 'ho' veya 'hi' gecen kelimeleri 
 case-sensitive  olmadan listeleyin.
=========================================================
 */

 SELECT * FROM dbo.kelimeler
 WHERE REGEXP_LIKE(kelime,'ho|hi','i');

  /*  
========================  ORNEK  ========================
 Kelimeler tablosundan sonu 't' veya 'm' ile bitenleri 
 case-sensitive olmadan listeleyin.
=========================================================
 */

 SELECT * FROM dbo.kelimeler WHERE REGEXP_LIKE(kelime,'t$|m$');

 /*  
========================  ORNEK  ========================
    Kelimeler tablosundan h ile baslayip t ile biten 3 harfli kelimeleri 
    (h ile t kucuk harfli olanlari) listeleyiniz.
=========================================================
 */ 
 
 SELECT * FROM dbo.kelimeler WHERE REGEXP_LIKE(kelime,'^h.t$','c');

   /*  
========================  ORNEK  ========================
  Kelimeler tablosundan 'h' ile baslayip 't' ile biten 2. karakteri rakam 
  olan 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz
=========================================================
 */
 SELECT * FROM dbo.kelimeler WHERE REGEXP_LIKE(kelime,'^h[0-9]t$','c');

  /*  
========================  ORNEK  ========================
 Kelimeler tablosundan 'h' ile baslayip 't' ile biten 2. karakteri buyuk 
 harf olan 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz
=========================================================
 */

 SELECT * FROM dbo.kelimeler WHERE REGEXP_LIKE (kelime,'^h[A-Z]t$','c');

   /*  
========================  ORNEK  ========================
    Kelimeler tablosundan 2. harfi 'O' (buyuk O harfli) olan 3 karakterli 
    kelimeleri ve id'lerini listeleyiniz
=========================================================
 */

 SELECT kelime,id FROM dbo.kelimeler WHERE REGEXP_LIKE(kelime,'^.O.$','c');


  /*
-----------------------------KARSILASTIRMA ------------------------------

LIKE  & REGEXP_LIKE

Esneklik: 
 REGEXP daha esnek ve güçlüdür, karmaşık desenleri tanımlayabilir. 
 LIKE ise daha basit ve sınırlı desenlerle çalışır.

Performans: 
 LIKE operatörü genellikle REGEXP operatörüne göre daha hızlıdır,
 çünkü daha basit desenleri işler.

Kullanım Kolaylığı: 
 LIKE daha basit ve anlaşılması daha kolaydır.
 REGEXP ise düzenli ifadelerin nasıl çalıştığını bilmeyi gerektirir, 
 bu da öğrenme eğrisini artırır.
*/

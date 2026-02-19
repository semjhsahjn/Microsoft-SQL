/*
===============================================
		  TABLOYU DEGISTIRME - ALTER TABLE
===============================================
*/

 /*  
========================  ORNEK  ========================
 Ornek : Kitaplar tablosuna sayfa sayisi ve fiyat sutunlarini ekleyin.
=========================================================
 */
 SELECT * FROM dbo.kitaplar;

ALTER TABLE dbo.kitaplar
ADD sayfa_sayisi INT, fiyat DECIMAL(10,2);

/*  
========================  ORNEK  ========================
  Personel tablosundaki maas sütununu silin
=========================================================
 */ 
SELECT * FROM dbo.personel;

ALTER TABLE dbo.personel
DROP COLUMN maas;


/*  
========================  ORNEK  ========================
  Kitaplar tablosundaki sayfa sayisi sutununu silin
=========================================================
 */ 

 SELECT * FROM dbo.kitaplar;

 ALTER TABLE dbo.kitaplar
 DROP COLUMN sayfa_sayisi;

 /*  
========================  ORNEK  ========================
 Personel tablosundaki pozisyon sutununun adini sorumluluk olarak degistirin
=========================================================
 */

 SELECT * FROM dbo.personel;

 -- Bu komut, dbo.personel tablosundaki pozisyon adlı kolonu alır ve adını sorumluluk olarak değiştirir.
 EXEC sp_rename 'dbo.personel.pozisyon', 'sorumluluk', 'COLUMN';


  /*  
========================  ORNEK  ========================
Personel tablosundaki soyadi sutununun adini lastname olarak degistirin
=========================================================
 */

 SELECT * FROM dbo.personel;

 EXEC sp_rename 'dbo.personel.soyadi','lastname','COLUMN';


 /*  
========================  ORNEK  ========================
  Kitaplar tablosundaki fiyat sutununun data turunu degistirin .
=========================================================
 */ 

 SELECT * FROM dbo.kitaplar;

 ALTER TABLE dbo.kitaplar
 ALTER COLUMN fiyat INT;


 -- sp_help 'dbo.kitaplar'; -- tablo yapısını görmek için kullanılır.

 
 
 -- data turunu yeniden DOUBLE yapin
	ALTER TABLE dbo.kitaplar
	ALTER COLUMN fiyat DECIMAL(10,2);

 -- personel tablosunun ismini calisanlar yapin
 -- MS SQL Server’da (T-SQL) tablo adını değiştirmek için sp_rename kullanılır.
	EXEC sp_rename 'dbo.personel','calisanlar';	


 -- tekrar personel yapin
	EXEC sp_rename 'dbo.calisanlar','personel';
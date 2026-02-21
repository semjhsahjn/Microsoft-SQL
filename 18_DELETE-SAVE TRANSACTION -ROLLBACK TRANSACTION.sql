/*
================================== DELETE (MSSQL) ===========================================

DELETE FROM, bir tablodan belirli koşulları sağlayan satırları 
kalıcı olarak silmek için kullanılan SQL Server komutudur.

WHERE koşulu yazılmazsa, DELETE FROM komutu tablodaki tüm kayıtları siler.
Tüm kayıtlar silindikten sonra tablo yapısı durur, sadece içi boş olur.

DELETE komutu sadece verileri siler, tabloyu silmez.
Tabloyu tamamen silmek için DROP TABLE kullanılır.

İlişkili (relational) veritabanlarında DELETE işlemi dikkatli yapılmalıdır.
FOREIGN KEY ile bağlı kayıtlar varsa SQL Server silmeye izin vermeyebilir
ve hata verir (Foreign Key Constraint Error).

DELETE, UPDATE gibi veri değiştiren işlemler transaction içinde yapılırsa
geri alınabilir.

BEGIN TRANSACTION : İşlem başlatır.
SAVE TRANSACTION name: İşlem içinde geri dönülebilecek bir nokta oluşturur.
ROLLBACK TRANSACTION : İşlemi tamamen veya belirli bir savepoint'e kadar geri alır.
COMMIT            : İşlemi kalıcı hale getirir.

MSSQL’de Auto Commit varsayılan olarak açıktır.
Transaction kullanmak için BEGIN TRANSACTION yazılmalıdır.

----------------------------------- SYNTAX -----------------------------------

DELETE FROM tablo_adi
WHERE kosul;

--------------------------------------------------------------------------------
*/


 /*  
========================  ORNEK  ========================
 İçerisinde id, isim, veli_isim ve yazili_notu field’lari bulunan 
 kursiyer tablosu oluşturun ve tabloya null olmayan değerler ekleyin.
=========================================================
 */

CREATE TABLE kursiyer
(
id char(3),
isim varchar(50),
veli_isim varchar(50),
yazili_notu int,
CONSTRAINT kursiyer_pk
PRIMARY KEY (id)
);

INSERT INTO kursiyer VALUES(123, 'Ali Can', 'Hasan',75); 
INSERT INTO kursiyer VALUES(124, 'Merve Gul', 'Ayse',85); 
INSERT INTO kursiyer VALUES(125, 'Kemal Yasa', 'Ali',85);

/*  
========================  ORNEK  ========================
 Tablonun ilk hali için bir SAVE TRANSACTION oluşturun.
=========================================================
 */
 BEGIN TRANSACTION;
 SAVE TRANSACTION kursiyer_baslangic;

  /*  
========================  ORNEK  ========================
 isminde a harfi olan öğrencilerin yazılı notunu 5 artırın.
=========================================================
 */
 
UPDATE dbo.kursiyer
SET yazili_notu = yazili_notu + 5
WHERE isim LIKE '%a%';

 /*  
========================  ORNEK  ========================
 veli isminin uzunluğu 3 harften fazla olanlardan 3 puan silin
=========================================================
 */
 
 UPDATE dbo.kursiyer
 SET yazili_notu = yazili_notu - 3
 WHERE LEN(veli_isim) > 3;

  /*  
========================  ORNEK  ========================
 veli ismi Hasan olan öğrenciyi silin
=========================================================
 */
 
 DELETE FROM dbo.kursiyer
 WHERE veli_isim = 'Hasan';

  /*  
========================  ORNEK  ========================
 Tabloyu ilkDurum’a döndürün.
=========================================================
 */
 
 ROLLBACK TRANSACTION kursiyer_baslangic;

 -- Kontrol
 SELECT * FROM dbo.kursiyer;

/*  
=======================  NOTLAR (MSSQL)  ========================

ROLLBACK tabloya değil, aktif TRANSACTION’a etki eder.

ROLLBACK TRANSACTION save_adi;
→ Belirtilen save noktasına kadar geri döner.

ROLLBACK;
→ Transaction içindeki tüm işlemleri iptal eder.

COMMIT yapıldıktan sonra geri dönüş mümkün değildir.
=================================================================
*/

 /*  
=======================  TRUNCATE  ======================
 Bir tablodaki tüm verileri siler, 
 ancak tablo yapısını korur. 
 TRUNCATE tüm kayıtları siler, WHERE ile kullanılamaz.
=========================================================
 */

  /*  
========================  ORNEK  ========================
 Tablonun son hali için yeni bir SAVEPOINT oluşturun.
=========================================================
 */

BEGIN TRANSACTION;
SAVE TRANSACTION sonDurum;


 /*  
========================  ORNEK  ========================
 Kursiyer tablosundaki kayıtları silin
=========================================================
 */
 
 TRUNCATE TABLE dbo.kursiyer;

 SELECT * FROM dbo.kursiyer;

 --sonDurum 'daki haline geri döner
 ROLLBACK TRANSACTION sonDurum;


  /*  
=========================  NOT  =========================
 Related tablolarda silme işlemi yaparken 
 Parent – Child ilişkisine dikkat edilmelidir. 
 
 PRIMARY KEY sutununda olmayan hic bir datanin 
 FOREIGN KEY sutununda kullanilamayacagi unutulmamalidir. 
=========================================================
 */

  /*  
========================  ORNEK  ========================
 yeni bir dereceler tablosu oluşturun. 
 Kursiyer ve dereceler tablolarina kayit ekleyin
=========================================================
 */
 --Kursiyer tablosundaki kayıtların hepsini silelim
 TRUNCATE TABLE dbo.kursiyer;

 CREATE TABLE dereceler(
			kursiyer_id CHAR(3),
			ders_adi VARCHAR(30),
			yazili_notu INT,
			CONSTRAINT kursiyer_id_fk FOREIGN KEY (kursiyer_id)
			REFERENCES kursiyer(id) 
		);

INSERT INTO kursiyer VALUES
		(123,'Ali Can', 'Hasan', 75),
		(124,'Merve Gul', 'Ayse', 85),
		(125,'Kemal Yasa', 'Hasan', 85),
		(126,'Nesıbe Yılmaz', 'Ayse', 95),
		(127,'Mustafa Bak', 'Can', 99);


INSERT INTO dereceler VALUES
		(123, 'Kimya', 75),
		(124, 'Fizik', 65),
		(125, 'Tarih', 90),
		(126, 'Matematik', 90),
		(127, 'Matematik', 23);




 /*  
========================  ORNEK  ========================
 kursiyer tablosundan id'si 125 ten büyük olan dataları silin.
=========================================================
 */

 DELETE FROM dbo.kursiyer
 WHERE id > 125;

 -- dereceler tablosu kursiyer tablosundaki id sütununu referans aldığı için silemezsiniz,
 -- önce child table (fk olan tablo) sonra parent table (pk olan tablo) silinir.



 /*  
==================  ON DELETE CASCADE (MSSQL)  ==================

ON DELETE CASCADE, parent (ana) tablodaki bir kayıt silindiğinde,
ona bağlı child (alt) tablodaki kayıtların da otomatik silinmesini sağlar.

Bu özellik FOREIGN KEY tanımlanırken belirtilmelidir.

Sadece iki tablo arasında tanımlı ilişki (FK) varsa çalışır.

=========================================================
*/

 /*  
========================  ORNEK  ========================
 dereceler tablosunu tamamen silin
=========================================================
 */

 DROP TABLE dbo.dereceler;

  /*  
========================  ORNEK  ========================
 dereceler tablosunu ON DELETE CASCADE ozelligi ile
 yeniden olusturun
=========================================================
 */

 CREATE TABLE dereceler(
			kursiyer_id CHAR(3),
			ders_adi VARCHAR(30),
			yazili_notu INT,
			CONSTRAINT kursiyer_id_fk FOREIGN KEY (kursiyer_id)
			REFERENCES kursiyer(id) ON DELETE CASCADE
		);


INSERT INTO dereceler VALUES
		(123, 'Kimya', 75),
		(124, 'Fizik', 65),
		(125, 'Tarih', 90),
		(126, 'Matematik', 90),
		(127, 'Matematik', 23);


 /*  
========================  ORNEK  ========================
 kursiyer tablosundan id'si 125 ten büyük olan dataları silin.
=========================================================
 */
 DELETE FROM dbo.kursiyer
 WHERE id > 125;

 -- Parent table da zorla sildiğimiz id ler aynı şekilde otamatikmen chil tablodada yani dereceler tablosunda da silindi
/* 
====================================== UPDATE ========================================
Bir tablodaki mevcut verileri değiştirmek için kullanılır.

Güncelleme yapılırken mutlaka WHERE koşulu kullanılmalıdır, 
aksi halde tüm kayıtlar güncellenebilir. 

Güncelleme yapılırken güncellenecek sütunların veri türüne 
ve kurallara uygun değerler almasına dikkat edilmelidir.

Relational bir database'de update yaparken daha dikkatli olunmasi gerekir.
 
PRIMARY KEY sutununda olmayan hic bir datanin 
FOREIGN KEY sutununda kullanilamayacagi unutulmamalidir.

----- SYNTAX -----
UPDATE table_name
SET column_name = new_value
WHERE condition;
*/

 /*  
========================  ORNEK  ========================
 Kitaplar tablosundaki Araba Sevdası kitabinin yazar adını 
 Recaizade Mahmut Ekrem olarak güncelleyin.
=========================================================
 */

 UPDATE dbo.kitaplar
 SET yazar_adi = 'Recaizade Mahmut Ekrem'
 WHERE kitap_adi = 'Araba Sevdasi';

 /*  
========================  ORNEK  ========================
 Kitaplar tablosundaki Araba Sevdası kitabinin yayın yılını 1896, 
 kategorisini roman olarak güncelleyin.
=========================================================
 */

UPDATE dbo.kitaplar
SET yayin_yili = 1896
WHERE kitap_adi = 'Araba Sevdasi';

 /*  
========================  ORNEK  ========================
 Manav tablosunda 101 numaralı müşteriye satılan portakalın 
 fiyatını 20 olarak güncelleyin.
=========================================================
 */

 UPDATE dbo.manav
 SET urun_kg_fiyati = 20
 WHERE id = 101 AND urun_ismi = 'Portakal';


  /*  
========================  ORNEK  ========================
 Manav tablosunda tüm elma fiyatlarını 
 tablodaki en ucuz elma fiyatına getirecek şekilde güncelleyin.
=========================================================
 */

 UPDATE dbo.manav
 SET urun_kg_fiyati =
(SELECT MIN(urun_kg_fiyati) FROM dbo.manav WHERE urun_ismi = 'Elma')
WHERE urun_ismi = 'Elma';



/*  
========================  ORNEK  ========================
 Ogretmen_id'si 11 olan hocadan ders alan ve soyadı kaya olan öğrencinin 
 soyadını Aslan yapın.
=========================================================
 */

SELECT ogrenci_no FROM dbo.dersler WHERE ogretmen_id = 11;

-- 101 129 118

UPDATE dbo.ogrenci
SET soyisim = 'Aslan'
WHERE soyisim = 'Kaya' AND ogrenci_no 
IN(SELECT ogrenci_no FROM dbo.dersler WHERE ogretmen_id = 11);


/*  
========================  NOT  ========================
Related (ilişkili) tablolarda kayıt güncellerken dikkat edilmesi gereken ana kural:

FOREIGN KEY sütununa yazılacak değer,
bağlı olduğu tablodaki PRIMARY KEY sütununda mutlaka var olmalıdır.

PRIMARY KEY’de olmayan bir değer FOREIGN KEY alanına yazılamaz.
Aksi halde hata oluşur (Referential Integrity hatası).
=======================================================
*/

 /*  
========================  ORNEK  ========================
 Dersler tablosunda id’si 20 olan kaydın notunu 88 yapın.
=========================================================
 */

 UPDATE dbo.dersler
 SET ortalama_not  = 88
 WHERE id = 20;

  /*  
========================  ORNEK  ========================
 Dersler tablosunda id’si 20 olan kaydın ogrenci_no’sunu 222 yapın.
=========================================================
 */

 UPDATE dbo.dersler
 SET ogrenci_no = 222
 WHERE id = 20;

 -- The UPDATE statement conflicted with the FOREIGN KEY constraint "dersler_ogrenci_fk".


 /*  
=========================  VARIABLES (MSSQL)  =========================
Microsoft SQL Server'da değişkenler (variables), geçici veri saklamak için 
kullanılır. Özellikle sorgular arasında değer taşımak, hesaplama yapmak 
ve işlemleri adım adım kontrol etmek için kullanılır.
=======================================================================
*/

  /*  
========================  ORNEK  ========================
 Burcu Kaya'nin tarih dersindeki ortalama notunu 80 olarak guncelleyin.
=========================================================
 */

 -- DECLARE -> değişken olusturur
 -- SET -> değişkene değer verir
 -- @ -> değişkenler @ işaretiyle temsil edilir


 DECLARE @ogrenci_no INT
 SET @ogrenci_no = (SELECT ogrenci_no FROM dbo.ogrenci WHERE isim = 'Burcu' AND soyisim = 'Kaya')
 UPDATE dbo.dersler
 SET ortalama_not = 80
 WHERE ogrenci_no = @ogrenci_no AND ders_adi = 'Tarih';
 

 /*  
========================  ORNEK  ========================
 Okul veri tabaninda 
 101 numaralı öğrencinin Matematik dersindeki hocasını
 Zeynep Demir yapın.
=========================================================
 */

 DECLARE @ogretmen_id INT
 SET @ogretmen_id = 
 (SELECT ogretmen_id FROM dbo.ogretmenler WHERE isim = 'Zeynep' AND soyisim = 'Demir')
 UPDATE dbo.dersler
 SET ogretmen_id = @ogretmen_id
 WHERE ogrenci_no = 101 AND ders_adi = 'Matematik';


  /*  
========================  ORNEK  ========================
 Zeynep Demir hocadan ders alan tüm öğrencilerin genel ortalama notunu hesaplayıp,
 Zeynep Demir hocadan ders alan tüm öğrencilerin notunu, 
 bu ortalama not olacak şekilde güncelleyin.
=========================================================
 */
 DECLARE @ogretmen_id2 INT
 SET @ogretmen_id2 = 
 (SELECT ogretmen_id FROM dbo.ogretmenler WHERE isim = 'Zeynep' AND soyisim = 'Demir')
 DECLARE @ortalama_not DECIMAL(5,2)
 SET @ortalama_not =
 (SELECT AVG(ortalama_not) FROM dbo.dersler WHERE ogretmen_id = @ogretmen_id2)
 UPDATE dbo.dersler
 SET ortalama_not = @ortalama_not
 WHERE ogretmen_id = @ogretmen_id2;



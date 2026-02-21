/* 
======================== SELECT ile SUBQUERY ===========================

SELECT ile SUBQUERY kullanimi :
  
-- SELECT -- hangi sutunlari(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satirlari(record) getirsin
  
 * Yazdığımız QUERY'lerde SELECT satırında field isimleri kullanıyoruz. 
   Eğer SELECT satırında bir SUBQUERY yazılırsa, sonuç olarak tek bir kayıt değil bir field döndürür.

 * SELECT satirinda SUBQUERY yazacaksak SUM, COUNT, MIN, MAX ve AVG gibi 
  fonksiyonlar kullanilir. Bu fonksiyonlara AGGREGATE FUNCTION denir.
*/


 /*  
========================  ORNEK  ========================
 Her bir ogretmenin, ismini, soyismini, bransini 
 ve dersini alan ogrencilerin notlarinin ortalamasini
 listeleyen bir QUERY yazin.
=========================================================
 */


  -- (WHERE dbo.ogretmenler.ogretmen_id = dbo.dersler.ogretmen_id)
 /*
 Amaç: İki tablodaki ortak ogretmen_id değerlerini eşleştirerek
 sadece birbirine ait olan öğretmen–ders kayıtlarını listelemektir.

 Iki tablo arasinda baglanti ogretmen_id ile kurulabilir.

 */

 -- Answer
 SELECT isim,soyisim,ders_adi,
 (SELECT AVG(ortalama_not) FROM dbo.dersler
 WHERE dbo.ogretmenler.ogretmen_id = dbo.dersler.ogretmen_id) AS 'Ortalama'
 FROM dbo.ogretmenler;


  /*  
========================  ORNEK  ========================
 Her bir ogretmenin, ismini, soyismini, bransini 
 ve dersini alan ogrenciler icinde en yuksek ortalama notu 
 listeleyen bir QUERY yazin.
=========================================================
 */

 -- Answer
 SELECT isim,soyisim,ders_adi,
(SELECT MAX(ortalama_not) FROM dbo.dersler 
 WHERE dbo.ogretmenler.ogretmen_id = dbo.dersler.ogretmen_id) -- Eşleştirme
 AS 'Verdiği En Fazla Not'
 FROM dbo.ogretmenler;


  /*  
========================  ORNEK  ========================
 Her bir ogretmenin, ismini, soyismini, bransini 
 ve dersini alan kac ogrenci oldugunu listeleyen bir QUERY yazin.
=========================================================
 */

 --Answer
 SELECT isim,soyisim,ders_adi,
 (SELECT COUNT(ogrenci_no) FROM dbo.dersler
 WHERE dbo.ogretmenler.ogretmen_id = dbo.dersler.ogretmen_id)
 AS 'Dersi Alan Öğrenci Sayısı'
 FROM dbo.ogretmenler;


  /*  
========================  ORNEK  ========================
 Matematik anlatan ogretmenlerin, ismini, soyismini, bransini 
 ve dersini alan kac ogrenci oldugunu listeleyen bir QUERY yazin.
=========================================================
 */

 -- Answer
 SELECT isim,soyisim,ders_adi,
 (SELECT COUNT(ogrenci_no) FROM dbo.dersler
 WHERE dbo.ogretmenler.ogretmen_id = dbo.dersler.ogretmen_id)
 AS 'Öğrenci Sayisi'
 FROM dbo.ogretmenler
 WHERE ders_adi = 'Matematik';


  /*  
========================  ORNEK  ========================
 Her bir ogrencinin ismini, soyismini ve kac ders aldigini yazdirin.
=========================================================
 */

 --Answer
 SELECT isim,soyisim,
 (SELECT COUNT(ogrenci_no) FROM dbo.dersler
 WHERE dbo.ogrenci.ogrenci_no = dbo.dersler.ogrenci_no)
 AS 'Aldıgı Ders Sayisi'
 FROM dbo.ogrenci;


  /*  
========================  ORNEK  ========================
 Soyadi Kaya olan ogrencilerin ismini, soyismini 
 ve aldigi tum derslerin genel not ortalamasini yazdirin.
=========================================================
 */
 
 --Answer
 SELECT isim,soyisim,
 (SELECT AVG(ortalama_not) FROM dbo.dersler
 WHERE dbo.ogrenci.ogrenci_no = dbo.dersler.ogrenci_no)
 FROM dbo.ogrenci
 WHERE soyisim = 'Kaya';


  /*  
========================  ORNEK  ========================
 ismi c ile l arasinda olan ogrencilerin ismini, soyismini 
 ve aldigi dersler icinde en yuksek ortalamaya sahip olan dersin notunu yazdirin.
=========================================================
 */

 --Answer
 SELECT isim,soyisim,
 (SELECT MAX(ortalama_not) FROM dbo.dersler
 WHERE dbo.ogrenci.ogrenci_no = dbo.dersler.ogrenci_no)
 AS 'Max Not Ortalmasi'
 FROM dbo.ogrenci
 WHERE isim BETWEEN 'c' AND 'l';


 /* 
======================== EXISTS CONDITION (MSSQL) ==========================
EXISTS ifadesi Microsoft SQL Server'da alt sorgular (subquery) ile kullanılır.

Alt sorgunun herhangi bir kayıt döndürüp döndürmediğini kontrol eder.
Eğer alt sorgu en az 1 satır döndürürse EXISTS TRUE olur ve işlem gerçekleşir.

IN ifadesine benzer şekilde çalışır ancak EXISTS performans açısından
özellikle büyük veri setlerinde daha verimlidir.

NOT EXISTS ise alt sorgu hiç kayıt döndürmezse TRUE olur.

EXISTS: Alt sorguda en az bir satır varsa TRUE (VAR) döner.
NOT EXISTS: Alt sorgu hiç satır döndürmezse TRUE (YOK) döner.
=============================================================================
*/

 

 
 /*  
========================  ORNEK  ========================
 Nisan_satislar ve mayis satislar iki tablo oluşturup null olmayan kayitlar ekleyin.
=========================================================
 */

 CREATE TABLE mayis_satislar
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO mayis_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mayis_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mayis_satislar VALUES (20, 'John', 'Toyota');
INSERT INTO mayis_satislar VALUES (30, 'Amy', 'Ford');
INSERT INTO mayis_satislar VALUES (20, 'Mark', 'Toyota');
INSERT INTO mayis_satislar VALUES (10, 'Adem', 'Honda');
INSERT INTO mayis_satislar VALUES (40, 'John', 'Hyundai');
INSERT INTO mayis_satislar VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan_satislar
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan_satislar VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');


/*  
========================  ORNEK  ========================
 Her iki ayda da ayni id ile satilan urunlerin 
 urun_id'lerini ve urunleri mayis ayinda alanlarin isimlerini 
 getiren bir query yaziniz.
=========================================================
 */

 --Answer
 
 SELECT musteri_isim , urun_id
 FROM dbo.mayis_satislar
 WHERE EXISTS(SELECT urun_id
					FROM dbo.nisan_satislar
					WHERE dbo.nisan_satislar.urun_id = dbo.mayis_satislar.urun_id);


 /*  
========================  ORNEK  ========================
 mayis ayinda olup, nisan ayinda olmayan id'leri 
 ve mayis ayinda o urunu alan müşteri isimlerini görüntüleyin.
=========================================================
 */

 SELECT musteri_isim,urun_id
 FROM dbo.mayis_satislar
 WHERE NOT EXISTS (SELECT urun_id
					FROM dbo.nisan_satislar
					WHERE dbo.nisan_satislar.urun_id = dbo.mayis_satislar.urun_id);
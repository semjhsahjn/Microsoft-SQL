/*
====================== UNION (MSSQL) ======================

UNION, birden fazla SELECT sorgusunun sonuçlarını
tek bir liste halinde birleştirmek için kullanılır.

NOT:
- UNION, verilerin mantıksal ilişkisine bakmaz.
- Sadece sütun sayısının eşit ve veri tiplerinin uyumlu olmasını kontrol eder.
- Tekrarlı kayıtları otomatik olarak kaldırır.
- Mantıksız sorgular birleştirilirse anlamsız sonuçlar oluşabilir.

UNION ALL ise:
- Tekrarlı kayıtları kaldırmaz.
- Daha hızlı çalışır.

Syntax:
---------------------------------------
SELECT sutun1, sutun2 FROM tablo1
UNION
SELECT sutun1, sutun2 FROM tablo2;

=========================================================
*/

/*  
========================  ORNEK  ========================
 Nisan ve mayis aylarinda Toyota alan müşteri isimlerini listeleyin.
=========================================================
 */

 SELECT musteri_isim FROM dbo.nisan_satislar WHERE urun_isim = 'Toyota'
 UNION 
 SELECT musteri_isim FROM dbo.mayis_satislar WHERE urun_isim = 'Toyota';

 /*  
========================  ORNEK  ========================
 Nisan ayindaki müşterileri ve mayis ayinda satilan urun isimlerini 
 alt alta listeleyin.
=========================================================
 */
 -- Sütun adı olarak otomatikmen ilk sorgu daki ismi alır
 SELECT musteri_isim FROM dbo.nisan_satislar
 UNION 
 SELECT urun_isim FROM dbo.mayis_satislar;

  /*  
=========================  NOT  =========================
 UNION, ile birleştirilecek sorgular mantıklı seçilmezse, 
 anlamsız tablolar oluşabilir. 
=========================================================
 */ 


 /*  
========================  ORNEK  ========================
 Nisan ve mayis aylarinda satilan urun isimlerini listeleyin.
=========================================================
 */

 SELECT	urun_isim AS 'Nisan ve mayis aylarinda satilan urun isimleri' 
 FROM dbo.nisan_satislar 
 UNION 
 SELECT urun_isim FROM dbo.mayis_satislar;

  /*  
=========================  NOT  =========================
 UNION, ile birleştirilen sorgulardaki tekrar eden değerleri getirmez, 
 tüm değerler unique olarak gelir. 
 Eğer tekrar eden tüm kayıtlar istenirse  UNION ALL kullanılmalıdır.
=========================================================
 */   

 /*  
========================  ORNEK  ========================
 Nisan ve mayis aylarinda satilan urun isimlerini tekrarlari ile birlikte listeleyin.
=========================================================
 */

 SELECT	urun_isim FROM dbo.nisan_satislar 
 UNION ALL
 SELECT urun_isim FROM dbo.mayis_satislar;

 /*  
========================  ORNEK  ========================
 Nisan ayindaki müşterileri ve aldiklari urun_isim'lerini 
 ve mayis ayinda satilan urunlerin urun_id'lerini listeleyin.
=========================================================
 */

 SELECT musteri_isim, urun_isim
 FROM nisan_satislar
 UNION
 SELECT urun_id
 FROM mayis_satislar;
  /*  
=========================  NOT  =========================
UNION, ile birleştirilen sorgulardan gelen sutun sayilari esit 
ve data turleri uyumlu olmalidir.
UNION kullanırken iki SELECT’in kolon sayısı ve veri tipleri aynı olmalıdır; aksi halde hata oluşur.
=========================================================
 */     


 /*  
========================  ORNEK  ========================
 Nisan ve mayis ayinda Honda alan müşteri isimlerini sirali olarak listeleyin.
=========================================================
 */

 SELECT musteri_isim FROM dbo.nisan_satislar WHERE urun_isim = 'Honda'
 UNION ALL
 SELECT musteri_isim FROM dbo.mayis_satislar WHERE urun_isim = 'Honda'
 ORDER BY musteri_isim;


  /*  
=========================  NOT  =========================
 UNION, ile birleştirilen sorgular sirali olarak görmek istenirse 
 en sonda ORDER BY kullanılabilir.
=========================================================
 */   


 /*  
========================  ORNEK  ========================
 Ogrenci, personel ve people tablolarinda var olan isimleri 
 tekrarsiz ve sirali olarak listeleyin.
=========================================================
 */

 SELECT isim AS isimler FROM dbo.ogrenci
 UNION
 SELECT adi FROM dbo.personel
 UNION
 SELECT isim FROM dbo.people
 ORDER BY isimler;
 



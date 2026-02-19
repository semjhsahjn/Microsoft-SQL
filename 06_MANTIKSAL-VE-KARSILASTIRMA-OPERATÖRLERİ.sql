 -- Karsilastirma Operatorleri

  /*  
========================  ORNEK  ========================
 People tablosunda yasi 30’dan buyuk olan kişilerin bilgilerini listeleyin.
=========================================================
 */

 SELECT * FROM dbo.people
 WHERE yas > 30;

  /*  
========================  ORNEK  ========================
 People tablosunda ismi 'emre’ isminden sonra gelen kişilerin isimlerini listeleyin.
=========================================================
 */

 SELECT isim FROM dbo.people
 WHERE isim > 'emre';


  /*  
========================  ORNEK  ========================
 People tablosunda sehir ismi 'D' den sonra olan sehirlerde yasayan kisilerin 
 isim ve soyisim  bilgilerini listeleyin.
=========================================================
 */

 SELECT isim,soyisim FROM dbo.people
 WHERE isim > 'D';

 /*  
========================  ORNEK  ========================
 People tablosunda yasi 35 den kucuk veya 35'e esit olan kişilerin bilgilerini listeleyin.
=========================================================
 */

 SELECT * FROM dbo.people
 WHERE yas >= 35;


  /*  
========================  ORNEK  ========================
 People tablosunda sehri Trabzon olmayan kişilerin bilgilerini listeleyin.
=========================================================
 */

 SELECT * FROM dbo.people
 WHERE sehir != 'Trabzon';


  /*  
========================  ORNEK  ========================
 People tablosunda soyismi Gunes olmayan kişilerin bilgilerini listeleyin
=========================================================
 */

 SELECT * FROM dbo.people
 WHERE soyisim != 'Güneş';


  
 /*  
========================  ORNEK  ========================
 People tablosunda 29 yaşından büyük olan ve Ankara'da yaşayan kişileri listeleyin.
=========================================================
 */

 SELECT * FROM dbo.people
 WHERE yas > 29 AND sehir = 'Ankara';

  /*  
========================  ORNEK  ========================
People tablosunda Adı 'Fatma' olan ve Bursa'da yaşayan kişilerin yasini listeleyin
=========================================================
 */

 SELECT yas FROM dbo.people
 WHERE isim = 'Fatma' AND sehir = 'Bursa';


  /*  
========================  ORNEK  ========================
 People tablosunda ismi 'Ayse’ veya soyismi 'Kaya' olan kişileri listeleyin
=========================================================
 */

 SELECT * FROM dbo.people
 WHERE isim = 'Ayse' AND soyisim = 'Kaya';
 
  /*  
========================  ORNEK  ========================
 People tablosunda ismi 'Ayse’ veya soyismi 'Kaya' olan kişileri listeleyin
=========================================================
 */
 
 SELECT * FROM dbo.people
 WHERE isim = 'Ayse' OR soyisim = 'Kaya';


  /*  
========================  ORNEK  ========================
 People tablosunda yaşı 22 veya 35 olan kişileri listeleyin
=========================================================
 */

 SELECT * FROM dbo.people
 WHERE yas = 22 OR yas = 35;


  /*  
========================  ORNEK  ========================
 People tablosunda 29 yaşından büyük olan veya Ankara'da yaşayan kişileri listeleyin
=========================================================
 */

 SELECT * FROM dbo.people
 WHERE yas > 29 OR sehir = 'Ankara';
 
  /*  
========================  ORNEK  ========================
 People tablosunda İstanbul, Ankara veya İzmir'de yaşayan kişileri listeleyin
=========================================================
 */

 SELECT * FROM dbo.people
 WHERE sehir IN('İstanbul','Ankara','İzmir');


   /* 
===============================================
                   BETWEEN
===============================================
 BETWEEN (Arasında): Bir aralıktaki değerleri seçmek için kullanılır
 */

  /*  
========================  ORNEK  ========================
 People tablosunda yaşı 25 ile 35 arasında olan kişileri listeleyin.
=========================================================
 */
 SELECT * FROM dbo.people
 WHERE yas BETWEEN 25 AND 35;


  /*  
========================  ORNEK  ========================
 People tablosunda yaşı 25 ile 35 arasında olan ve Ankara'da yaşayan kişileri listeleyin.
=========================================================
 */

 SELECT * FROM dbo.people
 WHERE (yas BETWEEN 25 AND 35) AND sehir = 'Ankara';


  /*  
========================  ORNEK  ========================
 People tablosunda ismi Adem ile Aylin arasında olan ve Ankara'da yaşayan kişileri listeleyin.
=========================================================
 */

 SELECT * FROM dbo.people
 WHERE (isim BETWEEN 'Adem' AND 'Aylin') AND sehir = 'Ankara';


 /*  
========================  ORNEK  ========================
 People tablosunda ismi K ile T arasında olmayan kişileri listeleyin.
=========================================================
 */

 SELECT * FROM dbo.people
 WHERE isim NOT BETWEEN 'K' AND 'T';



  /*
===============================================
                  IN OPERATORU
===============================================

 Belirli bir sütunun değerlerini, verilen bir listedeki değerler ile karşılaştırmak için kullanılır
 */

 /*  
========================  ORNEK  ========================
 People tablosunda İstanbul, Ankara veya İzmir'de yaşayan kişileri listeleyin.
=========================================================
 */
 SELECT * FROM dbo.people
 WHERE sehir IN('İstanbul','Ankara','İzmir');

   /*  
========================  ORNEK  ========================
 People tablosunda adı 'Ahmet', 'Mehmet' veya 'Ayşe' olan kişileri listeleyin.
=========================================================
 */
 SELECT * FROM dbo.people
 WHERE isim IN('Ahmet','Mehmet','Ayşe');

  /*
===============================================
        Mantiksal Operatorler / NOT
===============================================
 
 Bir koşulun sonucunu tersine çevirmek için kullanılır. 
 */

   /*  
========================  ORNEK  ========================
  Kisiler tablosundan  İstanbul'da yaşamayan kişileri listeleyiniz.

=========================================================
 */
 SELECT * FROM dbo.people
 WHERE sehir != 'İstanbul';


   /*  
========================  ORNEK  ========================
 people tablosundan 30 yaşından büyük olmayan kişileri listeleyiniz.
=========================================================
 */

 SELECT * FROM dbo.people
 WHERE NOT yas > 30;
  

    /*  
========================  ORNEK  ========================
 people tablosundan soyadı 'Yılmaz' veya 'Kara' olmayan kişileri listeleyiniz.
=========================================================
 */ 

 SELECT * FROM dbo.people
 WHERE NOT soyisim IN('Yılmaz','Kara');



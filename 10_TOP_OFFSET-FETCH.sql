/*
===============================================
		    TOP,OFFSET-FETCH
===============================================

ASC → Küçükten büyüğe (eski → yeni)

DESC → Büyükten küçüğe (yeni → eski)

OFFSET → Kaç satır atlanacak

FETCH → Kaç satır getirilecek

 */


  /*  
========================  ORNEK  ========================
 Kitaplik tablosundaki en yeni 3 Kitabı listeleyin.
=========================================================
 */

 SELECT * FROM dbo.kitaplik
 ORDER BY yayin_yili DESC
 OFFSET 0 ROWS
 FETCH NEXT 3 ROWS ONLY;


 SELECT TOP 3 * FROM dbo.kitaplik
 ORDER BY yayin_yili DESC;



  /*  
========================  ORNEK  ========================
 Kitaplik tablosundan rastgele 3 kitap secip listeleyiniz.
=========================================================
 */
 -- NEWID() her çalıştığında benzersiz ve rastgele bir kimlik (GUID) üretir.
 SELECT * FROM dbo.kitaplik
 ORDER BY NEWID()
 OFFSET 0 ROWS
 FETCH NEXT 3 ROWS ONLY;

  /*  
========================  ORNEK  ========================
 Kitaplik tablosundaki en eski iki kitabi listeleyin
=========================================================
 */

 SELECT * FROM dbo.kitaplik
 ORDER BY yayin_yili ASC
 OFFSET 0 ROWS
 FETCH NEXT 2 ROWS ONLY;


  /*  
========================  ORNEK  ========================
 Kitaplik tablosundan yazari 'Fyodor Dostoyevski' olan kitapları 
 en fazla 2 tane olacak sekilde listeleyin
=========================================================
 */

 SELECT * FROM dbo.kitaplik
 WHERE yazar = 'Fyodor Dostoyevski'
 ORDER BY NEWID()
 OFFSET 0 ROWS
 FETCH NEXT 2 ROWS ONLY;

/*  
========================  ORNEK  ========================
 Kitaplik tablosundan yazari 'Fyodor Dostoyevski' olan kitapları 
 en fazla 2 tane olacak sekilde 
 eskiden yeniye dogru sirali olarak listeleyin.
=========================================================
 */

 SELECT * FROM dbo.kitaplik
 WHERE yazar = 'Fyodor Dostoyevski'
 ORDER BY yayin_yili ASC 
 OFFSET 0 ROWS
 FETCH NEXT 2 ROWS ONLY;

  /*  
========================  ORNEK  ========================
 Kitaplik tablosundaki yayın yılına göre sıralanmış kitapların 
 3. sayfasını listeleyin.
 NOT : Her sayfanin boyutu 3 kitap ile sinirlidir. 
 (yani bizden 7., 8. ve 9. kitaplar isteniyor).
=========================================================
 */

 SELECT * FROM dbo.kitaplik
 ORDER BY yayin_yili ASC
 OFFSET 6 ROWS 
 FETCH NEXT 3 ROWS ONLY;


  /*  
========================  ORNEK  ========================
 Kitaplik tablosundaki yayın yılına göre sıralanmış kitapların 
 4. sayfasını listeleyin.
 NOT : Her sayfanin boyutu 2 kitap ile sinirlidir. 
       (yani bizden 7. ve 8.  kitaplar isteniyor).
=========================================================
 */

 SELECT * FROM dbo.kitaplik
 ORDER BY yayin_yili ASC
 OFFSET 6 ROWS 
 FETCH NEXT 2 ROWS ONLY;

  /*  
========================  ORNEK  ========================
 Kitaplik tablosundaki yayin yili 1950'den once olan kitaplarin 
 1. sayfasını listeleyiniz.
 NOT : Her sayfanin boyutu 4 kitap ile sinirlidir.
=========================================================
 */

 SELECT * FROM dbo.kitaplik
 WHERE yayin_yili < 1950
 ORDER BY yayin_yili ASC
 OFFSET 0 ROWS 
 FETCH NEXT 4 ROWS ONLY;

 
 /*  
========================  ORNEK  ========================
 Kitaplik tablosundaki yayin yili 1950'den once olan kitaplari 
 alfabetik siraya gore siralayip 1. sayfasını listeleyiniz.
 NOT : Her sayfanin boyutu 4 kitap ile sinirlidir.
=========================================================
 */
 
 SELECT * FROM dbo.kitaplik
 WHERE yayin_yili < 1950
 ORDER BY kitap_adi ASC
 OFFSET 0 ROWS 
 FETCH NEXT 4 ROWS ONLY;



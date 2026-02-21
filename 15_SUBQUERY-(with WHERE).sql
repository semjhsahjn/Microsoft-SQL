/*
================================= SUBQUERY (WHERE ile) =================================
    Subquery (alt sorgu), bir sorgunun içinde yer alan 
    ve genellikle SELECT, FROM veya WHERE ifadelerinde kullanılan başka bir sorgudur. 
    
    Alt sorgu, dış sorguya veri sağlamak için çalışır. 
    Genellikle filtreleme, karşılaştırma veya hesaplama işlemleri için kullanılır.
*/


 /*  
========================  ORNEK  ========================
 Okul veri tabanında matematik dersi alan
 öğrenci isim ve soy isimlerini yazdırın.
=========================================================
 */

 SELECT ogrenci_no 
 FROM dbo.dersler
 WHERE ders_adi = 'Matematik';

-- 101 103 109 118 129 141 118 151 (Matematik Dersi alan öğrencilerin ogrenci_no ları)

--Answer
SELECT isim,soyisim 
FROM dbo.ogrenci
WHERE ogrenci_no IN( SELECT ogrenci_no 
                     FROM dbo.dersler
                     WHERE ders_adi = 'Matematik');


 /*  
========================  ORNEK  ========================
 Ornek :  okul veri tabaninda herhangi bir derste
 notu 85'den fazla olan ogrencilerin 
 isim ve soyisimlerini yazdirin.
 Bir ogrenci birden fazla dersten yuksek not almissa
 tekrar yazilmasin
=========================================================
 */

 SELECT DISTINCT ogrenci_no 
 FROM dbo.dersler
 WHERE ortalama_not > 85;

-- Herhangi bir dersden ortalama notu 85 den Yuksek olan benzersiz ogrenciler numarası
--101 103 112 123 129 131 157 160 145 137

--Answer
SELECT isim,soyisim 
FROM dbo.ogrenci
WHERE ogrenci_no IN ( SELECT DISTINCT ogrenci_no 
                      FROM dbo.dersler
                      WHERE ortalama_not > 85);

 /*  
========================  ORNEK  ========================
 okul veri tabaninda matematik dersinden
 en yüksek not ortalamasina sahip ogrencinin 
 isim ve soyismini yazdirin.
=========================================================
 */

 SELECT ogrenci_no
 FROM dbo.dersler
 WHERE ders_adi = 'Matematik'
 ORDER BY ortalama_not DESC 
 OFFSET 0 ROWS
 FETCH NEXT 1 ROWS ONLY;

 -- Matematik dersin'de en yüksek ortalamaya sahip öğrencinin numarası
 -- 129

 SELECT isim,soyisim 
 FROM dbo.ogrenci
 WHERE ogrenci_no =  (SELECT ogrenci_no
                     FROM dbo.dersler
                     WHERE ders_adi = 'Matematik'
                     ORDER BY ortalama_not DESC 
                     OFFSET 0 ROWS
                     FETCH NEXT 1 ROWS ONLY);

 /*  
========================  ORNEK  ========================
 okul veri tabaninda Zeynep Demir hocadan ders alan
 ogrencilerin sayisini yazdirin.
=========================================================
 */

 SELECT ogretmen_id
 FROM dbo.ogretmenler
 WHERE isim = 'Zeynep' AND soyisim = 'Demir';

 -- Zeynep Demir hocanın ogretmen_id ' si
 -- 12

 --Answer
 SELECT COUNT(DISTINCT ogrenci_no) AS 'Zeynep Demir Hocadan Ders Alan Öğrenci Sayisi'
 FROM dbo.dersler
 WHERE ogretmen_id = (SELECT ogretmen_id
                     FROM dbo.ogretmenler
                     WHERE isim = 'Zeynep' AND soyisim = 'Demir');


                      
                      /*  
========================  ORNEK  ========================
 okul veri tabaninda 129 numarali ogrencinin ingilizce hocasinin 
 ismini ve soyismini yazdirin.
=========================================================
 */

 SELECT ogretmen_id 
 FROM dbo.dersler
 WHERE ogrenci_no = 129 AND ders_adi = 'İngilizce';
-- ogretmen_id =  17

--Answer
 SELECT isim,soyisim
 FROM dbo.ogretmenler
 WHERE ogretmen_id = ( SELECT ogretmen_id 
                       FROM dbo.dersler
                       WHERE ogrenci_no = 129 AND ders_adi = 'İngilizce');


 /*  
========================  ORNEK  ========================
 okul veri tabaninda bir dersten bir ogrencinin aldigi
 en yuksek notu bulun
 bu notu veren hocanin ismini ve soyismini yazdirin.
=========================================================
 */

 SELECT ogretmen_id
 FROM dbo.dersler
 ORDER BY ortalama_not DESC
 OFFSET 0 ROWS 
 FETCH NEXT 1 ROWS ONLY;

 -- En yüksek nota sahip öğrencinin ogretmeninin id'si
 -- 14

 --Answer
 SELECT isim,soyisim
 FROM dbo.ogretmenler
 WHERE ogretmen_id = (SELECT ogretmen_id
                     FROM dbo.dersler
                     ORDER BY ortalama_not DESC
                     OFFSET 0 ROWS 
                     FETCH NEXT 1 ROWS ONLY);


-- Matematik dersini alan öğrencilerin
-- isim ve soyisimlerini listeleyiniz.
-- (Dersler tablosundan → Ogrenci)

SELECT DISTINCT ogrenci_no 
FROM dbo.dersler
WHERE ders_adi = 'Matematik';

-- herhangi bir Matematik dersini alan öğrencilerin ogrenci_no ları
-- 101 103 109 118 129 141 151

--Answer
SELECT isim,soyisim
FROM dbo.ogrenci
WHERE ogrenci_no IN(SELECT DISTINCT ogrenci_no 
                    FROM dbo.dersler
                    WHERE ders_adi = 'Matematik');

-- Notu 90’dan büyük olan dersleri alan öğrencilerin
-- isimlerini getiriniz.

SELECT DISTINCT ogrenci_no 
FROM dbo.dersler
WHERE ortalama_not > 90;

-- Notu 90'dan büyük olan ogreniclerin numarası 103 129 131

--Answer
SELECT isim 
FROM dbo.ogrenci
WHERE ogrenci_no IN (SELECT DISTINCT ogrenci_no 
                    FROM dbo.dersler
                    WHERE ortalama_not > 90);



-- Kimya dersini veren öğretmenin adını ve soyadını bulunuz.

SELECT DISTINCT ogretmen_id 
FROM dbo.dersler
WHERE ders_adi = 'Kimya';

-- Kimya dersini veren öğretmenin id'si -> 16

--Answer
SELECT isim,soyisim
FROM dbo.ogretmenler
WHERE ogretmen_id IN(SELECT DISTINCT ogretmen_id           
                        FROM dbo.dersler
                        WHERE ders_adi = 'Kimya');


-- Ankara / Çankaya’da oturan öğrencilerin isimlerini listeleyiniz.

SELECT DISTINCT ogrenci_no 
FROM dbo.adresler
WHERE sehir = 'Ankara' AND ilce = 'Çankaya';

-- Ankara Çankayada oturan ogrencilerin numaraları
-- 101 109 123 137 151

--Answer
SELECT isim
FROM dbo.ogrenci
WHERE ogrenci_no IN(SELECT DISTINCT ogrenci_no 
                    FROM dbo.adresler
                    WHERE sehir = 'Ankara' AND ilce = 'Çankaya');



-- Hiç Matematik dersi almamış öğrencileri bulunuz.

SELECT ogrenci_no 
FROM dersler 
WHERE ders_adi = 'Matematik';

-- Matematik Dersini alan öğrencilerin no ları
-- 101 103 109 118 129 141 118 151

-- Answer
SELECT isim,soyisim 
FROM dbo.ogrenci 
WHERE ogrenci_no NOT IN (SELECT DISTINCT ogrenci_no 
                    FROM dbo.dersler
                    WHERE ders_adi = 'Matematik');
/*
======================== HAVING ======================= 

 HAVING, GROUP BY ile gruplandırılmış sonuçlar üzerinde 
 koşul belirlemek için kullanılır.

 Yeni oluşturulan (örneğin GROUP BY ile türetilen) 
 alanlar üzerinde filtreleme yapılacaksa, 
 HAVING cümleciği kullanılmalıdır; 
 çünkü WHERE yalnızca veri tabanında doğrudan var olan alanlar için filtreleme yapar.
 
 
SQL çalışma sırası kabaca şöyledir:
FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
===============================================================
*/

-- market tablosunda ortalama satis fiyati 30 TL uzerinde olan urunleri
-- ve sarti saglayan her bir urunun ortalama fiyatini listeleyin

SELECT urun_adi , AVG(satis_fiyati) AS ortalama_satis
FROM dbo.market
GROUP BY urun_adi
HAVING AVG(satis_fiyati) > 30;

--SQL Server’da HAVING içinde alias kullanılamaz;
--aggregate fonksiyonun kendisi yazılmalıdır
--(çünkü HAVING, SELECT’ten önce çalışır).




-- market tablosunda toplam satis geliri 500 TL uzerinde olan urunleri
-- ve sarti saglayan her bir urunun toplam satis gelirini listeleyin

SELECT urun_adi , SUM(miktar_kg * satis_fiyati) AS ToplamGelir
FROM dbo.market
GROUP BY urun_adi
HAVING SUM(miktar_kg * satis_fiyati) > 500
-- ekstra
ORDER BY ToplamGelir DESC;


/*  
========================  ORNEK  ========================
 Icerisinde id, isim, sehir ve maas field'lari olan 
 isciler tablosu oluşturun ve içine null olmayan değerler ekleyin.
=========================================================
 */

 CREATE TABLE isciler
(
	id int,
	isim varchar(50),
    sehir varchar(20),
    maas int,
	sirket varchar(20)
);

INSERT INTO isciler VALUES 
(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'),
(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'),
(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'),
(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'),
(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'),
(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford'),
(123456710, 'Hatıce Sahin', 'Bursa', 4500, 'Honda');


 /*  
========================  ORNEK  ========================
 Şirketlere göre toplam isçi sayısını listeleyin.
=========================================================
 */

 SELECT sirket, COUNT(id) AS 'Çalışan Sayısı'
 FROM dbo.isciler
 GROUP BY sirket;

  /*  
========================  ORNEK  ========================
 İşçi sayısı 1'den büyük olan şirketleri listeleyin.
=========================================================
 */

 SELECT sirket, COUNT(id) AS 'Çalışan Sayısı'
 FROM dbo.isciler
 GROUP BY sirket
 HAVING  COUNT(id) > 1;

  /*  
========================  ORNEK  ========================
 toplam geliri 8000 liradan fazla olan isimleri gösteren sorgu yazın. 
 İsimleri gruplandırarak soruyu çözümleyin.
=========================================================
 */

 SELECT isim,SUM(maas)
 FROM dbo.isciler
 GROUP BY isim
 HAVING SUM(maas) > 8000;


  /*  
========================  ORNEK  ========================
 Eğer bir şehirde alınan MAX maaş 5000'den düşükse 
 şehir ismini ve MAX maaşı veren sorgu yazın.
=========================================================
 */

 SELECT sehir , MAX(maas) AS sehir_maas
 FROM dbo.isciler
 GROUP BY sehir
 HAVING MAX(maas) < 5000;


  /*  
========================  ORNEK  ========================
 Eğer bir şehirde alınan MAX maaş 3500'den büyükse 
 şehir ismi 'I' harfi ile başlıyorsa o şehirleri 
 ve MAX maaşı, maaş ters sıralı veren sorgu yazın.
=========================================================
 */

 SELECT sehir, MAX(maas) AS sehir_maas
 FROM dbo.isciler
 WHERE sehir LIKE 'I%'
 GROUP BY sehir
 HAVING  MAX(maas)  > 3500
 ORDER BY  sehir_maas DESC;






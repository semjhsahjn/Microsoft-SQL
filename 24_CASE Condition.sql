/*
---------- CASE Condition ----------

SQL’de CASE yapısı, sorgular içerisinde koşullu işlem yapmamızı sağlayan bir karar mekanizmasıdır.
Belirtilen şartlar sırayla kontrol edilir ve doğru olan ilk koşulun sonucu döndürülür.
Eğer hiçbir koşul sağlanmazsa ELSE bloğu çalışır.
Koşulların doğru sırada yazılması önemlidir çünkü SQL ilk sağlanan şartta işlemi durdurur.

CASE Syntax
CASE
    WHEN koşul1 THEN sonuç1
    WHEN koşul2 THEN sonuç2
    ELSE sonuç3
END
*/

CREATE TABLE SirketPersonel_Ornek (
    PersonelID INT PRIMARY KEY,
    Ad VARCHAR(50),
    Departman VARCHAR(50),
    Maas INT,
    Sehir VARCHAR(50),
    DeneyimYil INT
);

INSERT INTO SirketPersonel_Ornek VALUES
(1, 'Ahmet', 'Yazilim', 60000, 'Istanbul', 8),
(2, 'Mehmet', 'Muhasebe', 32000, 'Ankara', 3),
(3, 'Ayse', 'Yazilim', 45000, 'Istanbul', 5),
(4, 'Fatma', 'IK', 28000, 'Izmir', 2),
(5, 'Ali', 'Satis', 52000, 'Bursa', 7),
(6, 'Zeynep', 'Yazilim', 30000, 'Ankara', 1),
(7, 'Emre', 'Muhasebe', 70000, 'Istanbul', 10),
(8, 'Can', 'Satis', 26000, 'Izmir', 1),
(9, 'Elif', 'IK', 48000, 'Ankara', 6),
(10, 'Burak', 'Yazilim', 35000, 'Bursa', 4),
(11, 'Merve', 'Satis', 39000, 'Istanbul', 3),
(12, 'Hakan', 'Muhasebe', 55000, 'Izmir', 9),
(13, 'Ceren', 'Yazilim', 27000, 'Ankara', 2),
(14, 'Tolga', 'Satis', 61000, 'Istanbul', 8),
(15, 'Gizem', 'IK', 33000, 'Bursa', 4);

-- SELECT Çözümleri
/*
Personelleri maaşlarına göre sınıflandır:
60000 ve üzeri → 'A Seviyesi'
40000 – 59999 → 'B Seviyesi'
40000 altı → 'C Seviyesi'
Ad, Maas ve yeni oluşturacağın seviye sütunu birlikte gelsin.
*/

SELECT Ad,Maas, -- İstenilen Sütunlar
    CASE 
        WHEN Maas >= 60000 THEN 'A seviyesi' -- Maas 60 binden Çoksa A
        WHEN Maas >= 40000 THEN 'B seviyesi' -- Maas 40 binden Çoksa B
        ELSE 'C seviyesi'                    -- Maas 40 bin altıysa C
    END AS MaasSeviyesi -- Sütun Adı
FROM dbo.SirketPersonel_Ornek;


/*
DeneyimYil’e göre personelleri sınıflandır:
0–2 yıl → 'Junior'
3–6 yıl → 'Mid'
7 yıl ve üzeri → 'Senior'
Tüm sütunlar gelsin, ayrıca yeni unvan sütunu eklensin.
*/

SELECT *,
    CASE
        WHEN DeneyimYil >= 7 THEN 'Senior'
        WHEN DeneyimYil >= 3 THEN 'Mid'
        ELSE 'Junior'
    END AS yeni_unvan
FROM dbo.SirketPersonel_Ornek;
    


/*
Şehre göre bölge sınıflandırması yap:
Istanbul → 'Marmara'
Bursa → 'Marmara'
Ankara → 'Ic Anadolu'
Diğerleri → 'Diger'
Ad, Sehir bilgisi gelsin.
*/

SELECT Ad,Sehir,
        CASE
            WHEN Sehir = 'Istanbul' THEN 'Marmara'
            WHEN Sehir = 'Bursa' THEN 'Marmara'
            WHEN Sehir = 'Ankara' THEN 'Ic Anadolu'
            ELSE 'Diger'
            END AS Bölgeler
FROM dbo.SirketPersonel_Ornek;


-- UPDATE Çözümleri
/*
Deneyimi 5 yıl ve üzeri olanlara 5000 TL zam yap.
Diğerlerinin maaşı değişmesin.
*/
UPDATE dbo.SirketPersonel_Ornek
    SET Maas = 
        CASE 
            WHEN DeneyimYil >= 5 THEN Maas + 5000
            ELSE Maas
        END;

        SELECT * FROM dbo.SirketPersonel_Ornek;

/*
Maaşı 30000’in altında olanları 30000’e sabitle.
Diğerlerine dokunma.
*/
UPDATE dbo.SirketPersonel_Ornek
    SET Maas =
        CASE
            WHEN Maas < 30000 THEN 30000
            ELSE Maas
            END;

            SELECT * FROM dbo.SirketPersonel_Ornek;
/*
Departmanı 'Satis' olanların maaşını %10 artır.
Diğerleri aynı kalsın.
*/

UPDATE dbo.SirketPersonel_Ornek
    SET Maas =
        CASE 
            WHEN Departman = 'Satis' THEN Maas * 1.10
            ELSE Maas
            END;

            SELECT * FROM dbo.SirketPersonel_Ornek;
-- Aslında burada da CASE’e gerek yok:
/*
UPDATE SirketPersonel_Ornek
SET Maas = Maas * 1.10
WHERE Departman = 'Satis';
*/



-- ORDER BY – Özel Sıralama
/*
Departman sırası şöyle olsun:
Yazilim
Muhasebe
IK
Satis
Bu sıraya göre listele.
*/

SELECT * 
FROM dbo.SirketPersonel_Ornek
ORDER BY 
        CASE 
            WHEN Departman = 'Yazilim' THEN 1
            WHEN Departman = 'Muhasebe' THEN 2
            WHEN Departman = 'IK' THEN 3
            ELSE 4
            END,
        Departman ASC;

        SELECT * FROM dbo.SirketPersonel_Ornek;


/*
SirketPersonel_Ornek tablosundaki personelleri:
Önce Senior (DeneyimYil ≥ 7)
Sonra Mid (3–6 yıl arası)
En son Junior (0–2 yıl)
gelecek şekilde sırala.
*/

SELECT *
    FROM dbo.SirketPersonel_Ornek
    ORDER BY 
        CASE    
            WHEN DeneyimYil >= 7 THEN 1
            WHEN DeneyimYil >= 3 THEN 2
            ELSE 3
            END,
    DeneyimYil DESC;
 

 -- GROUP BY – Koşullu Gruplama
/*
Maaşa göre iki grup oluştur:
50000 ve üzeri → 'Yuksek Gelir'
Altı → 'Normal Gelir'
Her grubun kişi sayısını getir.
*/

SELECT 
    CASE 
        WHEN Maas >= 50000 THEN 'Yuksek Gelir'
        ELSE 'Normal Gelir'
    END AS GelirDurumu,
    COUNT(*) AS KisiSayisi
FROM dbo.SirketPersonel_Ornek
GROUP BY 
    CASE 
        WHEN Maas >= 50000 THEN 'Yuksek Gelir'
        ELSE 'Normal Gelir'
    END;

/*
Deneyime göre üç grup oluştur:
0–2
3–6
7+
Her grubun ortalama maaşını getir.
*/
SELECT 
    CASE 
        WHEN DeneyimYil >= 7 THEN 'uzman'
        WHEN DeneyimYil >= 3 THEN 'orta'
        ELSE 'Acemi'
        END AS Deneyim,
        AVG(Maas) AS OrtalamaMaas
        FROM dbo.SirketPersonel_Ornek
    GROUP BY 
        CASE 
        WHEN DeneyimYil >= 7 THEN 'uzman'
        WHEN DeneyimYil >= 3 THEN 'orta'
        ELSE 'Acemi'
        END;


/*Bir SELECT sorgusu şu sırayla çalışır:
1️ FROM
2️ ON
3️ JOIN
4️ WHERE
5️ GROUP BY
6️ HAVING
7️ SELECT
8️ DISTINCT
9️ ORDER BY
10 TOP
*/ 

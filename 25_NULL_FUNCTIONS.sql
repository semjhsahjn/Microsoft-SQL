/*
-------- NULL FUNCTIONS --------
NULL fonksiyonlar:

Veride NULL (eksik/değersiz) varsa onu yönetmek, değiştirmek veya kontrol etmek için kullanılır.
Çünkü SQL’de:
NULL = 0 değildir
NULL = '' (boş metin) değildir
NULL = bilinmeyen değerdir
Ve NULL ile matematik yaparsan sonuç da NULL olur.
*/

CREATE TABLE NullTest_Personel (
    PersonelID INT PRIMARY KEY,
    Ad VARCHAR(50),
    Maas INT NULL,
    Prim INT NULL,
    Sehir VARCHAR(50) NULL,
    Telefon VARCHAR(20) NULL
);

INSERT INTO NullTest_Personel VALUES
(1, 'Ahmet', 50000, 5000, 'Istanbul', '5551112233'),
(2, 'Mehmet', NULL, 3000, 'Ankara', NULL),
(3, 'Ayse', 40000, NULL, NULL, '5553334455'),
(4, 'Fatma', NULL, NULL, 'Izmir', NULL),
(5, 'Ali', 60000, 7000, NULL, '5556667788'),
(6, 'Zeynep', 35000, NULL, 'Bursa', NULL);


-- ISNULL() ->  Bir ifade NULL ise yerine başka bir değer koyar.
-- Syntax -> ISNULL(ifade, yerine_koyulacak_deger)

-- Maaş Ve Prim değerleri NULL olabileceğinden dolayı Gelir Hesaplamaları Yanlış Çıkabilir
-- Çünkü Null 0 demek değildir Hiçbirşeydir NULL 
-- O yüzden Maas Ve Prim değerleri eğer NULL ise 0 Yapın Ve toplam geliri Hesaplayın (maas + prim)

SELECT Ad,ISNULL(Maas,0) + ISNULL(prim,0)
FROM dbo.NullTest_Personel;

-- Telefon NULL ise "Telefon Yok" yazdır, değilse kendi numarasını göster.

SELECT Ad,ISNULL(Telefon,'Telefon Yok')
FROM dbo.NullTest_Personel;

-- Prim NULL olanları 0 olarak listele.

SELECT Ad,ISNULL(Prim,0) AS PrimDegeri
FROM dbo.NullTest_Personel;


-- COALESCE() -> Birden fazla değeri kontrol eder, NULL olmayan ilk değeri döndürür.
-- Syntax -> COALESCE(deger1, deger2, deger3, ...)

-- Prim varsa onu, yoksa Maaşın %10’unu göster.

SELECT Ad , COALESCE(Prim,Maas * 0.10) AS Deger
FROM dbo.NullTest_Personel;
-- Fatmanın hem Prim hemde Maas Değeri Olmadıgı için NULL yazdı.


-- Telefon varsa onu göster, yoksa 'Dahili Hat Yok', o da yoksa 'İletişim Yok'.

SELECT Ad, COALESCE(Telefon,'Dahili Hat Yok','İletişim Yok') AS Iletisim
FROM NullTest_Personel;

-- ISNULL -> NULL ise yerine değer koy  COALESCE -> NULL olmayan ilk değeri bul

-- Prim NULL ise 1000, o da NULL ise 0 kabul et.

SELECT Ad, COALESCE(Prim,1000,0) 
FROM dbo.NullTest_Personel;

-- NULLIF() -> İki değer eşitse sonucu NULL yapar.
-- Syntax -> NULLIF(deger1, deger2) Eşitlik durumunda NULL üretir

-- Prim değeri 0 veya NULL ise sonucu NULL yap, diğerlerini olduğu gibi göster.

SELECT Ad,NULLIF(Prim,0) 
FROM dbo.NullTest_Personel;

-- Eğer maaş 50000 ise NULL göster, diğer maaşlar normal görünsün.

SELECT Ad,NULLIF(Maas,50000) 
FROM dbo.NullTest_Personel;


-- Maaş / Prim hesaplaması yap ama Prim 0 ise hata olmasın, NULL dönsün.

SELECT Ad, Maas / NULLIF(Prim,0) AS MaasBolPrim
FROM NullTest_Personel;

-- Şehir bilgisi “Izmir” ise NULL göster, diğer şehirler normal kalsın.
SELECT Ad, NULLIF(Sehir,'Izmir') AS SehirDegeri
FROM NullTest_Personel;


-- IS NULL / IS NOT NULL – Filtreleme Soruları

-- NULL maaşı olanları listele.
SELECT * 
FROM dbo.NullTest_Personel
WHERE Maas IS NULL ;

-- Telefonu dolu olanları listele.

SELECT * 
FROM dbo.NullTest_Personel
WHERE Telefon IS NOT NULL ;
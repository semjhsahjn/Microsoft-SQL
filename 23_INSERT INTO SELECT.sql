/*
--------INSERT INTO SELECT--------

SELECT INTO: Ortada bir tablo yokken, verileri alıp yeni bir tablo yaratır.
(Yani önce kaba inşaatı yapar, sonra içine eşyaları koyar).

INSERT INTO SELECT: Zaten var olan, önceden oluşturduğun hazır bir tablonun içine
başka bir yerden veri kopyalayıp ekler. (Yani ev hazır, sen sadece yeni eşyalar taşıyorsun).

*Syntax

INSERT INTO Hedef_Tablo (Sutun1, Sutun2, Sutun3)
SELECT Sutun1, Sutun2, Sutun3
FROM Kaynak_Tablo
WHERE Sartlar;

*/


-- Hatırlarsan bir önceki ders'de Yeni_Personel_Taslak adında,
-- içi boş ama sütunları hazır bir tablo oluşturmuştuk.
SELECT * FROM dbo.Yeni_Personel_Taslak;
-- Hadi şimdi o boş tablonun içine Personel_Merkez tablosundan verileri "seçip ekleyelim".

-- Senaryo: "Ankara'daki personelleri, halihazırda var olan Yeni_Personel_Taslak tablosuna ekle.

INSERT INTO dbo.Yeni_Personel_Taslak
SELECT *
FROM dbo.Personel_Merkez
WHERE Sehir = 'Ankara';

SELECT * FROM dbo.Yeni_Personel_Taslak;

/*
Özetle; SELECT INTO komutu veritabanında henüz mevcut olmayan yepyeni bir tabloyu
otomatik olarak oluşturup seçilen verileri içine kopyalarken

INSERT INTO SELECT komutu verileri halihazırda veritabanında önceden oluşturulmuş
ve bekleyen bir tablonun mevcut verilerinin altına eklemek için kullanılır
*/
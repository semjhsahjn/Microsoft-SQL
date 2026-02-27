USE SqlDersleri;
/*
--------VIEW--------
Bir veritabanında çalışırken bazen tablolar çok karmaşık hale gelir
Onlarca sütun, onlarca satır ve birbirine bağlanmış (Join) tablolar arasında kaybolabilirsiniz
İşte bu noktada VIEW (Görünüm) imdadımıza yetişir.

View, aslında gerçek bir tablo değildir.
Bir SQL sorgusunun sonucunun sanki bir tabloymuş gibi kaydedilmiş halidir.

View kullanmanın 3 temel sebebi vardır:

1-Karmaşıklığı Gizlemek:
5-6 tabloyu birbirine bağlayan 50 satırlık bir SQL kodunu her seferinde yazmak yerine,
bu kodu bir View içine hapsedersiniz.
Sonra sadece SELECT * FROM View_Adı diyerek sonucu çağırırsınız.

2-Güvenlik Sağlamak:
Bir çalışanınıza "Personel" tablosuna erişim vermeniz gerekiyor
ama maaş bilgilerini görmesini istemiyorsunuz.
Personel tablosundan sadece "Ad, Soyad, Departman" sütunlarını seçen bir View oluşturur
ve çalışana sadece bu View'ı görme yetkisi verirsiniz.

3-Standartlaştırma:
Şirket genelinde herkesin aynı hesaplama mantığını kullanmasını istiyorsanız
(örneğin KDV dahil fiyat hesaplama),
bu mantığı bir View içine yazarsınız.
Böylece herkes aynı sonucu görür.

Bir View oluşturmak için CREATE VIEW komutu kullanılır.

Güncellik:
Arka plandaki gerçek tablolarda bir veri değiştiğinde,
View'ı açtığınızda verinin otomatik olarak güncellendiğini görürsünüz.
Çünkü View her çağrıldığında o sorguyu yeniden çalıştırır.

GO -> Microsoft SQL Server ortamında yazdığın T-SQL komutlarını ayrı bir batch (çalıştırma bloğu) olarak sunucuya gönderen ayırıcı komuttur.
*/
CREATE DATABASE VIEWsection;
USE VIEWsection;

-- 1. Yazarlar Tablosu
CREATE TABLE Yazarlar (
    YazarID INT PRIMARY KEY,
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    Ulke NVARCHAR(50)
);

-- 2. Kitaplar Tablosu
CREATE TABLE Kitaplar (
    KitapID INT PRIMARY KEY,
    Baslik NVARCHAR(100),
    Fiyat DECIMAL(10, 2),
    StokAdedi INT,
    YazarID INT,
    FOREIGN KEY (YazarID) REFERENCES Yazarlar(YazarID)
);

-- Veri Girişi
INSERT INTO Yazarlar VALUES
(1, 'Sabahattin', 'Ali', 'Türkiye'),
(2, 'Franz', 'Kafka', 'Çekya'),
(3, 'Yaşar', 'Kemal', 'Türkiye');
INSERT INTO Kitaplar VALUES
(101, 'Kürk Mantolu Madonna', 45.00, 150, 1),
(102, 'İnce Memed', 60.00, 80, 3),
(103, 'Dönüşüm', 30.00, 200, 2),
(104, 'Kuyucaklı Yusuf', 40.00, 10, 1);

--Görev: Kitapçıdaki çalışanların kitap fiyatlarını görmesini istemiyoruz.
--Sadece Kitap adını ve stok adedi bilgilerini içeren "StokDurumu" adında bir View oluşturun.
GO
CREATE VIEW StokDurumu AS
SELECT Baslik,StokAdedi
FROM dbo.Kitaplar;
GO
--Mantık: Kullanıcı SELECT * FROM StokDurumu 
--dediğinde fiyat bilgisini asla göremez. Veriyi gizlemiş olduk.

SELECT * FROM StokDurumu;

/* 
Görev: Her kitabın adını ve o kitabın yazarının tam adını (Ad + Soyad birleşik şekilde)
tek bir tabloda görmek istiyoruz.
Normalde her seferinde JOIN yazmamız gerekir. Bunu bir View ile sabitleyin.
*/
GO
CREATE VIEW KitapYazarDetay AS
SELECT k.Baslik AS 'Kitap adi',
y.Ad +' '+ y.Soyad AS 'Yazar'
FROM dbo.Kitaplar k
INNER JOIN 
dbo.Yazarlar y
ON k.YazarID = y.YazarID;
GO

-- Mantık: Artık iki tabloyu birleştirmekle uğraşmıyoruz. SELECT * FROM KitapYazarDetay yazmak yeterli.
SELECT * FROM KitapYazarDetay;


-- Görev: Stokta azalan kitapları (stok adedi 50'den az olanlar)
-- sürekli takip etmemiz gerekiyor. 
--"KritikStok" adında bir View oluşturun.
GO
CREATE VIEW KritikStok AS
SELECT Baslik,StokAdedi
FROM dbo.Kitaplar
WHERE StokAdedi < 50;

-- Mantık: Bu View her çağrıldığında o anki güncel veriye bakar ve sadece stokta azalanları getirir.
GO 
SELECT * FROM KritikStok;
/*
Görev: Oluşturduğumuz "StokDurumu" isimli View'ı sistemden tamamen kaldırmak istiyoruz.
Hangi komutu kullanırız?
*/
GO
DROP VIEW StokDurumu;
/*
Mantık: DROP komutu yapıyı siler ama unutmayın;
gerçek tablodaki veriler silinmez, sadece oluşturduğumuz "sanal pencere" kaldırılır.
*/

/*
Eğitim Notu

"View'lar gerçek tabloların canlı birer aynasıdır.
Eğer Kitaplar tablosuna yeni bir kitap eklerseniz,
oluşturduğunuz View'ları tekrar çalıştırmanıza gerek kalmaz;
View o yeni kitabı otomatik olarak görür."
*/



CREATE DATABASE STOREDPROCEDUREsection;
USE STOREDPROCEDUREsection;
/*
-----------STORED PROCEDURE-----------

Tanımı
Stored Procedure (SP), SQL Server üzerinde bir veya birden fazla SQL komutunun önceden tanımlanıp
saklanmış ve gerektiğinde çalıştırılabilen yapısıdır.
Başka bir deyişle, tekrar tekrar kullanılabilir SQL kod bloklarıdır.

Ne İşe Yarar?
Tekrarlanan SQL işlemlerini otomatikleştirmek için kullanılır.
Veri bütünlüğünü ve iş mantığını merkezi bir yerde tutarak standart uygulama sağlar.
Karmaşık sorguları veya çok adımlı işlemleri tek bir çağrıyla çalıştırabilme imkânı verir.
Performans açısından, SQL Server üzerinde derlenmiş ve önceden optimize edilmiş oldukları için hız avantajı sağlar.
Parametre alarak dinamik ve esnek sorgular yazılmasını sağlar.

Neden Kullanılır?
Tekrar kullanım: Aynı SQL komutlarını birden fazla yerde tekrar yazmak yerine, tek bir stored procedure çağrılır.
Güvenlik: Kullanıcılar sadece stored procedure’ü çalıştırabilir, tabloların doğrudan erişimi kısıtlanabilir.
Bakım kolaylığı: Kod değişiklikleri yalnızca stored procedure üzerinde yapılır, bu da bakımı ve güncellemeyi kolaylaştırır.
İş mantığının merkezileştirilmesi: Uygulama katmanı yerine SQL Server’da iş kuralları uygulanabilir.

Nelere Dikkat Edilmelidir?
Parametre kullanımı: Gereksiz parametrelerden kaçınılmalı, sadece gerekli değerler alınmalıdır.
Performans: Büyük veri setlerinde, sorgular optimize edilmeli ve gereksiz işlem yapılmamalıdır.
Hata yönetimi: TRY…CATCH blokları veya uygun hata kontrol mekanizmaları kullanılmalıdır.
Güvenlik: Kullanıcı yetkileri kontrol edilmeli, hassas tabloların doğrudan erişimi engellenmelidir.
Versiyon yönetimi: Stored procedure’lerin değişiklikleri takip edilmeli, eski sürümler gerekirse saklanmalıdır.
Açıklama ekleme: Karmaşık prosedürlerde açıklama ve dokümantasyon eklenmelidir.
*/


/*
Stored Procedure ile View Arasındaki Farklar (Not):

Stored Procedure, SQL Server’da önceden tanımlanmış ve saklanmış SQL komutları bloğudur.
Gerektiğinde çağrılır ve parametre alabilir.
Karmaşık veri işlemlerini yapabilir, veri üzerinde INSERT, UPDATE veya DELETE gibi değişiklikler uygulayabilir.
İş mantığını merkezi bir yerde toplamak, tekrar eden işlemleri otomatikleştirmek
ve güvenliği artırmak için kullanılır.

View ise sanal bir tablo gibidir;
bir veya daha fazla tablodan gelen veriyi SELECT ile görüntülemek amacıyla oluşturulur.
Parametre almaz ve genellikle veri üzerinde değişiklik yapamaz.
Karmaşık sorguları tekrar yazmak yerine standardize edilmiş bir görünüm sunar ve veri sunumunu kolaylaştırır.

Kısaca özetlemek gerekirse:
View veri görüntülemek için kullanılır,
Stored Procedure veri işlemek ve işlem sonucu döndürmek için kullanılır.
*/

-- Syntax
/*
CREATE PROCEDURE ProcedureAdi
    @Parametre1 VeriTipi,
    @Parametre2 VeriTipi OUTPUT  -- Opsiyonel, çıktı parametresi
AS
BEGIN
    -- SQL Komutları buraya yazılır
    SELECT * FROM TabloAdi WHERE Kolon = @Parametre1;
END;
GO

-- Stored Procedure çağırma
EXEC ProcedureAdi @Parametre1 = Deger;

-- OUTPUT parametresi varsa
DECLARE @Sonuc VeriTipi;
EXEC ProcedureAdi @Parametre1 = Deger, @Parametre2 = @Sonuc OUTPUT;
SELECT @Sonuc;
*/

-- 1. Departmanlar Tablosu
CREATE TABLE Departmanlar (
    DepartmanID INT PRIMARY KEY,
    DepartmanAdi VARCHAR(50)
);

INSERT INTO Departmanlar VALUES
(1, 'İK'),
(2, 'Finans'),
(3, 'IT');

-- 2. Çalışanlar Tablosu
CREATE TABLE Calisanlar (
    CalisanID INT PRIMARY KEY,
    Ad VARCHAR(50),
    Soyad VARCHAR(50),
    Maas INT,
    DepartmanID INT,
    FOREIGN KEY (DepartmanID) REFERENCES Departmanlar(DepartmanID)
);

INSERT INTO Calisanlar VALUES
(1, 'Ali', 'Yılmaz', 45000, 1),
(2, 'Ayşe', 'Demir', 52000, 2),
(3, 'Mehmet', 'Kara', 60000, 3),
(4, 'Fatma', 'Çelik', 48000, 1),
(5, 'Can', 'Yıldız', 55000, 2);


-- Tüm çalışanları listeleyen bir Stored Procedure oluşturun.
GO
CREATE PROCEDURE sp_TumCalisanlar
AS
    BEGIN
        SELECT * FROM dbo.Calisanlar;
    END;
GO

-- Procedure Çağırma
EXEC sp_TumCalisanlar;


-- Belirli Departmandaki Çalışanları Listeleyen Stored Procedure
GO
CREATE PROCEDURE sp_DepartmanCalisanlari
    @Deparman_id INT
AS
    BEGIN 
        SELECT * FROM dbo.Calisanlar
        WHERE DepartmanID = @Deparman_id;
    END;
GO

-- Çalıştırma
EXEC sp_DepartmanCalisanlari @Deparman_id = 3;


--Maaşı Belirli Bir Değerin Üzerindeki Çalışanları Listeleyen Stored Procedure (Orta)
GO
    CREATE PROCEDURE sp_MaasUzeriCalisanlar 
        @Maas INT
AS
    BEGIN
        SELECT * FROM dbo.Calisanlar
        WHERE Maas > @Maas;
    END;
GO

-- Çalıştırma
EXEC sp_MaasUzeriCalisanlar @Maas = 54000;


-- Departman Adına Göre Çalışanları Listeleyen Stored Procedure 
GO
    CREATE PROCEDURE sp_DepartmanaGoreCalisanlar
            @DepartmanAdi VARCHAR(50)
AS
       BEGIN 
        SELECT d.DepartmanAdi,c.Ad
        FROM dbo.Calisanlar c 
        INNER JOIN dbo.Departmanlar d
        ON c.DepartmanID = d.DepartmanID
        WHERE d.DepartmanAdi = @DepartmanAdi;
       END;
GO

-- Çalıştırma
EXEC sp_DepartmanaGoreCalisanlar @DepartmanAdi = 'IT';


-- Yeni Çalışan Ekleyen Stored Procedure
GO
CREATE PROCEDURE sp_CalisanEkle
    @Ad VARCHAR(50),@Soyad VARCHAR(50),@Maas INT,@DepartmanID INT
AS
    BEGIN
        DECLARE @c_id INT = (SELECT MAX(CalisanID + 1) FROM dbo.Calisanlar);
        INSERT INTO dbo.Calisanlar 
        VALUES(@c_id,@Ad,@Soyad,@Maas,@DepartmanID);
    END;
GO

-- Çalıştırma
EXEC sp_CalisanEkle @Ad = 'Semih', @Soyad = 'Sahin',@Maas = 70000,@DepartmanID = 3;
SELECT * FROM dbo.Calisanlar;

-- Departman numarasını sistem kendisi bulsun

DECLARE @id INT;
SELECT @id = DepartmanID FROM dbo.Departmanlar WHERE DepartmanAdi = 'IT';
EXEC sp_CalisanEkle @Ad = 'İnan',@Soyad = 'Senturk',@Maas = 19999,@DepartmanID = @id;

SELECT * FROM dbo.Calisanlar;


-- Çalışan Maaşını Güncelleyen Stored Procedure
GO
    CREATE PROCEDURE sp_UpdateWage
        @CalisanID INT,@Maas INT
AS
    BEGIN 
        UPDATE dbo.Calisanlar
        SET Maas = @Maas
        WHERE CalisanID = @CalisanID;
    END;
GO

EXEC sp_UpdateWage @CalisanId = 6 , @Maas = 100000;
SELECT * FROM dbo.Calisanlar;

-- Departman Bazlı Maaş Ortalamasını Hesaplayan Stored Procedure
GO 
    CREATE PROCEDURE sp_DepartmanMaasOrt
        @DepartmanID INT
AS
    BEGIN 
        SELECT AVG(Maas) FROM dbo.Calisanlar WHERE DepartmanID = @DepartmanID;
    END;
GO

DECLARE @d_id INT = (SELECT DepartmanID FROM dbo.Departmanlar WHERE DepartmanAdi = 'IT');
EXEC sp_DepartmanMaasOrt @DepartmanID = @d_id;


-- Maaşı Belirli Bir Değerin Üzerindeki Çalışan Sayısı Stored Procedure
/*
OUTPUT, prosedürün yaptığı hesabı sadece ekrana basmakla kalmayıp,
bu sonucu başka işlemlerde de kullanabilmen için bir değişkene yükleyip sana geri iade etmesini sağlar.
*/

GO
    CREATE PROCEDURE sp_MaasUzeriSayisi
        @Maas INT 
AS
    BEGIN
        SELECT COUNT(CalisanID)
        FROM dbo.Calisanlar
        WHERE Maas > @Maas;
    END;
GO

EXEC sp_MaasUzeriSayisi @Maas = 50000;


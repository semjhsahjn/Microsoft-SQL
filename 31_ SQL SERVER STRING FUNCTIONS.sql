CREATE DATABASE SQLServerStringFunctions;
USE SQLServerStringFunctions;

--Tablo Ve Verilerimizi Hazırlayalım.
CREATE TABLE Personel (
    PersonelID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    Email NVARCHAR(100),
    Telefon NVARCHAR(20),
    Adres NVARCHAR(200),
    Sehir NVARCHAR(50),
    PostaKodu NVARCHAR(10),
    Departman NVARCHAR(50),
    Unvan NVARCHAR(100),
    Notlar NVARCHAR(MAX)
);

INSERT INTO Personel (Ad, Soyad, Email, Telefon, Adres, Sehir, PostaKodu, Departman, Unvan, Notlar)
VALUES 
('Ahmet', 'Yılmaz', 'ahmet.yilmaz@sirket.com', '0532 123 4567', 'Atatürk Cad. No:15 Daire:3', 'İstanbul', '34000', 'Bilgi İşlem', 'Yazılım Geliştirici', 'Çok başarılı bir çalışan. Python ve C# konusunda uzman.'),
('Ayşe', 'Demir', 'ayse.demir@sirket.com', '0533 234 5678', 'İnönü Sok. No:8/A', 'Ankara', '06100', 'İnsan Kaynakları', 'İK Müdürü', 'Ekip yönetiminde çok iyi. 10 yıllık deneyim.'),
('Mehmet', 'Kaya', 'mehmet.kaya@sirket.com', '0534 345 6789', 'Cumhuriyet Bulvarı No:42', 'İzmir', '35000', 'Satış', 'Satış Temsilcisi', 'Müşteri ilişkilerinde başarılı. Hedeflerini her zaman tutuyor.'),
('Fatma', 'Şahin', 'fatma.sahin@sirket.com', '0535 456 7890', 'Gazi Cad. No:23 Kat:2', 'Bursa', '16000', 'Muhasebe', 'Mali Müşavir', 'Detaylara çok dikkat ediyor. Raporlama konusunda mükemmel.'),
('Ali', 'Çelik', 'ali.celik@sirket.com', '0536 567 8901', 'Barbaros Sok. No:7', 'Antalya', '07000', 'Bilgi İşlem', 'Sistem Yöneticisi', 'Network ve sunucu yönetiminde uzman. 7/24 ulaşılabilir.'),
('Zeynep', 'Arslan', 'zeynep.arslan@sirket.com', '0537 678 9012', 'Fevzi Paşa Cad. No:56', 'Adana', '01000', 'Pazarlama', 'Pazarlama Müdürü', 'Dijital pazarlama stratejilerinde çok başarılı.'),
('Mustafa', 'Aydın', 'mustafa.aydin@sirket.com', '0538 789 0123', 'Kılıçarslan Mah. No:12', 'Konya', '42000', 'Üretim', 'Üretim Şefi', 'Kalite kontrol süreçlerini çok iyi yönetiyor.'),
('Elif', 'Yıldız', 'elif.yildiz@sirket.com', '0539 890 1234', 'Mimar Sinan Cad. No:34', 'Gaziantep', '27000', 'Satış', 'Bölge Müdürü', 'Güneydoğu bölgesinde satışları %40 artırdı.'),
('Hasan', 'Öztürk', 'hasan.ozturk@sirket.com', '0530 901 2345', 'Zübeyde Hanım Sok. No:9', 'Kayseri', '38000', 'Lojistik', 'Lojistik Koordinatörü', 'Tedarik zinciri yönetiminde çok deneyimli.'),
('Merve', 'Polat', 'merve.polat@sirket.com', '0531 012 3456', 'Menderes Bulvarı No:78', 'Eskişehir', '26000', 'Pazarlama', 'Sosyal Medya Uzmanı', 'Instagram ve TikTok kampanyalarında çok başarılı.'),
('Emre', 'Kurt', 'emre.kurt@sirket.com', '0532 111 2222', 'Atatürk Bulvarı No:100', 'Samsun', '55000', 'Bilgi İşlem', 'Veri Analisti', 'SQL ve Power BI konusunda uzman. Raporlama süreçlerini otomatikleştirdi.'),
('Selin', 'Güneş', 'selin.gunes@sirket.com', '0533 222 3333', 'Fatih Cad. No:45', 'Trabzon', '61000', 'İnsan Kaynakları', 'İşe Alım Uzmanı', 'Yetenek bulma konusunda çok başarılı.'),
('Burak', 'Yavuz', 'burak.yavuz@sirket.com', '0534 333 4444', 'Kemal Paşa Sok. No:17', 'Denizli', '20000', 'Üretim', 'Kalite Kontrol Uzmanı', 'ISO standartlarına tam uyum sağlıyor.'),
('Gizem', 'Erdoğan', 'gizem.erdogan@sirket.com', '0535 444 5555', 'Yıldırım Cad. No:29', 'Malatya', '44000', 'Muhasebe', 'Muhasebe Uzmanı', 'Vergi mevzuatını çok iyi biliyor.'),
('Cem', 'Koç', 'cem.koc@sirket.com', '0536 555 6666', 'Sanayi Cad. No:88', 'Kocaeli', '41000', 'Lojistik', 'Depo Müdürü', 'Stok yönetimini optimize etti. Maliyetleri %25 düşürdü.');

-- SQL Server String Functions

-- LEN() -> Uzunluk Bulma *
-- Bir metnin karakter sayısını verir. Sondaki boşlukları saymaz.
-- Soru: Her personelin adının kaç karakterden oluştuğunu bulunuz.
SELECT Ad,LEN(Ad) FROM dbo.Personel;

--  UPPER() -> Büyük Harfe Çevirme *
-- Tüm harfleri büyük harfe dönüştürür.
-- Soru: Tüm personelin adını ve soyadını büyük harflerle gösteriniz.
SELECT UPPER(Ad),UPPER(Soyad) FROM dbo.Personel

--  LOWER() -> Küçük Harfe Çevirme *
--  Tüm harfleri küçük harfe dönüştürür.
-- Soru: Email adreslerini tamamen küçük harfle gösteriniz.
SELECT LOWER(Email) FROM dbo.Personel;

--  SUBSTRING() -> Metin Parçası Alma *
-- Bir metnin belirli bir bölümünü alır. SUBSTRING(metin, başlangıç, uzunluk)
-- Soru: Her personelin telefon numarasının ilk 4 hanesini (alan kodu) gösteriniz.
SELECT SUBSTRING(Telefon,1,4) FROM dbo.Personel;

-- LEFT() -> Soldan Karakter Alma *
-- Metnin soldan belirtilen sayıda karakterini alır.
-- Soru: Her personelin adının ilk 3 harfini gösteriniz.
SELECT Ad,LEFT(Ad,3) FROM dbo.Personel;

-- RIGHT() -> Sağdan Karakter Alma *
-- Metnin sağdan belirtilen sayıda karakterini alır.
-- Soru: Posta kodlarının son 3 hanesini gösteriniz.
SELECT Sehir,PostaKodu,RIGHT(PostaKodu,3) FROM dbo.Personel;

-- LTRIM() -> Soldaki Boşlukları Silme *
-- Metnin solundaki boşlukları temizler.
-- Örneğin
INSERT INTO dbo.Personel (Sehir)
VALUES ('   Ankara   ');

-- Soru: Şehir adlarının solundaki olası boşlukları temizleyiniz.
SELECT LTRIM(Sehir) FROM dbo.Personel;
-- Sağındaki boşluk hala duruyorç

-- RTRIM() -> Sağdaki Boşlukları Silme *
-- Metnin sağındaki boşlukları temizler.
-- Soru: Şehir adlarının sağındaki olası boşlukları temizleyiniz.
SELECT RTRIM(Sehir) FROM dbo.Personel;
-- Bu sefer Sağındaki boşluklar temizlendi Soldaki Boşluklar Duruyor.

-- TRIM() -> Her İki Yandaki Boşlukları Silme *
-- Metnin hem solundaki hem sağındaki boşlukları temizler.
SELECT TRIM(Sehir) FROM dbo.Personel;

--  REPLACE() -> Metin Değiştirme * 
-- Metindeki belirli bir ifadeyi başka bir ifade ile değiştirir.
-- Soru: Email adreslerindeki "@sirket.com" kısmını "@yenisirket.com" ile değiştiriniz.
SELECT REPLACE(Email,'@sirket.com','@yenisirket.com') FROM dbo.Personel;

 -- CHARINDEX() -> Karakter Pozisyonu Bulma * 
 -- Bir karakterin veya metnin ilk geçtiği pozisyonu bulur. Bulamazsa 0 döner.
 -- Soru: Email adreslerinde @ işaretinin kaçıncı karakterde olduğunu bulunuz.
SELECT Email,CHARINDEX('@',Email) FROM dbo.Personel;

-- CONCAT() -> Metinleri Birleştirme *
-- Birden fazla metni birleştirir. NULL değerleri boş string olarak işler.
-- Soru: Ad ve soyadı birleştirerek tam ad oluşturunuz.
SELECT CONCAT(Ad,' ',Soyad) FROM dbo.Personel;

-- CONCAT_WS() -> Ayırıcı ile Birleştirme *
-- Metinleri belirtilen ayırıcı ile birleştirir. NULL değerleri atlar.
-- Soru: Ad, soyad ve şehir bilgilerini tire ile birleştiriniz.
-- Kritik Kural: Aradığın desenin başına ve sonuna mutlaka % koymalısın.
SELECT CONCAT_WS('-',Ad,Soyad,Sehir) FROM dbo.Personel;


-- REVERSE() -> Metni Ters Çevirme
-- Metnin karakterlerini ters sıraya çevirir.
-- Soru: Personel adlarını ters çevirerek gösteriniz.
SELECT Ad,REVERSE(Ad) FROM dbo.Personel;

-- REPLICATE() -> Metni Tekrarlama
-- Bir metni belirtilen sayıda tekrarlar.
-- Soru: Her personel için yıldız (*) işaretini 5 kez tekrarlayarak gösteriniz.
SELECT Ad,REPLICATE('*',5) FROM dbo.Personel;
SELECT Ad,REPLICATE(Ad,5) FROM dbo.Personel;

-- SPACE() -> Boşluk Oluşturma
-- Belirtilen sayıda boşluk karakteri oluşturur.
-- Soru: Ad ve soyad arasına 5 boşluk koyarak gösteriniz.
SELECT Ad,Soyad, CONCAT(Ad,SPACE(5),Soyad) FROM dbo.Personel;

-- STUFF() -> Metin Ekleme/Değiştirme *
-- Metnin belirli bir bölümünü siler ve yerine yeni metin ekler.
-- Soru: Telefon numaralarının ortasındaki 3 karakteri "XXX" ile değiştiriniz.
SELECT Telefon , STUFF(Telefon,6,3,'XXX') FROM dbo.Personel;

-- PATINDEX() -> Desen Arama *
-- Metinde belirtilen desene uyan ilk pozisyonu bulur. Joker karakterler kullanılabilir.
-- Soru: Notlar alanında "başarılı" kelimesinin geçtiği pozisyonu bulunuz.
SELECT Ad,Soyad,PATINDEX('%başarılı%',Notlar) FROM dbo.Personel;

-- QUOTENAME() -> Köşeli Parantez Ekleme
-- Metni köşeli parantez içine alır. SQL nesnelerini güvenli hale getirmek için kullanılır.
-- Soru: Departman adlarını köşeli parantez içinde gösteriniz.
SELECT Departman,QUOTENAME(Departman) FROM dbo.Personel;

-- FORMAT() -> Metin Formatlama * 
-- Değerleri belirtilen formata göre metne dönüştürür.
-- Soru: PersonelID'yi 5 haneli formatta gösteriniz (örn: 00001).
SELECT PersonelID,FORMAT(PersonelID,'00000') FROM dbo.Personel;

-- STR() -> Sayıyı Metne Çevirme
-- Sayısal değeri metne dönüştürür. Uzunluk ve ondalık basamak belirtilebilir.
-- Soru: PersonelID'yi 10 karakterlik metin olarak gösteriniz.
SELECT PersonelID , STR(PersonelID,10) FROM dbo.Personel;

-- CHAR() -> ASCII Kodundan Karakter
-- ASCII kod numarasından karakter üretir.
-- Soru: Ad ve soyad arasına ASCII 45 (tire) karakteri ekleyiniz.
SELECT CONCAT(Ad,CHAR(45),Soyad) FROM dbo.Personel;

--  ASCII() -> Karakterden ASCII Kodu
--  Bir karakterin ASCII kod numarasını verir.
--  Soru: Her personelin adının ilk harfinin ASCII kodunu bulunuz.
SELECT Ad , ASCII(LEFT(TRIM(Ad),1)) FROM dbo.Personel;

--  UNICODE() -> Unicode Değeri
--  Bir karakterin Unicode değerini verir.
--  Soru: Şehir adlarının ilk karakterinin Unicode değerini bulunuz.
SELECT Sehir,UNICODE(LEFT(TRIM(Sehir),1)) FROM dbo.Personel;

-- NCHAR() - Unicode'dan Karakter
-- Unicode değerinden karakter üretir.
-- Soru: Unicode 8364 (Euro işareti) karakterini gösteriniz.
SELECT Ad,CONCAT(Ad,NCHAR(8364)) FROM dbo.Personel;



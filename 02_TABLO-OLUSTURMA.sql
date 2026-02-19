/*  
   ========================  ORNEK  ========================
	Icerisinde kitap id, kitap adi, yazar adi, yayin yili ve kategori column’lari
	olan bir kitaplar tablosu oluşturun
   =========================================================
 */

 CREATE TABLE kitaplar(
	kitap_id INT,
	kitap_adi VARCHAR(50),
	yazar_adi VARCHAR(50),
	yayin_yili INT,
	kategori VARCHAR(50)
 );


 /*  
   ========================  ORNEK  ========================
	“tedarikciler” isminde bir tablo oluşturun. Icinde tedarikci_id, tedarikci_ismi, tedarikci_adres 
    ve ulasim_tarihi sutunlari olsun.
   =========================================================
 */

 CREATE TABLE tedarikciler(
	tedarikci_id INT,
	tedarikci_ismi VARCHAR(50),
	tedarikci_adres VARCHAR(50),
	ulasim_tarihi DATE
 );


 /*  
   ========================  ORNEK  ========================
	“tedarikciler” tablosundan “tedarikciler_id_name” isminde yeni bir tablo  olusturun. 
    Icinde tedarikci_id, tedarikci_ismi field’lari olsun.
   =========================================================
   MYSQL'de bu işlem için
   CREATE TABLE ... AS SELECT ... yapısı kullanılırken,
   SQL Server'da SELECT INTO ifadesi kullanılır.
   SYNTAX
   
   SELECT istenen_sutunlar
   INTO yeni-tablo-ismi
   FROM kaynak table

 */

SELECT tedarikci_id, tedarikci_ismi
INTO tedarikciler_id_name
FROM tedarikciler;



/*  
   ========================  ORNEK  ========================
	Icerisinde personel id, adi, soyadi, dogum tarihi, pozisyon ve maas sutunlari olan 
    bir personel tablosu olusturun. 
   =========================================================
 */

 CREATE TABLE personel(
	personel_id INT,
	adi VARCHAR(50),
	soyadi VARCHAR(50),
	dogum_tarihi DATE,
	pozisyon VARCHAR(50),
	maas INT
 );


-- Personel tablosunu görüntüleyin.
SELECT * FROM dbo.personel;
-- Personel tablosundaki soyadi ve personel_id sutunlarini görüntüleyin.
SELECT soyadi,personel_id FROM dbo.personel;



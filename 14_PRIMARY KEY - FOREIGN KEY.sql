/*
======================== Primary Key ======================= 
Primary Key : (Birincil anahtar), 
bir tabloda her satırı benzersiz şekilde tanımlayan 
ve boş (NULL) değer içeremeyen sütun ya da sütunlar bütünüdür.

Primary Key olarak kullanılacak sutundaki veriler tekrarsiz (UNIQUE) olmalidir. 
Eğer birden fazla satır aynı primary key değerine sahip olursa, 
veri tabanı o satırları birbirinden ayırt edemez. 

İlişkili veri tabanlarında ( relational database ) mutlaka Primary Key olmalıdır.

* Bir tabloda yalnızca bir tane Primary Key OLABILIR.
* Her tabloda Primary Key olması zorunlu değildir.
* Primary Key benzersiz ( Unique ) olmalıdır 
* ama her Unique data  Primary Key değildir.
* Primary Key her türlü datayı içerebilir. Sayı, String, ...

-Primary Key, dış dünyadaki gerçek verileri temsil ediyorsa, 
örneğin; TC  kimlik numarası, bir kitabın ISBN numarası, bir ürünün ismi, email hesabı  gibi 
buna [Natural Key],

-veriyle doğrudan ilgisi olmayan yapay (üretilmiş) sira no, ogrenci no gibi bir değer ise 
[Surrogate] Key denir.

Syntax 1 :
	Data Type'dan sonra "PRIMARY KEY" yazarak

	CREATE TABLE students_table
	(
		id INT PRIMARY KEY,
		name VARCHAR(50) UNIQUE,
		grade INT NOT NULL,
		adres VARCHAR(100),
		last_update DATE
	); 

Syntax 2 :
	CONSTRAINT Keyword'u kullanilarak PRIMARY KEY tanimlanabilir.
	"CONSTRAINT constraintName PRIMARY KEY(column1, column2, ... column_n);"

	CREATE TABLE students_table
	(
		id INT ,
		name VARCHAR(50),
		grade INT,
		adres VARCHAR(100),
		last_update DATE
		CONSTRAINT id_pk PRIMARY KEY (id));

*/



 /*  
====================  Composite Key  ====================
Bir tabloda Primary Key yapilacak bir sutun bulunamadiginda, 
birden fazla sütunun birleştirilerek benzersiz (unique) kayıtları tanımladığı 
birincil anahtardır.
=========================================================
 */


  /*  
========================  ORNEK  ========================
"ogretmenler" isimli bir table olusturun.
Tabloda "id", "isim", "brans", "cinsiyet" fieldlari olsun.
"id" field'i tekrarli veri kabul etmesin. ve otomatik olarak artan degerler alsin
2. yolu kullanarak "id" ve "isim" field'larini primary key yapin
=========================================================
 */

CREATE TABLE ogretmenler (
    id INT IDENTITY(1,1),
    isim VARCHAR(50),
    brans VARCHAR(50),
    cinsiyet VARCHAR(50),
    CONSTRAINT ogretmenler_id_pk PRIMARY KEY (id)
);


/*
============================ FOREIGN KEY ============================

Foreign Key iki tablo arasında ilişki (relation) oluşturmak için kullanılır.

* Foreign Key, başka bir tablodaki PRIMARY KEY sütununa bağlı olmalıdır.

* Foreign Key, değerleri referans aldığı tablodaki PRIMARY KEY ile eşleşmek zorundadır.

* Bir tabloda birden fazla Foreign Key olabilir.

* Foreign Key sütununda tekrar eden değerler olabilir.

Foreign Key sütunu NULL değeri kabul edebilir (NOT NULL yapılmadığı sürece).

Foreign Key veri bütünlüğünü (referential integrity) sağlar.
*/

	--Syntax
--CONSTRAINT constraint_name
--FOREIGN KEY (child_column)
--REFERENCES parent_table (parent_column)


/*
========================  FOREIGN KEY NOTLARI  =======================

Bir field’i Foreign Key yapmak için mutlaka başka bir tablodaki
PRIMARY KEY (veya UNIQUE) ile ilişkilendirilmelidir.

Referenced table (bağlanılan tablo, PRIMARY KEY’in olduğu tablo)
Parent Table olarak adlandırılır.

Foreign Key’in bulunduğu tablo ise Child Table olarak adlandırılır.


FOREIGN KEY oluşturmanın doğal sonuçları:

1-* Foreign Key, Parent Table’daki PRIMARY KEY’de olmayan bir değeri içeremez.

2-* Parent Table oluşturulmadan Child Table oluşturulamaz (referans hatası alınır).

3-* Parent Table’da olmayan bir değeri Child Table’a ekleyemezsiniz.

4-* Child Table’da ilgili kayıtlar varken Parent Table’daki
   PRIMARY KEY değeri silinemez (referential integrity korunur).

5-* Parent Table’ı silmeden önce Child Table’daki Foreign Key
   ilişkisi kaldırılmalı veya Child Table silinmelidir.

6- Foreign Key sütunu, NOT NULL yapılmadığı sürece NULL değer alabilir.

=======================================================================
*/


--============= MSSQL - CONSTRAINTS (Kısıtlamalar) ==============

--Constraint’ler tablo sütunlarına veri bütünlüğü sağlamak için
--uygulanan kurallar ve kısıtlamalardır.

--1- PRIMARY KEY :
--   Bir tabloyu benzersiz olarak tanımlar.
--   NULL kabul etmez ve tekrar eden değer alamaz.
--   Bir tabloda yalnızca bir tane PRIMARY KEY olabilir
--   (birden fazla sütundan oluşabilir).

--2- FOREIGN KEY :
--   Bir sütunu başka bir tablodaki PRIMARY KEY’e bağlar.
--   Veri bütünlüğünü sağlar.
--   Tekrar edebilir.
--   NULL kabul edebilir (NOT NULL yapılmadıkça).

--3- UNIQUE :
--   Sütundaki tüm değerlerin benzersiz olmasını sağlar.
--   NULL değeri bir kez kabul eder (MSSQL’de).

--4- NOT NULL :
--   Sütunun boş (NULL) olmasını engeller.

--5- CHECK :
--   Sütuna girilecek veriyi belirli bir koşula göre sınırlar.

--6- DEFAULT :
--   Veri girilmediğinde otomatik atanacak değeri belirler.

--7- IDENTITY :
--   Sayısal sütunun otomatik artmasını sağlar.
--   (MSSQL’de AUTO_INCREMENT yerine kullanılır.)

--===============================================================

/*
 1- Öğrenci tablosu oluşturun. 
    Tabloda ogrenci_no, isim ve soyisim field'lari olsun
    ve ogrenci_no Primary Key olsun
*/

CREATE TABLE ogrenci (
	ogrenci_no INT PRIMARY KEY,
	isim VARCHAR(50),
	soyisim VARCHAR(50)
);

 /*  
========================  ORNEK  ========================
 2- Adresler tablosu olusturun. 
    Tabloda ogrenci_no, sehir, ilce, sokak ve ev_no field'lari olsun
    ve ogrenci_no ogrenci tablosu ile iliski kurmak icin Foreign Key olsun
=========================================================
 */

 CREATE TABLE adresler (
	ogrenci_no INT,
	sehir VARCHAR(50),
	ilce VARCHAR(50),
	sokak VARCHAR(50),
	ev_no VARCHAR(50)
	CONSTRAINT adres_ogrenci_fk FOREIGN KEY (ogrenci_no) REFERENCES ogrenci(ogrenci_no)
 );

  /*  
========================  ORNEK  ========================
 3- Ogretmen tablosu olusturun. 
    Tabloda ogretmen_id, isim, soyisim  ve ders_adi field'lari olsun
    ve ogretmen_id Primary Key olsun
=========================================================
 */
 
 CREATE TABLE ogretmenler(
	ogretmen_id INT PRIMARY KEY,
	isim VARCHAR(50),
	soyisim VARCHAR(50),
	ders_adi VARCHAR(50)
 );


  /*  
========================  ORNEK  ========================
 4- Dersler tablosu olusturun. 
   Tabloda id, ogrenci_no ve ders_adi, ortalama_not ve ogretmen_id  field'lari olsun
   id Primary Key olsun
   ogrenci_no ogrenci tablosu ile iliski kurmak icin Foreign Key olsun
   ogretmen_id ogretmen tablosu ile iliski kurmak icin Foreign Key olsun

=========================================================
 */

 CREATE TABLE dersler (
	id INT IDENTITY(1,1) PRIMARY KEY,
	ogrenci_no INT,
	ders_adi VARCHAR(50),
	ortalama_not DECIMAL(4,2),
	ogretmen_id INT,
	CONSTRAINT dersler_ogrenci_fk FOREIGN KEY (ogrenci_no) REFERENCES ogrenci(ogrenci_no),
	CONSTRAINT dersler_ogretmenler_fk FOREIGN KEY (ogretmen_id) REFERENCES ogretmenler(ogretmen_id)

 );

  /*  
========================  ORNEK  ========================
 tablolara kayit ekleyin
=========================================================
 */

  INSERT INTO ogrenci VALUES
			(101, 'Ali', 'Yılmaz'),
			(103, 'Ece', 'Kaya'),
			(107, 'Mehmet', 'Yılmaz'),
			(109, 'Mert', 'Demir'),
			(112, 'Ahmet', 'Kurt'),
			(118, 'Buse', 'Kaya'),
			(123, 'Emre', 'Yıldız'),
			(129, 'Elif', 'Yılmaz'),
			(131, 'Can', 'Demir'),
			(137, 'Burcu', 'Kaya'),
			(141, 'Mert', 'Yıldız'),
			(145, 'Buse', 'Kurt'),
			(151, 'Deniz', 'Yılmaz'),
			(157, 'Ece', 'Kaya'),
			(160, 'Buse', 'Demir');


INSERT INTO ogretmenler VALUES
		(11, 'Ahmet', 'Yıldız', 'Matematik'),
		(12, 'Zeynep', 'Demir', 'Matematik'),
		(13, 'Kerem', 'Balcı', 'Matematik'),
		(14, 'Mehmet', 'Koç', 'Fizik'),
		(15, 'Ayşe', 'Çetin', 'Fizik'),
		(16, 'Ali', 'Kurt', 'Kimya'),
		(17, 'Merve', 'Aslan', 'İngilizce'),
		(18, 'Burak', 'Şahin', 'İngilizce'),
		(19, 'Elif', 'Sarı', 'Tarih'),
		(20, 'Can', 'Yılmaz', 'Coğrafya');

INSERT INTO adresler VALUES
			(101, 'Ankara', 'Çankaya', 'Gül Sokak', '12'),
			(103, 'Ankara', 'Yenimahalle', 'Meşe Sokak', '5'),
			(107, 'Ankara', 'Sincan', 'Lale Sokak', '8'),
			(109, 'Ankara', 'Çankaya', 'Menekşe Sokak', '22'),
			(112, 'Ankara', 'Yenimahalle', 'Çamlık Sokak', '18'),
			(118, 'Ankara', 'Sincan', 'Papatya Sokak', '3'),
			(123, 'Ankara', 'Çankaya', 'Karanfil Sokak', '19'),
			(129, 'Ankara', 'Yenimahalle', 'Zambak Sokak', '11'),
			(131, 'Ankara', 'Sincan', 'Begonya Sokak', '16'),
			(137, 'Ankara', 'Çankaya', 'Orkide Sokak', '7'),
			(141, 'Ankara', 'Yenimahalle', 'Nergis Sokak', '4'),
			(145, 'Ankara', 'Sincan', 'Sümbül Sokak', '10'),
			(151, 'Ankara', 'Çankaya', 'Gül Sokak', '2'),
			(157, 'Ankara', 'Yenimahalle', 'Meşe Sokak', '21'),
			(160, 'Ankara', 'Sincan', 'Lale Sokak', '9');

INSERT INTO dersler (ogrenci_no,ders_adi,ortalama_not,ogretmen_id) VALUES
			(101, 'Matematik', 85.5, 11),
			(101, 'Fizik', 78.0, 14),
			(103, 'Matematik', 72.5, 12),
			(103, 'Tarih', 91.0, 19),
			(107, 'İngilizce', 75.0, 17),
			(107, 'Kimya', 82.0, 16),
			(109, 'Matematik', 69.5, 13),
			(109, 'Fizik', 74.0, 15),
			(112, 'İngilizce', 80.0, 18),
			(112, 'Coğrafya', 88.5, 20),
			(118, 'Matematik', 77.0, 12),
			(123, 'Tarih', 84.0, 19),
			(123, 'Kimya', 90.0, 16),
			(129, 'İngilizce', 86.0, 17),
			(129, 'Matematik', 92.0, 11),
			(131, 'Fizik', 95.0, 14),
			(131, 'Coğrafya', 89.0, 20),
			(137, 'İngilizce', 78.5, 18),
			(141, 'Matematik', 85.0, 13),
			(145, 'Tarih', 79.0, 19),
			(151, 'Kimya', 81.0, 16),
			(157, 'Fizik', 90.0, 15),
			(160, 'İngilizce', 83.0, 17),
			(160, 'Fizik', 87.0, 15),
			(101, 'Coğrafya', 76.5, 20),
			(118, 'Matematik', 84.0, 11),
			(145, 'İngilizce', 88.0, 18),
			(151, 'Matematik', 74.0, 12),
			(129, 'Fizik', 91.0, 14),
			(137, 'Tarih', 89.0, 19);

select * from dersler;
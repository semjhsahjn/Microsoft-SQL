
--SQL Server Sistem Veritabanları

/*
1. MASTER Veritabanı
Neden Var?
Master veritabanı SQL Server'ın "merkezi kayıt defteri" gibidir. Tıpkı bir şirketin ana kayıt defterinde tüm şube bilgilerinin tutulması gibi, master da tüm sistem bilgilerini saklar.

Ne İşe Yarar?
Veritabanı Envanteri: Sistemde hangi veritabanlarının olduğunu bilir
Kullanıcı Yönetimi: Kimler sisteme girebilir, hangi yetkileri var
Sistem Ayarları: SQL Server nasıl çalışacak, hangi özellikler aktif
Sunucu Bilgileri: Diğer sunucularla bağlantı bilgileri
Gerçek Hayat Benzetmesi
Bir apartmanın yöneticisi gibidir. Hangi dairelerin dolu olduğunu, kiracıların kimler olduğunu, apartman kurallarını bilir. Yönetici olmazsa apartman yönetilemez.

Neden Kritik?
Master bozulursa SQL Server hiç başlamaz. Çünkü sistem "Ben kimim, neredeyim, ne yapacağım?" sorularının cevabını bulamaz.
*/


/*
2. MODEL Veritabanı
Neden Var?
Model veritabanı bir "şablon" görevi görür. Tıpkı bir pastane'nin standart pasta kalıbı gibi, her yeni veritabanı bu kalıba göre oluşturulur.

Ne İşe Yarar?
Standartlaştırma: Tüm yeni veritabanları aynı temel özelliklere sahip olur
Varsayılan Ayarlar: Boyut, büyüme oranı, karakter seti gibi ayarlar
Ortak Yapılar: Her veritabanında olmasını istediğiniz tablolar veya kurallar
Gerçek Hayat Benzetmesi
Bir ev inşaat firmasının standart ev planı gibidir. Her yeni ev bu plana göre yapılır. Plan değiştirilirse, bundan sonra yapılan tüm evler yeni plana göre olur.

Pratik Faydası
Eğer şirketinizde her veritabanında mutlaka bir "log tablosu" olması gerekiyorsa, bunu model'e eklersiniz. Artık her yeni veritabanında otomatik olarak bu tablo olur.
*/

/*

3. MSDB Veritabanı
Neden Var?
MSDB, SQL Server'ın "sekreteri" gibidir. Zamanlanmış işleri, yedekleme kayıtlarını ve bakım işlemlerini takip eder.

Ne İşe Yarar?
İş Takvimleri: Hangi işler ne zaman çalışacak (otomatik yedekleme, rapor gönderme vb.)
Yedekleme Geçmişi: Hangi veritabanı ne zaman yedeklendi, başarılı mı oldu
E-posta Sistemi: Sistem uyarıları ve bildirimler
Bakım Planları: Düzenli temizlik ve optimizasyon işleri
Gerçek Hayat Benzetmesi
Bir ofis sekreteri gibidir. Toplantı takvimini tutar, önemli belgelerin kopyalarını saklar, hatırlatma mesajları gönderir, ofis temizliğini organize eder.

Neden Önemli?
Bu veritabanı olmazsa SQL Server "unutkan" olur. Hangi yedeklemenin ne zaman alındığını, hangi işlerin çalıştığını bilemez.
*/

/*
4. TEMPDB Veritabanı
Neden Var?
TempDB, SQL Server'ın "çalışma masası"dır. Geçici işlemler için kullanılan bir alan sağlar.

Ne İşe Yarar?
Geçici Depolama: Büyük hesaplamalar sırasında ara sonuçları saklar
Sıralama İşlemleri: Büyük veri setlerini sıralarken kullanır
Geçici Tablolar: Kullanıcıların oluşturduğu geçici tabloları barındırır
Sistem İşlemleri: SQL Server'ın kendi iç işlemleri için çalışma alanı
Gerçek Hayat Benzetmesi
Bir mutfaktaki tezgah gibidir. Yemek yaparken malzemeleri geçici olarak koyarsınız, işiniz bitince temizlersiniz. Her yemek yapımında kullanılır ama kalıcı bir şey saklanmaz.

Özel Özelliği
Her SQL Server yeniden başladığında TempDB sıfırdan oluşturulur. İçindeki her şey silinir. Bu normal ve istenen bir durumdur.
*/



/*
Sistem Veritabanlarının Birlikte Çalışması
Orkestra Benzetmesi
Bu 4 veritabanı bir orkestra gibi çalışır:

Master: Şef - tüm müzisyenleri yönetir, parçayı belirler
Model: Nota - yeni müzisyenler bu notaya göre çalar
MSDB: Sahne yöneticisi - konser programını düzenler, kayıt tutar
TempDB: Sahne - performans sırasında kullanılan geçici alan
Neden Hepsi Gerekli?
Her biri farklı bir sorumluluğu üstlenir. Birisi eksik olsa sistem tam çalışamaz:

Master olmasa → Sistem başlamaz
Model olmasa → Yeni veritabanları tutarsız olur
MSDB olmasa → Otomatik işler çalışmaz, geçmiş takip edilemez
TempDB olmasa → Karmaşık sorgular çalışmaz
*/


/*
Özet
SQL Server sistem veritabanları, bir şehrin temel altyapısı gibidir:

Master: Belediye binası (merkezi yönetim)
Model: İmar planı (standart yapı şablonu)
MSDB: Zabıta (düzen ve kayıt tutma)
TempDB: Pazar yeri (geçici aktiviteler)
*/





# Bölüm 2: Veritabanı Kavramları

### 1. Excel vs. Veritabanı Sorunları
Bir kurum verilerini Excel dosyalarında tuttuğunda şu üç somut sorunla karşılaşır: **veri tekrarı (redundancy)**, **veri tutarsızlığı (inconsistency)** ve **eşzamanlı erişim (concurrency) kısıtları**. Örneğin, aynı müşteri adresi birden fazla sayfada farklı kaydedilirse güncelleme anında tutarsızlık doğar. Veritabanı yönetim sistemleri veriyi tek bir merkezde toplayarak (normalization) tekrarları önler ve eşzamanlı işlemleri kilitleme mekanizmalarıyla güvenli hale getirir.

### 2. Birincil Anahtar (Primary Key) ve Öğrenci Numarası
Birincil anahtar, bir tablodaki her bir kaydı benzersiz şekilde tanımlayan ve asla boş (NULL) olamayan sütun veya sütun kombinasyonudur. **Öğrenci numarası** mükemmel birincil anahtardır çünkü her öğrenciye özeldir ve değişmez; ancak **ad soyad** asla iyi bir birincil anahtar olamaz çünkü birden fazla aynı isimde öğrenci bulunabilir ve isimler zamanla değişebilir.

### 3. DBMS ile Veritabanı Farkı
Veritabanı (Database), verilerin düzenli bir şekilde saklandığı fiziksel veya dijital dosya ve yapı topluluğudur. Veritabanı Yönetim Sistemi (DBMS - Database Management System) ise bu verilere erişmemizi, sorgulama yapmamızı, güvenliği sağlamamızı ve güncellemeleri yönetmemizi sağlayan yazılım katmanıdır. **PostgreSQL** bir DBMS'dir.

### 4. Eşzamanlı Değişiklik Çakışması
Aynı anda iki kişi aynı kaydı değiştirmeye kalkarsa **veri çakışması (race condition)** veya güncelleme kaybı yaşanır; biri diğerinin yaptığı değişikliği ezebilir. Bu sorunu çözmek için veritabanları işlem (transaction) ve kilitleme (locking) mekanizmaları kullanır (bu konuyu Hafta 10'da detaylıca işleyeceğiz).
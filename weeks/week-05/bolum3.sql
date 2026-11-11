-- =========================================================================
-- ÖDEV 2: Kısıtlamalar (Constraints), İhlal Testleri ve ON DELETE Kuralları
-- =========================================================================

-- Önceki tablolar varsa temizliyoruz
DROP TABLE IF EXISTS siparisler CASCADE;
DROP TABLE IF EXISTS urunler CASCADE;
DROP TABLE IF EXISTS musteriler CASCADE;

-- 1. Müşteriler Tablosu (PRIMARY KEY, UNIQUE, NOT NULL)
CREATE TABLE musteriler (
    musteri_id SERIAL PRIMARY KEY,
    ad_soyad VARCHAR(100) NOT NULL,
    eposta VARCHAR(100) UNIQUE NOT NULL,
    kayit_tarihi DATE DEFAULT CURRENT_DATE
);

-- 2. Ürünler Tablosu (CHECK kısıtlaması ile fiyat ve stok kontrolü)
CREATE TABLE urunler (
    urun_id SERIAL PRIMARY KEY,
    urun_adi VARCHAR(100) NOT NULL,
    fiyat NUMERIC(10, 2) CHECK (fiyat > 0),
    stok INT CHECK (stok >= 0)
);

-- 3. Siparişler Tablosu (FOREIGN KEY ve ON DELETE CASCADE)
CREATE TABLE siparisler (
    siparis_id SERIAL PRIMARY KEY,
    musteri_id INT REFERENCES musteriler(musteri_id) ON DELETE CASCADE,
    urun_id INT REFERENCES urunler(urun_id) ON DELETE RESTRICT,
    adet INT CHECK (adet > 0),
    siparis_tarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Örnek Veri Ekleme (Başarılı İşlemler)
INSERT INTO musteriler (ad_soyad, eposta) VALUES 
('Ahmet Yılmaz', 'ahmet@ornek.com'),
('Ayşe Demir', 'ayse@ornek.com');

INSERT INTO urunler (urun_adi, fiyat, stok) VALUES 
('Laptop', 15000.00, 10),
('Kulaklık', 750.00, 50);

INSERT INTO siparisler (musteri_id, urun_id, adet) VALUES 
(1, 1, 1),
(2, 2, 2);


-- =========================================================================
-- İHLAL TESTLERİ VE POSTGRESQL HATA KODLARI (VIOLATION TESTS)
-- =========================================================================

-- TEST 1: UNIQUE Kısıtlaması İhlali (Aynı e-posta ile ikinci kez kayıt ekleme)
-- Beklenen Hata: duplicate key value violates unique constraint "musteriler_eposta_key" (PostgreSQL Hata Kodu: 23505)
-- INSERT INTO musteriler (ad_soyad, eposta) VALUES ('Mehmet Can', 'ahmet@ornek.com');


-- TEST 2: CHECK Kısıtlaması İhlali (Negatif fiyat veya stok girme)
-- Beklenen Hata: new row for relation "urunler" violates check constraint "urunler_fiyat_check" (PostgreSQL Hata Kodu: 23514)
-- INSERT INTO urunler (urun_adi, fiyat, stok) VALUES ('Hatalı Ürün', -500.00, 5);


-- TEST 3: FOREIGN KEY ve ON DELETE RESTRICT İhlali 
-- Üzerinde aktif sipariş bulunan bir ürünü silmeye çalışmak (RESTRICT kuralı engeller)
-- Beklenen Hata: update or delete on table "urunler" violates foreign key constraint... (PostgreSQL Hata Kodu: 23503)
-- DELETE FROM urunler WHERE urun_id = 1;
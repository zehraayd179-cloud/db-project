-- =========================================================================
-- ÖDEV 2: İlişkisel Cebir Karşılıkları ve SQL Sorguları
-- =========================================================================

-- SORGU 1: Fiyatı 1000 TL'den büyük olan ürünleri listeleme (Select / Selection σ)
SELECT * FROM urunler WHERE fiyat > 1000.00;

-- SORGU 2: Belirli bir müşterinin sipariş ettiği ürünlerin adını ve adetini bulma (Join / ⨝ ve Projection π)
SELECT m.ad_soyad, u.urun_adi, s.adet, s.siparis_tarihi
FROM siparisler s
JOIN musteriler m ON s.musteri_id = m.musteri_id
JOIN urunler u ON s.urun_id = u.urun_id;

-- SORGU 3: Toplam sipariş adedine göre gruplama (Aggregation / Grupçul İşlemler)
SELECT u.urun_adi, SUM(s.adet) AS toplam_satis_adedi
FROM siparisler s
JOIN urunler u ON s.urun_id = u.urun_id
GROUP BY u.urun_adi;
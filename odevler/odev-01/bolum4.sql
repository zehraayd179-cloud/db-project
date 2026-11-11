-- Soru 11: NULL avı
SELECT count(*) AS satir_sayisi,
       count(battery_level) AS batarya_dolu
FROM robots;
-- 10 | 9, yani bir robotun bataryası bilinmiyor (Kartal-04, sensör arızası).
-- Bu tek boşluk ortalamayı doğrudan etkiliyor.

-- Soru 12: Gruplama ve Ortalama
SELECT model, avg(battery_level) AS ortalama_batarya
FROM robots
GROUP BY model;
-- Çeşitli modellere göre ortalama batarya seviyelerini gösteriyor.
-- Eksik (NULL) değerler AVG fonksiyonu tarafından hesaba katılmadığı için oranlar yanıltıcı olabilir.
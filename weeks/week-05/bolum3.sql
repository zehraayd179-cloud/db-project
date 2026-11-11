-- Soru 1: Bütün robotların adı ve modeli
SELECT name, model
FROM robots;
-- 10 satır döndü.

-- Soru 2: Batarya seviyesi 50'den büyük olan robotlar
SELECT name, battery_level
FROM robots
WHERE battery_level > 50;
-- 7 satır döndü.

-- Soru 3: Belirli bir modeldeki robotları listeleme
SELECT name, status
FROM robots
WHERE model = 'Explorer-X';
-- 3 satır döndü.
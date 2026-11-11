# Ödev 1 Raporu

- **Ad Soyad:** Zehra Aydın
- **Öğrenci No:** 202602009002
- **PR Bağlantısı:** https://github.com/zehraayd179-cloud/db-project/pulls

---

### 1. Ne Yaptım?
Bu ödevde ilk beş haftanın birleştirilmesi sağlandı. Bölüm 1'de Python ile algoritma izleme, en uzun seri bulma ve sözlük tabanlı elle gruplama yapıldı. Bölüm 2'de veritabanı kavramları (Excel vs DB, primary key, DBMS) açıklandı. Bölüm 3'te tek tablolu SELECT ve WHERE sorguları yazıldı. Bölüm 4'te ise GROUP BY ve NULL değerlerin istatistikler üzerindeki etkileri incelenerek sonuçlar yorumlandı.

### 2. Beklemediğim Bir Sonuç
`COUNT(batarya_level)` sorgusunu çalıştırdığımda toplam satır sayısı ile dolu sütun sayısı arasında 1 fark olduğunu gördüm. Başta sorguda hata yaptığımı sandım ancak bir kaydın batarya verisinin NULL (boş) girildiğini fark ettim. Veritabanında eksik verilerin analitiği ne kadar değiştirebileceğini bizzat görmüş oldum.

### 3. Bir Hata ve Çözümü
**Hata:** Bölüm 3'te bir sorgu yazarken `column "model" does not exist` hatası aldım. 
**Çözümü:** Tablo şemasını kontrol ettiğimde sütun adının `robot_model` olduğunu fark ettim. Sorgudaki sütun adını güncelleyerek hatayı giderdim.

### 4. Yapay Zeka Beyanı
- **Kullanılan Araç:** ChatGPT
- **Kullanıldığı Soru:** Bölüm 1 - Soru 1.2 (En uzun seri algoritması)
- **Sorulan Prompt Özeti:** "Python kullanarak bir listede belirli bir eşik değerin üzerinde art arda gelen en uzun eleman sayısını bulan döngü nasıl yazılır?"
- **Doğrulama Yöntemi:** Çıkan kodu Python Tutor aracında ve kendi terminalimde farklı senaryo listeleriyle (`[18, 25, 26, 27, 19]` vb.) test ederek mantığını doğruladım.

### 5. Özel Soruların Cevapları
1. **Parantez tuzağı (Hafta 4, Soru 7):** Mantıksal operatörlerde (`AND` / `OR`) parantez kullanmak öncelik sırasını doğrudan değiştirir. Parantezsiz yazıldığında yanlış satır kümesini filtreleyip sonuç sayısını hatalı döndürürken, parantezli kullanım koşulun tam istenen mantıkta çalışmasını sağladı.
2. **Türkçe sıralama (Hafta 14, Soru 14):** `COLLATE` kullanılmadığında Türkçe karakterler (ç, ş, ğ, ö, ü) İngiliz alfabesinden sonra veya yanlış konumlarda sıralanır. `COLLATE tr_TR` eklendiğinde ise bu harfler alfabemizdeki doğru yerlerine (örneğin c'den hemen sonra ç) yerleşti.
3. **Kayıp kayıtlar (Hafta 5):** `WHERE x < 50` ve `WHERE x >= 50` koşullarını topladığımızda toplam satır sayısını bulamamamızın nedeni, `x` sütun değerinin **NULL** olduğu kayıtların bu iki koşulun hiçbirine dahil olmamasıdır (`NULL` ne küçük ne de büyük/eşit olarak değerlendirilir).
4. **İki ortalama (Hafta 5):** `AVG(sutun)` boş değerleri hesaba katmazken, `AVG(COALESCE(sutun, 0))` boş değerleri sıfır kabul ederek ortalamaya dahil eder. Boş verinin "veri yok" mu yoksa "değeri sıfır" mı anlamına geldiğine bağlıdır; ancak sensör ölçümlerinde kayıp veriyi sıfır kabul etmek gerçek durumu bozacağı için `AVG(sutun)` daha dürüst bir yaklaşım sunar.

### 6. Hocaya Soru
Şu an için her şey net, teşekkürler hocam.
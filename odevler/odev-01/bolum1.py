# ==========================================
# Soru 1.1: İz Sürme
# ==========================================
# Kod çalıştırılmadan önce adımlar kâğıtta tabloya dökülmeli.
numbers = [4, 7, 2, 9, 5, 1, 8]
total = 0
result = []

for i in range(len(numbers)):
    if numbers[i] % 2 == 0:
        total = total + numbers[i]
    else:
        result.append(numbers[i])

print("Soru 1.1 Sonuçları:")
print("Total:", total)
print("Result:", result)
print("-" * 40)


# ==========================================
# Soru 1.2: En Uzun Seri
# ==========================================
def en_uzun_seri(readings, threshold):
    max_sayac = 0
    anlik_sayac = 0
    
    for val in readings:
        if val > threshold:
            anlik_sayac += 1
            if anlik_sayac > max_sayac:
                max_sayac = anlik_sayac
        else:
            anlik_sayac = 0
            
    return max_sayac

readings = [18, 21, 23, 25, 24, 26, 27, 19, 20, 22, 23, 24, 25, 26]
threshold = 22
print("Soru 1.2 En Uzun Seri:", en_uzun_seri(readings, threshold))
print("-" * 40)


# ==========================================
# Soru 1.3: Elle Gruplama
# ==========================================
records = [
    {"student": "Ece", "course": "VTYS"},
    {"student": "Ali", "course": "Yapay Zeka"},
    {"student": "Ece", "course": "Yapay Zeka"},
    {"student": "Can", "course": "VTYS"},
    {"student": "Ali", "course": "VTYS"},
    {"student": "Ece", "course": "Robotik"},
]

counts = {}
for rec in records:
    course = rec["course"]
    if course in counts:
        counts[course] += 1
    else:
        counts[course] = 1

print("Soru 1.3 Gruplama Çıktısı:", counts)

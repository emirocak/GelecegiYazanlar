func karelerinToplamıFarkı(_ n: Int) -> Int {
    let toplam = n * (n + 1) / 2
    let karelerinToplami = (n * (n + 1) * (2 * n + 1)) / 6
    let toplamKaresi = toplam * toplam
    return toplamKaresi - karelerinToplami
}

let n = 5
let sonuc = karelerinToplamıFarkı(n)
print("1'den \(n)'e kadar olan doğal sayıların karelerinin toplamı ile toplamlarının karesi arasındaki fark: \(sonuc)")

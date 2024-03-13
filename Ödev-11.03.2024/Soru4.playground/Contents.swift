//Soru 1

func ucVeBesinKatları(_ limit: Int) -> Int {
    var toplam = 0
    for i in 1..<limit {
        if i % 3 == 0 || i % 5 == 0 {
            toplam += i
        }
    }
    return toplam
}

let limit = 10
let sonuc1 = ucVeBesinKatları(limit)
print("Sonuç 1 : \(sonuc1)")

//Soru 3
func enBuyukAsalCarpan(_ sayi: Int) -> Int {
    var numara = sayi
    var bolen = 2
    
    while numara > 1 {
        if numara % bolen == 0 {
            numara /= bolen
        } else {
            bolen += 1
        }
    }
    
    return bolen
}

let sayi = 600851475143
let sonuc3 = enBuyukAsalCarpan(sayi)
print("Sonuç 3 : \(sonuc3)")

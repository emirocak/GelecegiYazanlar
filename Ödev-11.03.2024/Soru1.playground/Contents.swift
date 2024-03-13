func tekrarEdenHarfleriSil(_ string: String, _ tekrarSiniri: Int) -> String {
    var harfSayilari = [Character: Int]()
    

    for harf in string {
        harfSayilari[harf, default: 0] += 1
    }
    
    var yeniString = ""
    for harf in string {
        if harf != " " {
            if let tekrarSayisi = harfSayilari[harf], tekrarSayisi < tekrarSiniri {
                yeniString.append(harf)
            }
        } else {
            yeniString.append(" ")
        }
    }
    
    return yeniString
}


let ornekString = "aaba kouq bux"
let tekrarSiniri = 2
let sonuc = tekrarEdenHarfleriSil(ornekString, tekrarSiniri)
print("Sonuç: \(sonuc)")

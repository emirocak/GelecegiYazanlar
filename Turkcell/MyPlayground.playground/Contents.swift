func tekrarSil(_ string: String, _ tekrarSiniri: Int) -> String {
    var harfSayilari = [Character: Int]()
    
    for harf in string {
        harfSayilari[harf, default: 0] += 1
    }
    

    var yeniString = ""
    for harf in string {
        if let tekrarSayisi = harfSayilari[harf], tekrarSayisi < tekrarSiniri {
            yeniString.append(harf)
        }
    }
    
    return yeniString
}

let ornekString = "aaba kouq baux"
let tekrarSayisi = 2

print(tekrarSil(ornekString, tekrarSayisi))

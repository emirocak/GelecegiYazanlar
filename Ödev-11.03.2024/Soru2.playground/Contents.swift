func kelimeSayilariniHesapla(_ cumle: String) -> [String: Int] {
    var kelimeSayilari = [String: Int]()
    
    
    let kelimeler = cumle.split(separator: " ")
    
   
    for kelime in kelimeler {
        let kelimeStr = String(kelime)
        kelimeSayilari[kelimeStr, default: 0] += 1
    }
    
    return kelimeSayilari
}


let cumle = "Merhaba nasılsınız iyiyim siz nasılsınız bende iyiyim"
let kelimeSayilari = kelimeSayilariniHesapla(cumle)
for (kelime, sayi) in kelimeSayilari {
    print("\(kelime): \(sayi) kere")
}

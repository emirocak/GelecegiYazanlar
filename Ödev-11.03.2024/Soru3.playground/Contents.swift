func kelimeSayilariniHesapla(_ cumle: String) -> [String: Int] {
    var kelimeSayilari = [String: Int]()
    
    
    let kelimeler = cumle.split(separator: " ")
    
    
    for kelime in kelimeler {
        let kelimeStr = String(kelime).uppercased() // Kelimeleri büyük harfe çevir
        kelimeSayilari[kelimeStr, default: 0] += 1
    }
    
    return kelimeSayilari
}


extension Dictionary where Key == String {
    func sortedByValue() -> [(String, Value)] {
        return self.sorted { $0.key > $1.key }
    }
}

// Örnek kullanım
let cumle = "Merhaba nasılsınız iyiyim zeynep siz nasılsınız ahmet bende iyiyim"
let kelimeSayilari = kelimeSayilariniHesapla(cumle)
let siraliKelimeSayilari = kelimeSayilari.sortedByValue()
for (kelime, _) in siraliKelimeSayilari {
    print(kelime)
}


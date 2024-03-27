import Foundation

// Topatar sınıfı
class Topatar {
    var yerlesimAçısı: Double // Yerleşim açısı (teta) özelliği
    var fırlatmaHızı: Double // Fırlatma hızı (V) özelliği
    
    init(yerlesimAçısı: Double, fırlatmaHızı: Double) {
        self.yerlesimAçısı = yerlesimAçısı
        self.fırlatmaHızı = fırlatmaHızı
    }
    
    // Menzil hesaplama fonksiyonu
    func menzilHesapla() -> Double {
        let g = 10.0 // Yerçekimi ivmesi (m/s^2)
        return fırlatmaHızı * fırlatmaHızı * sin(2 * yerlesimAçısı) / g
    }
}

// Sise sınıfı
class Sise {
    var konum: Double // Konum (d) özelliği
    var kaplamaUzaklığı: Double // Kaplama uzaklığı (delta) özelliği
    var durum: Bool // Durum (1: dik, 0: devrik) özelliği
    
    init(konum: Double, kaplamaUzaklığı: Double, durum: Bool) {
        self.konum = konum
        self.kaplamaUzaklığı = kaplamaUzaklığı
        self.durum = durum
    }
    
    // Vurulma durumunu kontrol eden fonksiyon
    func vurulmaKontrolü(top: Topatar) -> Bool {
        let menzil = top.menzilHesapla()
        return konum >= (menzil - kaplamaUzaklığı) && konum <= (menzil + kaplamaUzaklığı)
    }
}

// Oyuncu sınıfı
class Oyuncu {
    var takmaAd: String // Takma ad özelliği
    var puan: Int // Puan özelliği
    
    init(takmaAd: String, puan: Int) {
        self.takmaAd = takmaAd
        self.puan = puan
    }
    
    // Oyuncunun bilgilerini ekrana yazdıran fonksiyon
    func oyuncuBilgileriGöster() {
        print("Takma Ad: \(takmaAd)")
        print("Puan: \(puan)")
    }
}

// Oyun sınıfı
class Oyun {
    var oyuncu: Oyuncu // Oyuncu özelliği
    var topatar: Topatar // Topatar özelliği
    var sise: Sise // Sise özelliği
    
    init(oyuncu: Oyuncu, topatar: Topatar, sise: Sise) {
        self.oyuncu = oyuncu
        self.topatar = topatar
        self.sise = sise
    }
    
    // Oyunu başlatan fonksiyon
    func oyunuBaşlat() {
        oyuncu.oyuncuBilgileriGöster()
        let menzil = topatar.menzilHesapla()
        let vuruldu = sise.vurulmaKontrolü(top: topatar)
        
        if vuruldu {
            print("Sise vuruldu!")
            oyuncu.puan += 1 // Puan artışı burada kontrol ediliyor
            oyuncu.oyuncuBilgileriGöster() // Güncel puanı ekrana yazdır
        } else {
            print("Sise vurulamadı!")
        }
    }
}


// Örnek kullanım
let oyuncu = Oyuncu(takmaAd: "Emro", puan: 0)
let topatar = Topatar(yerlesimAçısı: 45.0, fırlatmaHızı: 106.0)
let sise = Sise(konum: 1000.0, kaplamaUzaklığı: 5, durum: true)

let oyun = Oyun(oyuncu: oyuncu, topatar: topatar, sise: sise)
oyun.oyunuBaşlat()

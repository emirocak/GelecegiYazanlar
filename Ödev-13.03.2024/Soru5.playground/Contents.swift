import Foundation

func enKucukBolenSayi(_ aralik: ClosedRange<Int>) -> Int {
    var faktorler: [Int: Int] = [:]

    for i in aralik {
        var num = i
        var k = 2

        while k * k <= num {
            var count = 0
            while num % k == 0 {
                num /= k
                count += 1
            }
            faktorler[k] = max(faktorler[k, default: 0], count)
            k += 1
        }

        if num > 1 {
            faktorler[num] = max(faktorler[num, default: 0], 1)
        }
    }

    var enKucuk = 1
    for (faktor, us) in faktorler {
        enKucuk *= Int(pow(Double(faktor), Double(us)))
    }

    return enKucuk
}

let aralik = 1...5
let sonuc = enKucukBolenSayi(aralik)
print("1'den 20'ye kadar olan tüm sayıları bölen en küçük pozitif sayı: \(sonuc)")


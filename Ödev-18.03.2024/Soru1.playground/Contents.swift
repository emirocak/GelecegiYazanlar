// istediğimiz sıradaki asal sayıyı bulma
func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

func AsalıBul(_ n: Int) -> Int {
    var count = 0
    var number = 2

    while true {
        if isPrime(number) {
            count += 1
            if count == n {
                return number
            }
        }
        number += 1
    }
}

let n = 6
let Sonuc = AsalıBul(n)
print("\(n). asal sayı: \(Sonuc)")

//Hocam bundan pek emin değilim



func isPalindrome(_ number: Int) -> Bool {
    let numberStr = String(number)
    return numberStr == String(numberStr.reversed())
}

func findLargestPalindrome() -> Int {
    var largestPalindrome = 0

    for i in 100..<1000 {
        for j in 100..<1000 {
            let product = i * j
            if isPalindrome(product) && product > largestPalindrome {
                largestPalindrome = product
            }
        }
    }

    return largestPalindrome
}

let largestPalindrome = findLargestPalindrome()
print("İki 3 basamaklı sayının çarpımı olarak elde edilebilecek en büyük palindrom sayı: \(largestPalindrome)")

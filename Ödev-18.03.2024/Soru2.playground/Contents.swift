// İki parametreli ve farklı tipli bir generic örneği
struct Giris<E, O> {
    var username: E // Kullanıcı adını temsil eden değişken
    var password: O // Parolayı temsil eden değişken
    
    init(username: E, password: O) {
        self.username = username // Kullanıcı adı ataması
        self.password = password // Parola Ataması
    }
}


let user = Giris(username: "Emir", password: "OCAK")
print("Username: \(user.username), Password: \(user.password)")

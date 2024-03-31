import Foundation

struct User {
    var login: String
    var password: String
}

extension User {
    static var user = [
    User(login: "ios@mail.ru", password: "000000Aa")
    ]
}

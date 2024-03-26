import Foundation

struct User {
    var login: String
    var password: String
}

extension User {
    static var user = [
    User(login: "1", password: "1")
    ]
}

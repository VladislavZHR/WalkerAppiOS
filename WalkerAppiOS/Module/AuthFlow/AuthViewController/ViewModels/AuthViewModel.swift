import UIKit
import Combine

final class AuthViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var canSubmit = false
    
    var emailPrompt: String? {
        if email.isEmpty || isValidLogin {
            return nil
        } else {
            return "Incorrect e-mail"
        }
    }
    
    var PasswordPrompt: String? {
        if password.isEmpty || isValidPassword {
            return nil
        } else {
            return "Password must be equal or more 8 symbol"
        }
    }
    
    @Published private var isValidLogin = false
    @Published private var isValidPassword = false
    
    private let emailPredicate = NSPredicate(format: "SELF MATCHES %@", Regex.regexLogin)
    
    private var cancellable: Set<AnyCancellable> = []
    
    init() {
        $email
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { email in
                return self.emailPredicate.evaluate(with: email)
            }
            .assign(to: \.isValidLogin, on: self)
            .store(in: &cancellable)
        
        $password
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { password in
                return password.count >= 8
            }
            .assign(to: \.isValidPassword, on: self)
            .store(in: &cancellable)
        
        Publishers.CombineLatest($isValidLogin, $isValidPassword)
            .map { email, password in
                return (email && password)
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellable)
    }
}

import UIKit
import Combine



final class AuthViewModel: ObservableObject {
    
//    var emailSubject = CurrentValueSubject<String, Never>("")
//    var passwordSubject = CurrentValueSubject<String, Never>("")
//    
//    
//    @Published var canSubmit = false
//    
//    @Published private var isValidLogin = false
//    @Published private var isValidPassword = false
//    
//    private let emailPreicate = NSPredicate(format: "SELF MATCHES %@", Regex.regexLogin)
//    private var cancellables: Set<AnyCancellable> = []
//    
//    init() {
//
//        canAuthPublisher
//            .sink {
//                print(Thread.current)
//                self.canSubmit = $0
//            }
//            .store(in: &cancellables)
//        emailIsValid
//            .assign(to: \.isValidLogin, on: self)
//            .store(in: &cancellables)
//        passwordIsValid
//            .assign(to: \.isValidPassword, on: self)
//            .store(in: &cancellables)
//    }
//    
//    private var emailIsValid: AnyPublisher<Bool, Never> {
//        emailSubject
////            .debounce(for: 0.5, scheduler: RunLoop.main)
//            .map { email in
//                self.emailPreicate.evaluate(with: email)
//            }
//            .eraseToAnyPublisher()
//    }
//    
//    private var passwordIsValid: AnyPublisher<Bool, Never> {
//        passwordSubject
////            .debounce(for: 0.5, scheduler: RunLoop.main)
//            .map { password in
//                password.count >= 8
//            }
//            .eraseToAnyPublisher()
//    }
//    
//    private var canAuthPublisher: AnyPublisher<Bool, Never> {
//        Publishers.CombineLatest(emailIsValid, passwordIsValid)
////            .debounce(for: 0.5, scheduler: RunLoop.main)
//            .map { (email, password) in
//                (email && password)
//            }
//            .eraseToAnyPublisher()
//    }
//    
//    @Published var email = ""
//    @Published var password = ""
//    @Published var canSubmit = false
//    
//    @Published var isValidLogin = false
//    @Published var isValidPassword = false
//    
//    
//    private var isLoginValid: AnyPublisher<Bool,Never> {
//        $email
//            .map { $0.isValidateEmailPredicate() }
//            .eraseToAnyPublisher()
//    }
//    
//    private var isPasswordValid: AnyPublisher<Bool, Never> {
//        $password
//            .map { $0.count >= 8 }
//            .eraseToAnyPublisher()
//    }
//    
//    
//    
//    var isButtonEnabled: AnyPublisher<Bool, Never> {
//        Publishers.CombineLatest(isLoginValid, isPasswordValid)
//            .map { $0 && $1}
//            .eraseToAnyPublisher()
//    }
//
//    
//    init() {
//        
//       isButtonEnabled
//            .sink {
//                self.canSubmit = $0
//            }
//            .store(in: &cancellables)
//        
//        isLoginValid
//            .assign(to: \.isValidLogin, on: self)
//            .store(in: &cancellables)
//        
//        isPasswordValid
//            .assign(to: \.isValidPassword, on: self)
//            .store(in: &cancellables)
//    }
    
    
    @Published var email = ""
    @Published var password = ""
    
    
    private var cancellables: Set<AnyCancellable> = []
    
    var isValidEmail: AnyPublisher<Bool, Never> {
        $email
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .filter{ !$0.isEmpty }
            .map { !$0.isEmpty && $0.isValidateEmailPredicate()}
            .eraseToAnyPublisher()
    }
    
    var isValidPassword: AnyPublisher<Bool, Never> {
        $password
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .filter{ !$0.isEmpty }
            .map { !$0.isEmpty && $0.count >= 8}
            .eraseToAnyPublisher()
    }
    
    var isLoginEnabled: AnyPublisher<Bool, Never> {
        
        Publishers.CombineLatest(isValidEmail, isValidPassword)
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { $0 && $1 }
            .eraseToAnyPublisher()
    }
    
    init() {}
    
}


    


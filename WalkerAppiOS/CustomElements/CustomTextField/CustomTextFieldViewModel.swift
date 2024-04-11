import UIKit
import Combine
//
//final class CustomTextFieldViewModel {
//    
//    @Published var email = ""
//    @Published var password = ""
//    
//
//    
// 
//    
//    var isValidEmail: AnyPublisher<Bool, Never> {
//            $email
//                .debounce(for: 0.5, scheduler: RunLoop.main)
//                .filter{ !$0.isEmpty }
//                .map { $0.isValidateEmailPredicate()}
//                .eraseToAnyPublisher()
//        }
//    
//    var isValidPassword: AnyPublisher<Bool, Never> {
//        $password
//            .debounce(for: 0.5, scheduler: RunLoop.main)
//            .filter{ !$0.isEmpty }
//            .map { $0.count >= 8}
//            .eraseToAnyPublisher()
//    }
//    
//    var isCanSubmit: AnyPublisher<Bool, Never> {
//   
//           Publishers.CombineLatest(isValidEmail, isValidPassword)
//               .debounce(for: 0.5, scheduler: RunLoop.main)
//               .map { $0 && $1 }
//               .eraseToAnyPublisher()
//       }
//    
//    
//    
//    private var cancellables: Set<AnyCancellable> = []
//    
//    init() {
//        
//       
//        
//    }
//    
//}

//final class CustomTextFieldViewModel {
//    
//    @Published var email = ""
//    @Published var password = ""
//    
//    var emailValid: AnyPublisher<Bool, Never> {
//        $email
//            .debounce(for: 0.5, scheduler: RunLoop.main)
//            .filter { !$0.isEmpty }
//            .map { $0.isValidateEmailPredicate() }
//            .eraseToAnyPublisher()
//    }
//    
//    var passwordValid: AnyPublisher<Bool, Never> {
//        $password
//            .debounce(for: 0.5, scheduler: RunLoop.main)
//            .filter { !$0.isEmpty }
//            .map { $0.count >= 8 }
//            .eraseToAnyPublisher()
//    }
//    
//    var canSubmit: AnyPublisher<Bool, Never> {
//        Publishers.CombineLatest(emailValid, passwordValid)
//            .map { $0 && $1 }
//            .eraseToAnyPublisher()
//    }
//    
//    private var cancellables: Set<AnyCancellable> = []
//    
//    init() {
//    }
//}

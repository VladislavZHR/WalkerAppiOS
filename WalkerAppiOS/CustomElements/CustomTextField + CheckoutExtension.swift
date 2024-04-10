//import UIKit
//
// extension CustomTextField {
//    
//    func checkoutTextFieldForData(_ placeholderForCheck: String) {
//        switch placeholderForCheck {
//            
//            case "E-mail":
//            
//            NotificationCenter.default
//                .publisher(for: UITextField.textDidChangeNotification, object: self.textField)
//                .map { ($0.object as? UITextField)?.text ?? "" }
//                .assign(to: \.email, on: customTTextFieldViewModel )
//                .store(in: &cancellables)
//            
//            customTTextFieldViewModel.isValidEmail
//                .receive(on: RunLoop.main)
//                .sink {[weak self] isValid in
//                    guard let self = self else { return }
//                    isValid ? self.isCanSubmit() : self.isNotCanSubmit()
//                }
//                .store(in: &cancellables)
//                
//            case "Пароль":
//            
//            NotificationCenter.default
//                .publisher(for: UITextField.textDidChangeNotification, object: self.textField)
//                .map { ($0.object as? UITextField)?.text ?? "" }
//                .assign(to: \.password, on: customTTextFieldViewModel)
//                .store(in: &cancellables)
//            
//            customTTextFieldViewModel.isValidPassword
//                .receive(on: RunLoop.main)
//                .sink { [weak self] isValid in
//                    
//                    guard let self = self else { return }
//                    isValid ? isCanSubmit() : isNotCanSubmit()
//                }
//                .store(in: &cancellables)
//        
//        default:
//            break
//        }
//    }
//    
//    private func isCanSubmit() {
//        
//        
//        self.textField.textColor = .textFieldColorForText
//        self.layer.borderColor = UIColor.textFieldBorderFor.cgColor
//        self.placeholder.textColor = .textColorPlaceholder
//
//    }
//    
//    private func isNotCanSubmit() {
//    
//            self.textField.textColor = .errorText
//            self.self.layer.borderColor = UIColor.errorText.cgColor
//            self.self.placeholder.textColor = .errorText
//        }
//}

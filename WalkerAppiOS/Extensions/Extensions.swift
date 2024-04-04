import UIKit

extension String {
    
    func isValidateEmailPredicate() -> Bool {
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", Regex.regexLogin)
        return predicate.evaluate(with: self)
        
    }
    
}



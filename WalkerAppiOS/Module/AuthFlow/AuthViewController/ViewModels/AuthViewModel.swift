import UIKit

class AuthViewModel {
    
   var statusText = Dynamic("")
    var onSucces: (() -> ())?
    var onError: (() -> ())?

    
    func checkEnterData(_ login: String?, _ password: String?) {
        
        if login != User.user[0].login || password != User.user[0].password || login == nil || password == nil {
            statusText.value = "Error"
            onError?()
            
        } else {
            onSucces?()

        }
        
    }
    
    
}

import UIKit

final class AuthViewController: UIViewController {
    
    enum Event {
        case authComplete
    }
    
    let authBaseView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "authBaseView")
        imageView.contentMode = .center

        
        return imageView
    }()
    
    var didSendEventHendler: ((AuthViewController.Event) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .purple
        title = "AuthViewController"
        addSubview()
    }
    
    func addSubview() {
        self.view.addSubview(authBaseView)
        self.view.backgroundColor = .init(red: 29/255, green: 133/255, blue: 255/255, alpha: 1)
        
        NSLayoutConstraint.activate([
            authBaseView.topAnchor.constraint(equalTo: view.topAnchor, constant: 53),
            authBaseView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -35),
            authBaseView.widthAnchor.constraint(equalToConstant: 478.69),
            authBaseView.heightAnchor.constraint(equalToConstant: 562.74)
        ])

    }
    
    
}

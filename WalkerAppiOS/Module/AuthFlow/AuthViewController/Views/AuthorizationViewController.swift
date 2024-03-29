import UIKit
import SnapKit

final class AuthorizationViewController: UIViewController {
    
    let rectangleOnBaseView = RectangleSubViewBaseViewAuth()

    private let baseViewImagePetApp: UIImageView = {
        let baseViewImagePetApp = UIImageView()
        baseViewImagePetApp.image = UIImage(named: "BaseViewImagePetApp")
        baseViewImagePetApp.contentMode = .scaleAspectFit
        return baseViewImagePetApp
    }()
    
    private let baseSubViewImagePetApp: UIImageView = {
        let baseSubViewImagePetApp = UIImageView()
        baseSubViewImagePetApp.image = UIImage(named: "BaseSubViewImagePetApp")
        baseSubViewImagePetApp.contentMode = .scaleAspectFit
        return baseSubViewImagePetApp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        
        self.view.backgroundColor = .baseBackground
        
        addConsttraints()
        addAnimateForRectangleOnBaseView()
        addNotification()
    }
    
    private func addConsttraints() {
        
        self.view.addSubview(baseViewImagePetApp)
        self.view.addSubview(baseSubViewImagePetApp)
        
        baseViewImagePetApp.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.horizontalEdges.equalToSuperview()
        }
        
        baseSubViewImagePetApp.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(220)
            $0.height.equalTo(234.28)
            $0.width.equalTo(173.88)
        }
        
        rectangleOnBaseView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(self.view.snp.bottom).offset(-150)
        }
    }
    
    func addAnimateForRectangleOnBaseView() {

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.rectangleOnBaseView.snp.makeConstraints {
                $0.top.equalTo(self.view.snp.top).offset(460)
                $0.bottom.lessThanOrEqualToSuperview()
            }
            UIView.animate(withDuration: 0.8) {
                self.view.layoutIfNeeded()
            } completion: { _ in
                
            }
        }
    }
}

extension AuthorizationViewController {
    
    private func addNotification() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardShow(_ notification: Notification) {
        
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        let keyboardHeigh = keyboardFrame.height
        
        UIView.animate(withDuration: 0.1) {
            self.rectangleOnBaseView.transform = CGAffineTransform(translationX: 0, y: -keyboardHeigh)
        }
    }
    
    @objc func keyboardHide(_ notification: Notification) {
        
        UIView.animate(withDuration: 0.1) {
            self.rectangleOnBaseView.transform = .identity
        }
    }
}
      


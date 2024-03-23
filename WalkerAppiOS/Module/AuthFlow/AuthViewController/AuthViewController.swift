import UIKit
import SnapKit

enum TypeScreen {
    case recover, registration, next
}

final class AuthViewController: UIViewController {
    
    weak var delegateTransitionScreen: TransitionScreen?
        
    let baseViewImagePetApp: UIImageView = {
        let baseViewImagePetApp = UIImageView()
        baseViewImagePetApp.image = UIImage(named: "BaseViewImagePetApp")
        baseViewImagePetApp.contentMode = .scaleAspectFit
        return baseViewImagePetApp
    }()
    
    let baseSubViewImagePetApp: UIImageView = {
        let baseSubViewImagePetApp = UIImageView()
        baseSubViewImagePetApp.image = UIImage(named: "BaseSubViewImagePetApp")
        baseSubViewImagePetApp.contentMode = .scaleAspectFit
        return baseSubViewImagePetApp
    }()
    
    let rectangleOnBaseView: UIView = {
        let rectangleOnBaseView = UIView()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "RectangleOnBaseView")
        rectangleOnBaseView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalToSuperview()
        }
        imageView.contentMode = .scaleToFill
        return rectangleOnBaseView
    }()
    
    let enterLabel: UILabel = {
        let enterLabel = UILabel()
        enterLabel.textColor = .rectangle106
        enterLabel.font = UIFont(name: "SFUIText-Medium", size: 22)
        enterLabel.text = "Вход"
        enterLabel.textAlignment = .center
        enterLabel.isUserInteractionEnabled = true
        return enterLabel
    }()
    
    let textFieldFirst: UITextField = {
        let textFieldFirst = UITextField()
        textFieldFirst.layer.cornerRadius = 10
        textFieldFirst.placeholder = "E-mail"
        textFieldFirst.layer.borderColor = .init(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
        textFieldFirst.layer.borderWidth = 1
        textFieldFirst.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFieldFirst.frame.height))
        textFieldFirst.leftViewMode = .always
        textFieldFirst.textColor = .textFieldColorForText
        return textFieldFirst
    }()
    
    let textFieldSecond: UITextField = {
        let textFieldSecond = UITextField()
        textFieldSecond.layer.cornerRadius = 10
        textFieldSecond.placeholder = "Пароль"
        textFieldSecond.layer.borderColor = .init(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
        textFieldSecond.layer.borderWidth = 1
        textFieldSecond.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFieldSecond.frame.height))
        textFieldSecond.leftViewMode = .always
        return textFieldSecond
    }()
    
    let buttonNext: UIButton = {
        let buttonNext = UIButton(type: .system)
        buttonNext.backgroundColor = .button
        buttonNext.layer.cornerRadius = 32
        buttonNext.setTitle("Далее", for: .normal)
        buttonNext.titleLabel?.textAlignment = .left
        buttonNext.setTitleColor(.white, for: .normal)
        buttonNext.titleLabel?.font = UIFont(name: "SFUIText-Medium", size: 18)
        return buttonNext
    }()
    
    let recoverPasswordButton: UIButton = {
        let recoverPasswordButton = UIButton(type: .system)
        recoverPasswordButton.setTitle("Восстановить пароль", for: .normal)
        recoverPasswordButton.setTitleColor(.colotTextButton, for: .normal)
        recoverPasswordButton.titleLabel?.font = UIFont(name: "SFUIText-Medium", size: 12)
        return recoverPasswordButton
    }()
    
    let registrationButton: UIButton = {
        let registrationButton = UIButton(type: .system)
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.setTitleColor(.colotTextButton, for: .normal)
        registrationButton.titleLabel?.font = UIFont(name: "SFUIText-Medium", size: 12)
        return registrationButton
    }()
    
    let line: UIView = {
        let line = UIView()
        line.backgroundColor = .lineAuthclr
        line.layer.masksToBounds = true
        return line
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addConstraintWithSnp()
        setUPRootView()
        addActionToButton()
        addAnimation()
    }
    
    func addConstraintWithSnp() {
        self.view.addSubview(baseViewImagePetApp)
        self.view.addSubview(baseSubViewImagePetApp)
        self.view.addSubview(rectangleOnBaseView)

        self.rectangleOnBaseView.addSubview(enterLabel)
        self.rectangleOnBaseView.addSubview(textFieldFirst)
        self.rectangleOnBaseView.addSubview(textFieldSecond)
        self.rectangleOnBaseView.addSubview(buttonNext)
        self.rectangleOnBaseView.addSubview(recoverPasswordButton)
        self.rectangleOnBaseView.addSubview(registrationButton)
        self.rectangleOnBaseView.addSubview(line)
        
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
        
        enterLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(self.view.frame.width)
            $0.top.equalTo(rectangleOnBaseView.snp.top).inset(45.5)
            $0.width.equalTo(55)
            $0.height.equalTo(29)
        }
        
        textFieldFirst.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(-self.view.frame.width)
            $0.height.equalTo(59)
            $0.top.equalTo(rectangleOnBaseView.snp.top).offset(104.5)
        }
        
        textFieldSecond.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(self.view.frame.width)
            $0.height.equalTo(59)
            $0.top.equalTo(rectangleOnBaseView.snp.top).offset(179.5)
        }
        
        buttonNext.snp.makeConstraints {
            $0.top.equalTo(rectangleOnBaseView.snp.top).offset(269.5)
            $0.height.equalTo(60)
            $0.centerX.equalToSuperview().offset(-self.view.frame.width)
        }
        
        recoverPasswordButton.snp.makeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(130)
            $0.centerX.equalToSuperview().offset(-self.view.frame.width)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        registrationButton.snp.makeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(78)
            $0.centerX.equalToSuperview().offset(self.view.frame.width)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        line.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(207)
            $0.bottom.equalToSuperview().offset(50)
            $0.height.equalTo(18)
            $0.width.equalTo(1)
        }
        
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeRectangle))
        gesture.direction = .up
        let gestureHidden = UISwipeGestureRecognizer(target: self, action: #selector(gestureHiidden))
        gestureHidden.direction = .down
        
        self.rectangleOnBaseView.addGestureRecognizer(gesture)
        self.rectangleOnBaseView.addGestureRecognizer(gestureHidden)
    }
    
    @objc
    func swipeRectangle() {
        self.rectangleOnBaseView.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.top).offset(460)
            $0.bottom.lessThanOrEqualToSuperview()
        }
        
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            
            self.addSubRectangle()
        }
    }
    
    @objc func gestureHiidden() {
        
        self.rectangleOnBaseView.snp.remakeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(self.view.snp.bottom).offset(-150)
        }
        
        self.enterLabel.snp.remakeConstraints {
            $0.centerX.equalToSuperview().offset(self.view.frame.width)
            $0.top.equalTo(rectangleOnBaseView.snp.top).inset(45.5)
            $0.width.equalTo(55)
            $0.height.equalTo(29)
        }
        
        self.textFieldFirst.snp.remakeConstraints {
            $0.centerX.equalToSuperview().offset(-self.view.frame.width)
            $0.height.equalTo(59)
            $0.top.equalTo(rectangleOnBaseView.snp.top).offset(104.5)
        }
        
        self.textFieldSecond.snp.remakeConstraints {
            $0.centerX.equalToSuperview().offset(self.view.frame.width)
            $0.height.equalTo(59)
            $0.top.equalTo(rectangleOnBaseView.snp.top).offset(179.5)
        }
        
        self.buttonNext.snp.remakeConstraints {
            $0.top.equalTo(rectangleOnBaseView.snp.top).offset(269.5)
            $0.height.equalTo(60)
            $0.centerX.equalToSuperview().offset(-self.view.frame.width)
        }
        
        self.recoverPasswordButton.snp.remakeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(130)
            $0.centerX.equalToSuperview().offset(-self.view.frame.width)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        self.registrationButton.snp.remakeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(78)
            $0.centerX.equalToSuperview().offset(self.view.frame.width)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        self.line.snp.remakeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(207)
            $0.bottom.equalToSuperview().offset(50)
            $0.height.equalTo(18)
            $0.width.equalTo(1)
        }

        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    func addSubRectangle() {
        
        enterLabel.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(rectangleOnBaseView.snp.top).inset(45.5)
            $0.width.equalTo(55)
            $0.height.equalTo(29)
        }
        
        textFieldFirst.snp.remakeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(59)
            $0.top.equalTo(rectangleOnBaseView.snp.top).offset(104.5)
        }
        
        textFieldSecond.snp.remakeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(59)
            $0.top.equalTo(rectangleOnBaseView.snp.top).offset(179.5)
        }
        
        buttonNext.snp.remakeConstraints {
            $0.top.equalTo(rectangleOnBaseView.snp.top).offset(269.5)
            $0.height.equalTo(60)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        recoverPasswordButton.snp.remakeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(130)
            $0.bottom.equalToSuperview().offset(-20)
            $0.left.equalTo(46)
        }
        
        registrationButton.snp.remakeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(78)
            $0.left.equalTo(rectangleOnBaseView.snp.left).offset(264)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        line.snp.remakeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(207)
            $0.bottom.equalToSuperview().offset(-20)
            $0.height.equalTo(18)
            $0.width.equalTo(1)
        }
        
        UIView.animate(withDuration: 1.5) {
            self.view.layoutIfNeeded()
        }
    }

    func setUPRootView() {
        self.view.backgroundColor = .rectangle111
    }
    
    func addActionToButton() {
        recoverPasswordButton.addTarget(self, action: #selector(getRecoverPassword), for: .touchUpInside)
        registrationButton.addTarget(self, action: #selector(getRegistration), for: .touchUpInside)
        buttonNext.addTarget(self, action: #selector(getNextScreen), for: .touchUpInside)
    }
    
    @objc 
    func getRecoverPassword() {
        delegateTransitionScreen?.didTransitionScreen(.recover)
    }
    
    @objc 
    func getRegistration() {
        delegateTransitionScreen?.didTransitionScreen(.registration)
    }
    
    @objc
    func getNextScreen() {
        delegateTransitionScreen?.didTransitionScreen(.next)
    }
}

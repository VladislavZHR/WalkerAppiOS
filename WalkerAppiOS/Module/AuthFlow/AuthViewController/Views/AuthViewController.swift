import UIKit
import SnapKit

enum TypeScreen {
    case recover, registration, next
}

final class AuthViewController: UIViewController {
    
    weak var delegateTransitionScreen: TransitionScreen?
    var keyboardFrameGlobal: CGFloat?
    var authViewModel = AuthViewModel()
    
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
    
    private let rectangleOnBaseView: UIView = {
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
    
    private let enterLabel: UILabel = {
        let enterLabel = UILabel()
        enterLabel.textColor = .rectangle106
        enterLabel.font = UIFont(name: "SFUIText-Medium", size: 22)
        enterLabel.text = "Вход"
        enterLabel.textAlignment = .center
        enterLabel.isUserInteractionEnabled = true
        return enterLabel
    }()
    
    private let textFieldFirst: UITextField = {
        let textFieldFirst = UITextField()
        textFieldFirst.layer.cornerRadius = 10
        textFieldFirst.layer.borderColor = .init(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
        textFieldFirst.layer.borderWidth = 1
        textFieldFirst.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFieldFirst.frame.height))
        textFieldFirst.leftViewMode = .always
        textFieldFirst.textColor = .textFieldColorForText
        textFieldFirst.returnKeyType = .done
        return textFieldFirst
    }()
    
    private let textFieldSecond: UITextField = {
        let textFieldSecond = UITextField()
        textFieldSecond.layer.cornerRadius = 10
        textFieldSecond.layer.borderColor = .init(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
        textFieldSecond.layer.borderWidth = 1
        textFieldSecond.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFieldSecond.frame.height))
        textFieldSecond.leftViewMode = .always
        textFieldSecond.textColor = .textFieldColorForText
        textFieldSecond.returnKeyType = .done
        textFieldSecond.isSecureTextEntry = true

        return textFieldSecond
    }()
    
    private let buttonNext: UIButton = {
        let buttonNext = UIButton(type: .system)
        buttonNext.backgroundColor = .button
        buttonNext.layer.cornerRadius = 32
        buttonNext.setTitle("Далее", for: .normal)
        buttonNext.titleLabel?.textAlignment = .left
        buttonNext.setTitleColor(.white, for: .normal)
        buttonNext.titleLabel?.font = UIFont(name: "SFUIText-Medium", size: 18)
        return buttonNext
    }()
    
    private let recoverPasswordButton: UIButton = {
        let recoverPasswordButton = UIButton(type: .system)
        recoverPasswordButton.setTitle("Восстановить пароль", for: .normal)
        recoverPasswordButton.setTitleColor(.colotTextButton, for: .normal)
        recoverPasswordButton.titleLabel?.font = UIFont(name: "SFUIText-Medium", size: 12)
        return recoverPasswordButton
    }()
    
    private let registrationButton: UIButton = {
        let registrationButton = UIButton(type: .system)
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.setTitleColor(.colotTextButton, for: .normal)
        registrationButton.titleLabel?.font = UIFont(name: "SFUIText-Medium", size: 12)
        return registrationButton
    }()
    
    private let line: UIView = {
        let line = UIView()
        line.backgroundColor = .lineAuthclr
        line.layer.masksToBounds = true
        return line
    }()
    
    private let titleLabelFirst: UILabel = {
        let titleLabel = UILabel()
        
        return titleLabel
    }()
    
    private let titleLabelSecond: UILabel = {
        let titleLabel = UILabel()
        
        return titleLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addConstraintWithSnp()
        setUPRootView()
        addActionToButton()
        configureTTitleLabel()
        addNotification()
        addDispatch()
        changeColorTextField()
    }
    
    private func addConstraintWithSnp() {
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
        
        self.view.addSubview(titleLabelFirst)
        self.view.addSubview(titleLabelSecond)
        
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
    private func swipeRectangle() {
        
        self.rectangleOnBaseView.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.top).offset(460)
            $0.bottom.lessThanOrEqualToSuperview()
        }
        
        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            
            self.addSubRectangle()
        }
    }
    
    func addDispatch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.rectangleOnBaseView.snp.makeConstraints {
                $0.top.equalTo(self.view.snp.top).offset(460)
                $0.bottom.lessThanOrEqualToSuperview()
            }
            UIView.animate(withDuration: 0.8) {
                self.view.layoutIfNeeded()
            } completion: { _ in
                self.addSubRectangle()
            }
        }
    }
    
    @objc 
    private func gestureHiidden() {
        self.view.endEditing(true)
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
    
    private func addSubRectangle() {
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
        
        UIView.animate(withDuration: 0.9) {
            self.view.layoutIfNeeded()
        }
    }

    private func setUPRootView() {
        self.view.backgroundColor = .rectangle111
    }
    
    private func addActionToButton() {
        recoverPasswordButton.addTarget(self, action: #selector(getRecoverPassword), for: .touchUpInside)
        registrationButton.addTarget(self, action: #selector(getRegistration), for: .touchUpInside)
        buttonNext.addTarget(self, action: #selector(getNextScreen), for: .touchUpInside)
    }
    
    @objc 
    private func getRecoverPassword() {
        delegateTransitionScreen?.didTransitionScreen(.recover)
    }
    
    @objc 
    private func getRegistration() {
        delegateTransitionScreen?.didTransitionScreen(.registration)
    }
        
    @objc private func getNextScreen() {

        if let email = textFieldFirst.text, let password = textFieldSecond.text {
            if !email.isEmpty && !password.isEmpty {
                authViewModel.checkEnterData(email, password)
                return
            } else {
                authViewModel.checkEnterData(nil, nil)

            }
        }
    }
}

extension AuthViewController: UITextFieldDelegate {
    
    private func configureTTitleLabel() {
        
        textFieldFirst.delegate = self
        textFieldSecond.delegate = self
        
        titleLabelFirst.text = "E-mail"
        titleLabelFirst.textColor = .textColorPlaceholder
        titleLabelFirst.backgroundColor = .rectalgleCLR
        titleLabelFirst.font = UIFont(name: "SFUIText-Light", size: 15)
        
        titleLabelSecond.text = "Пароль"
        titleLabelSecond.textColor = .textColorPlaceholder
        titleLabelSecond.backgroundColor = .rectalgleCLR
        titleLabelSecond.font = UIFont(name: "SFUIText-Light", size: 15)
        
        titleLabelFirst.snp.makeConstraints {
            $0.left.equalTo(textFieldFirst.snp.left).offset(10)
            $0.centerY.equalTo(textFieldFirst.snp.centerY)
        }
        
        titleLabelSecond.snp.makeConstraints {
            $0.left.equalTo(textFieldSecond.snp.left).offset(10)
            $0.centerY.equalTo(textFieldSecond.snp.centerY)
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        changeColorTextField()

        if textField == textFieldFirst {
            if let text = textField.text, !text.isEmpty {
                textFieldFirst.text = text
                
                titleLabelFirst.transform = .init(translationX: 15, y: -self.textFieldFirst.frame.height/2)
                authViewModel.checkEnterData(text, "")
                
                if textFieldSecond.text?.isEmpty ?? true {
                    titleLabelSecond.transform = .identity
                    
                } else {
                    titleLabelSecond.transform = .init(translationX: 15, y: -self.textFieldSecond.frame.height/2)
                }
            } else {
                titleLabelFirst.transform = .identity
                
                if textFieldSecond.text?.isEmpty ?? true {
                    titleLabelSecond.transform = .identity
                    
                } else {
                    titleLabelSecond.transform = .init(translationX: 15, y: -self.textFieldSecond.frame.height/2)
                }
            }
        } else if textField == textFieldSecond {
            if let text = textField.text, !text.isEmpty {
                textFieldSecond.text = text
                titleLabelSecond.transform = .init(translationX: 15, y: -self.textFieldSecond.frame.height/2)
                
                if textFieldFirst.text?.isEmpty ?? true {
                    titleLabelFirst.transform = .identity
                    
                } else {
                    titleLabelFirst.transform = .init(translationX: 15, y: -self.textFieldFirst.frame.height/2)
                }
            } else {
                titleLabelSecond.transform = .identity
                if textFieldFirst.text?.isEmpty ?? true {
                    titleLabelFirst.transform = .identity
                    
                } else {
                    titleLabelFirst.transform = .init(translationX: 15, y: -self.textFieldFirst.frame.height/2)
                }            }
        }

        return true
    }
    
    private func addNotification() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func keyShow(_ notification: Notification) {
        
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let keyboardHeight = keyboardFrame.size.height
        keyboardFrameGlobal = keyboardHeight
        
        guard let firstHeigh = keyboardFrameGlobal else {return}
        let KeyfirstHeigh = firstHeigh + textFieldFirst.frame.height/2
        
        UIView.animate(withDuration: 0.2) {
            self.rectangleOnBaseView.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight)
            self.titleLabelFirst.transform = CGAffineTransform(translationX: 15, y: -KeyfirstHeigh)
            self.titleLabelSecond.transform = CGAffineTransform(translationX: 15, y: -KeyfirstHeigh)
        }
    }
    
    @objc
    func keyHidden(_ notification: Notification) {
        
        UIView.animate(withDuration: 0.2) {
            self.rectangleOnBaseView.transform = .identity
            self.titleLabelFirst.transform = .identity
            self.titleLabelSecond.transform = .identity
        }
    }
    
    private func shakeTextFields(_ textFields: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textFields.center.x - 15, y: textFields.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textFields.center.x + 15, y: textFields.center.y))
        
        textFields.layer.add(animation, forKey: "position")
    }
    
    private func changeColorTextField() {
        authViewModel.onSucces = {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.delegateTransitionScreen?.didTransitionScreen(.next)
                self.textFieldFirst.text = nil
                self.textFieldSecond.text = nil
                self.textFieldFirst.layer.borderColor = .init(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
                self.textFieldSecond.layer.borderColor = .init(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
            }
        }
        
        authViewModel.onError = { [weak self] in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self?.textFieldFirst.layer.borderColor = .init(red: 255/255, green: 0, blue: 0, alpha: 0.8)
                self?.textFieldSecond.layer.borderColor = .init(red: 255/255, green: 0, blue: 0, alpha: 0.8)
                self?.shakeTextFields(self?.textFieldFirst ?? UITextField())
                self?.shakeTextFields(self?.textFieldSecond ?? UITextField())
            }
        }
    }
}



    
    
    


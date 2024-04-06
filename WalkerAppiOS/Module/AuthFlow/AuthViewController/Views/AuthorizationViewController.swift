import UIKit
import SnapKit
import Combine

final class AuthorizationViewController: UIViewController {
    
    weak var delegateTransitionScreen: TransitionScreen?
    private var authViewModel = AuthViewModel()
    private var cancellables = Set<AnyCancellable>()

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
    
    private let loginTextField: CustomTextField = {
        let loginTextField = CustomTextField(frame: .zero, placeholder: "E-mail")
        
        
        return loginTextField
    }()
    
    private let passwordTextField: CustomTextField = {
        let passwordTextField = CustomTextField(frame: .zero, placeholder: "Пароль")
        passwordTextField.toggle = true
        
        return passwordTextField
    }()
    
    private let buttonNext: UIButton = {
        let buttonNext = UIButton(type: .system)
        buttonNext.backgroundColor = .systemGray
        buttonNext.layer.cornerRadius = 32
        buttonNext.setTitle("Далее", for: .normal)
        buttonNext.setTitleColor(.white, for: .normal)
        buttonNext.titleLabel?.font = UIFont(name: "SFUIText-Medium", size: 18)
        buttonNext.isEnabled = false
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

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        
        self.view.backgroundColor = .baseBackground
        
        addView()
        baseMakeConstraint()
        makeConsttraints()
        addAnimateForRectangleOnBaseView()
        addNotification()
        addGesture()
        addActionToButton()
        getEnabledForButton()
        addTargetForNextButton()
        resetSettingsForDelete()
    }
    
    private func addAnimateForRectangleOnBaseView() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            self.remakeConstraints()
            UIView.animate(withDuration: 0.8) {
                self.view.layoutIfNeeded()
            }
        }
    }
}

private extension AuthorizationViewController {
    
    func addNotification() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc 
    func keyboardShow(_ notification: Notification) {
        
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        let keyboardHeigh = keyboardFrame.height
        
        UIView.animate(withDuration: 0.1) {
            self.rectangleOnBaseView.transform = CGAffineTransform(translationX: 0, y: -keyboardHeigh)
        }
    }
    
    @objc 
    func keyboardHide(_ notification: Notification) {
        
        
        
        UIView.animate(withDuration: 0.1) {
            self.rectangleOnBaseView.transform = .identity
        }
    }
}

private extension AuthorizationViewController {
    
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
}

private extension AuthorizationViewController {
    
    func addGesture() {
        
        let gestureShow = UISwipeGestureRecognizer(target: self, action: #selector(showRectanlge))
        gestureShow.direction = .up
        let gestureHide = UISwipeGestureRecognizer(target: self, action: #selector(hideRectangle))
        gestureHide.direction = .down
        
        self.rectangleOnBaseView.addGestureRecognizer(gestureShow)
        self.rectangleOnBaseView.addGestureRecognizer(gestureHide)
    }
    
    @objc 
    func showRectanlge() {
        
        self.remakeConstraints()
        
        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc 
    func hideRectangle() {
        
        self.loginTextField.textField.resignFirstResponder()
        self.passwordTextField.textField.resignFirstResponder()
        self.passwordTextField.deleteSecure()
        self.makeConsttraints()
        self.resetTextField()
        self.resetSeetingsForCombine()

        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        }
    }
}

private extension AuthorizationViewController {
    
    func addView() {
        
        self.view.addSubview(baseViewImagePetApp)
        self.view.addSubview(baseSubViewImagePetApp)
        self.view.addSubview(rectangleOnBaseView)
        self.rectangleOnBaseView.addSubview(enterLabel)
        self.rectangleOnBaseView.addSubview(buttonNext)
        self.rectangleOnBaseView.addSubview(registrationButton)
        self.rectangleOnBaseView.addSubview(recoverPasswordButton)
        self.rectangleOnBaseView.addSubview(line)
        self.rectangleOnBaseView.addSubview(loginTextField)
        self.rectangleOnBaseView.addSubview(passwordTextField)
    }
    
    func baseMakeConstraint() {
        
        self.baseViewImagePetApp.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.horizontalEdges.equalToSuperview()
        }
        
        self.baseSubViewImagePetApp.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(220)
            $0.height.equalTo(234.28)
            $0.width.equalTo(173.88)
        }
    }
    
    func makeConsttraints() {
        
        self.rectangleOnBaseView.snp.remakeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(self.view.snp.bottom).offset(-100)
        }
        
        self.enterLabel.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(45.5)
            $0.width.equalTo(55)
            $0.height.equalTo(29)
        }
        
        self.loginTextField.snp.remakeConstraints {
            $0.right.equalToSuperview().offset(-self.view.frame.width)
            $0.height.equalTo(60)
            $0.top.equalToSuperview().offset(104.5)
        }
        
        self.passwordTextField.snp.remakeConstraints {
            $0.left.equalToSuperview().offset(self.view.frame.width)
            $0.height.equalTo(60)
            $0.top.equalToSuperview().offset(179.5)
        }
        
        self.buttonNext.snp.remakeConstraints {
            $0.right.equalToSuperview().offset(-self.view.frame.width)
            $0.height.equalTo(60)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(25)
        }
        
        self.recoverPasswordButton.snp.remakeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(130)
            $0.bottom.equalToSuperview().offset(100)
            $0.left.equalTo(46)
        }
        
        self.registrationButton.snp.remakeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(78)
            $0.left.equalTo(recoverPasswordButton.snp.right).offset(88)
            $0.bottom.equalToSuperview().offset(100)
        }
        
        self.line.snp.remakeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(1)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(100)
        }
    }
    
    func remakeConstraints() {
        
        self.rectangleOnBaseView.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.top).offset(460)
            $0.bottom.lessThanOrEqualToSuperview()
        }
        
        self.enterLabel.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(45.5)
            $0.width.equalTo(55)
            $0.height.equalTo(29)
        }
        
        self.loginTextField.snp.remakeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
            $0.top.equalToSuperview().offset(104.5)
        }
        
        self.passwordTextField.snp.remakeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
            $0.top.equalToSuperview().offset(179.5)
        }
        
        self.buttonNext.snp.remakeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.height.equalTo(60)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(25)
        }
        
        self.recoverPasswordButton.snp.remakeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(130)
            $0.bottom.equalToSuperview().offset(-30)
            $0.left.equalTo(46)
        }
        
        self.registrationButton.snp.remakeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(78)
            $0.left.equalTo(recoverPasswordButton.snp.right).offset(88)
            $0.bottom.equalToSuperview().offset(-30)
        }
        
        self.line.snp.remakeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(1)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-30)
        }
    }
}
    
private extension AuthorizationViewController {
    
    func getEnabledForButton() {
        
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: loginTextField.textField)
            .map { ($0.object as? UITextField)?.text ?? "" }
            .breakpoint()
            .assign(to: \.email, on: authViewModel)
            .store(in: &cancellables)

        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: passwordTextField.textField)
            .map { ($0.object as? UITextField)?.text ?? "" }
            .assign(to: \.password, on: authViewModel)
            .store(in: &cancellables)

        authViewModel.isLoginEnabled
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .receive(on: RunLoop.main)
            .sink { [weak self] isEnabled in
                self?.buttonNext.isEnabled = isEnabled

                isEnabled ? self?.isCanSubmit() : self?.isNotCanSubmit()
            }
            .store(in: &cancellables)
    }

    func isCanSubmit() {
        
        self.buttonNext.isEnabled = true
        self.buttonNext.backgroundColor = .button
        self.loginTextField.textField.textColor = .textFieldColorForText
        self.passwordTextField.textField.textColor = .textFieldColorForText
        self.loginTextField.layer.borderColor = UIColor.textFieldBorderFor.cgColor
        self.passwordTextField.layer.borderColor = UIColor.textFieldBorderFor.cgColor
        self.passwordTextField.placeholder.textColor = .textColorPlaceholder
        self.loginTextField.placeholder.textColor = .textColorPlaceholder

    }
    
    private func isNotCanSubmit() {
        
        self.buttonNext.isEnabled = false
        self.loginTextField.textField.textColor = .errorText
        self.passwordTextField.textField.textColor = .errorText
        self.loginTextField.layer.borderColor = UIColor.errorText.cgColor
        self.passwordTextField.layer.borderColor = UIColor.errorText.cgColor
        self.passwordTextField.placeholder.textColor = .errorText
        self.loginTextField.placeholder.textColor = .errorText
    }
}

private extension AuthorizationViewController {
    
    func addTargetForNextButton() {
        
        self.buttonNext.addTarget(self, action: #selector(getNextScreen), for: .touchUpInside)
    }
    
    @objc
    func getNextScreen() {
        
            if self.loginTextField.textField.text == User.user[0].login && self.passwordTextField.textField.text == User.user[0].password {
        
                self.isCanSubmit()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.delegateTransitionScreen?.didTransitionScreen(.next)
                    self.resetTextField()

                }
            } else {
                    self.shakeTextField()
            }
    }
    
    func shakeTextField() {
        
        self.isNotCanSubmit()
        
        let shakeLoginTextField = CABasicAnimation(keyPath: "position")
        shakeLoginTextField.duration = 0.05
        shakeLoginTextField.repeatCount = 4
        shakeLoginTextField.autoreverses = true
        shakeLoginTextField.fromValue = NSValue(cgPoint: CGPoint(x: loginTextField.center.x - 5, y: loginTextField.center.y))
        shakeLoginTextField.toValue = NSValue(cgPoint: CGPoint(x: loginTextField.center.x + 5, y: loginTextField.center.y))
        loginTextField.layer.add(shakeLoginTextField, forKey: "position")
        
        let shakePasswordTextField = CABasicAnimation(keyPath: "position")
        shakePasswordTextField.duration = 0.05
        shakePasswordTextField.repeatCount = 4
        shakePasswordTextField.autoreverses = true
        shakePasswordTextField.fromValue = NSValue(cgPoint: CGPoint(x: passwordTextField.center.x - 5, y: passwordTextField.center.y))
        shakePasswordTextField.toValue = NSValue(cgPoint: CGPoint(x: passwordTextField.center.x + 5, y: passwordTextField.center.y))
        passwordTextField.layer.add(shakePasswordTextField, forKey: "position")
    }
}

private extension AuthorizationViewController {
    
    func resetTextField() {
        
        self.loginTextField.textField.text = ""
        self.passwordTextField.textField.text = ""
        self.buttonNext.isEnabled = false
        self.buttonNext.backgroundColor = .systemGray
        self.loginTextField.textField.textColor = .textFieldColorForText
        self.passwordTextField.textField.textColor = .textFieldColorForText
        self.loginTextField.layer.borderColor = UIColor.textFieldBorderFor.cgColor
        self.passwordTextField.layer.borderColor = UIColor.textFieldBorderFor.cgColor
        self.passwordTextField.placeholder.textColor = .textColorPlaceholder
        self.loginTextField.placeholder.textColor = .textColorPlaceholder
        self.loginTextField.textField.isHidden = true
        self.passwordTextField.textField.isHidden = true
        self.loginTextField.placeholder.font = UIFont(name: "SFUIText-Medium", size: 16)
        self.passwordTextField.placeholder.font = UIFont(name: "SFUIText-Medium", size: 16)
        
    }
    
    func resetSeetingsForCombine() {
        self.loginTextField.textField.textColor = .textFieldColorForText
        self.passwordTextField.textField.textColor = .textFieldColorForText
        self.loginTextField.layer.borderColor = UIColor.textFieldBorderFor.cgColor
        self.passwordTextField.layer.borderColor = UIColor.textFieldBorderFor.cgColor
        self.passwordTextField.placeholder.textColor = .textColorPlaceholder
        self.loginTextField.placeholder.textColor = .textColorPlaceholder
    }
    
    func resetSettingsForDelete() {
        
//        if loginTextField.resettSettingsForCombine {
//            self.loginTextField.textField.textColor = .textFieldColorForText
//            self.loginTextField.layer.borderColor = UIColor.textFieldBorderFor.cgColor
//            self.loginTextField.placeholder.textColor = .textColorPlaceholder
//        }
//        
//        if passwordTextField.resettSettingsForCombine {
//            self.passwordTextField.textField.textColor = .textFieldColorForText
//            self.passwordTextField.layer.borderColor = UIColor.textFieldBorderFor.cgColor
//            self.passwordTextField.placeholder.textColor = .textColorPlaceholder
//        }
        
    }
    
}


    


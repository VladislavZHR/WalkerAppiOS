import UIKit
import SnapKit

final class RectangleSubViewBaseViewAuth: UIView {
    
    weak var delegateTransitionScreen: TransitionScreen?
    
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
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        stackView.spacing = 15
        stackView.alignment = .center
        return stackView
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
        let passwordTextField = CustomTextField(frame: .zero, placeholder: "Введите пароль")
        
        return passwordTextField
    }()
    
    private let buttonNext: UIButton = {
        let buttonNext = UIButton(type: .system)
        buttonNext.backgroundColor = .systemGray
        buttonNext.layer.cornerRadius = 32
        buttonNext.setTitle("Далее", for: .normal)
        buttonNext.titleLabel?.textAlignment = .left
        buttonNext.setTitleColor(.white, for: .normal)
        buttonNext.titleLabel?.font = UIFont(name: "SFUIText-Medium", size: 18)
        buttonNext.isEnabled = false
        return buttonNext
    }()
    
    private let recoverPasswordButton: UIButton = {
        let recoverPasswordButton = UIButton(type: .system)
        recoverPasswordButton.setTitle("Восстановить пароль", for: .normal)
        recoverPasswordButton.setTitleColor(.colotTextButton, for: .normal)
        recoverPasswordButton.titleLabel?.font = UIFont(name: "SFUIText-Light", size: 12)
        return recoverPasswordButton
    }()
    
    private let registrationButton: UIButton = {
        let registrationButton = UIButton(type: .system)
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.setTitleColor(.colotTextButton, for: .normal)
        registrationButton.titleLabel?.font = UIFont(name: "SFUIText-Light", size: 12)
        return registrationButton
    }()
    
    private let line: UIView = {
        let line = UIView()
        line.backgroundColor = .lineAuthclr
        line.layer.masksToBounds = true
        return line
    }()
    
    private let incorrectLogin: UILabel = {
        let incorrectLogin = UILabel()
        incorrectLogin.text = "Введите корректный e-mail"
        incorrectLogin.textColor = .red
        incorrectLogin.font = UIFont(name: "SFUIText-Light", size: 10)
        incorrectLogin.isHidden = true
        
        return incorrectLogin
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        
        self.addSubview(rectangleOnBaseView)
        self.addSubview(stackView)
        self.addSubview(enterLabel)
        self.addSubview(buttonNext)
        self.addSubview(registrationButton)
        self.addSubview(recoverPasswordButton)
        self.addSubview(line)
        

        self.stackView.addArrangedSubview(loginTextField)
        self.stackView.addArrangedSubview(incorrectLogin)
        self.stackView.addArrangedSubview(passwordTextField)
        
        addConstraints()
        addActionToButton()
        addEnabledForNextButton()
        
        self.loginTextField.checkEmail = { [weak self] in
            self?.addCheckoutEmailInCorrect()
        }
        
    }
    
    private func addConstraints() {
        
        self.rectangleOnBaseView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.verticalEdges.equalToSuperview()
        }
        
        self.stackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview().offset(104.5)
        }
        
        self.enterLabel.snp.remakeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(45.5)
            $0.width.equalTo(55)
            $0.height.equalTo(29)
        }
        
        self.loginTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        self.passwordTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        self.incorrectLogin.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
        
        self.buttonNext.snp.remakeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(25)
            $0.height.equalTo(60)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        self.recoverPasswordButton.snp.remakeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(130)
            $0.bottom.equalToSuperview().offset(-20)
            $0.left.equalTo(46)
        }
        
        self.registrationButton.snp.remakeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(78)
            $0.left.equalTo(recoverPasswordButton.snp.right).offset(88)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        self.line.snp.remakeConstraints {
            $0.left.equalTo(recoverPasswordButton.snp.right).offset(43.5)
            $0.right.equalTo(registrationButton.snp.left).offset(-43.5)
            $0.bottom.equalToSuperview().offset(-20)
            $0.height.equalTo(18)
            $0.width.equalTo(1)
        }
    }
    
    private func addEnabledForNextButton() {
        if incorrectLogin.isHidden {
            self.buttonNext.isEnabled = true
            self.buttonNext.backgroundColor = .button
        }
    }
    
    
    
    private func addCheckoutEmailInCorrect() {
        if let text = self.loginTextField.textField.text {
            if let correct = returnIncorrectEmail(text) {
                self.incorrectLogin.isHidden = false
            } else {
                self.incorrectLogin.isHidden = true
            }
        }
    }
    
    private func returnIncorrectEmail(_ value: String) -> String? {
        
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value) {
            return "Incorrect"
        } else {
            return nil
        }
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
        delegateTransitionScreen?.didTransitionScreen(.next)
    }
}

  

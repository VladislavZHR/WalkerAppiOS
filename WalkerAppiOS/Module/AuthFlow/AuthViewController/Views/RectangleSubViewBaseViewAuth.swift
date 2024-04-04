import UIKit
import SnapKit
import Combine

final class RectangleSubViewBaseViewAuth: UIView {
    
    private var cancellables = Set<AnyCancellable>()

    weak var delegateTransitionScreen: TransitionScreen?
    
    var authViewModel = AuthViewModel()
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {

        addActionToButton()
        getEnabledForButton()
        addSubViews()
//        subscribeToViewModelChanges()

        self.rectangleOnBaseView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        self.enterLabel.snp.updateConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(45.5)
            $0.width.equalTo(55)
            $0.height.equalTo(29)
        }
        
        self.loginTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
            $0.top.equalToSuperview().offset(104.5)
        }
        
        self.passwordTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
            $0.top.equalToSuperview().offset(179.5)
            
        }
        
        self.buttonNext.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(25)
            $0.height.equalTo(60)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        self.recoverPasswordButton.snp.makeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(130)
            $0.bottom.equalToSuperview().offset(-30)
            $0.left.equalTo(46)
        }
        
        self.registrationButton.snp.makeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(78)
            $0.left.equalTo(recoverPasswordButton.snp.right).offset(88)
            $0.bottom.equalToSuperview().offset(-30)
        }
        
        self.line.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-30)
            $0.height.equalTo(18)
            $0.width.equalTo(1)
        }
//        configureWithCombine()
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
    
    
//    private func configureWithCombine() {
//        loginTextField.sendToSubject = { [weak self] value in
//                
//            self?.authViewModel.emailSubject
//                .send(value)
//        }
//        
//        passwordTextField.sendToSubject = { [weak self] value in
//            self?.authViewModel.passwordSubject
//                .send(value)
//        }
//        
//        authViewModel.$canSubmit
//            .sink { [weak self] canSubmit in
//                canSubmit ? self?.isCanSubmit() : self?.isNotCanSubmit()
//            }
//            .store(in: &cancellables)
//    }
    
    private func getEnabledForButton() {
        
//        NotificationCenter.default
//            .publisher(for: UITextField.textDidChangeNotification, object: loginTextField.textField)
//            .map { ($0.object as? UITextField)?.text ?? "" }
//            .breakpoint()
//            .assign(to: \.email, on: authViewModel)
//            .store(in: &cancellables)
//        
//        NotificationCenter.default
//            .publisher(for: UITextField.textDidChangeNotification, object: passwordTextField.textField)
//            .map { ($0.object as? UITextField)?.text ?? "" }
//            .assign(to: \.password, on: authViewModel)
//            .store(in: &cancellables)
//        
//
//        
//        authViewModel.isLoginEnabled
//            .debounce(for: 0.5, scheduler: RunLoop.main)
//            .receive(on: RunLoop.main)
//            .sink { [weak self] isEnabled in
//                self?.buttonNext.isEnabled = isEnabled
//
//                isEnabled ? self?.isCanSubmit() : self?.isNotCanSubmit()
//            }
//            .store(in: &cancellables)
        
    }

    private func isCanSubmit() {
//        self.buttonNext.isEnabled = true
//        self.incorrectLogin.isHidden = true
//        self.incorrectPassword.isHidden = true
//        self.buttonNext.backgroundColor = .button
//        self.loginTextField.textField.textColor = .textFieldColorForText
//        self.passwordTextField.textField.textColor = .textFieldColorForText
    }
    
    private func isNotCanSubmit() {
//        self.buttonNext.isEnabled = false
//        self.incorrectLogin.isHidden = false
//        self.incorrectPassword.isHidden = false
//        self.loginTextField.textField.textColor = .red
//        self.passwordTextField.textField.textColor = .red
//        self.incorrectLogin.text = "Error"
//        self.incorrectPassword.text = "Error"

    }
}

extension RectangleSubViewBaseViewAuth {
    
    func addSubViews() {
        
        self.addSubview(rectangleOnBaseView)
        self.addSubview(enterLabel)
        self.addSubview(buttonNext)
        self.addSubview(registrationButton)
        self.addSubview(recoverPasswordButton)
        self.addSubview(line)
        self.addSubview(loginTextField)
        self.addSubview(passwordTextField)
    }
    
}


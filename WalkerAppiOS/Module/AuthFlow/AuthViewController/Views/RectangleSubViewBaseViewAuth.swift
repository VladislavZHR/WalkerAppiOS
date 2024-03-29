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
        stackView.spacing = 20
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
        buttonNext.isEnabled = true
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
        
        
        self.addSubview(rectangleOnBaseView)
        self.addSubview(stackView)
        self.addSubview(enterLabel)
        self.addSubview(buttonNext)
        self.addSubview(registrationButton)
        self.addSubview(recoverPasswordButton)
        self.addSubview(line)

        self.stackView.addArrangedSubview(loginTextField)
        self.stackView.addArrangedSubview(passwordTextField)
        
        addConstraints()
        addActionToButton()
        
    }
    
    private func addConstraints() {
        
        self.rectangleOnBaseView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.verticalEdges.equalToSuperview()
        }
        
        self.stackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(150)
            $0.centerY.equalToSuperview()
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
        
        self.buttonNext.snp.remakeConstraints {
            $0.top.equalToSuperview().offset(269.5)
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
            $0.left.equalToSuperview().offset(264)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        self.line.snp.remakeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(207)
            $0.bottom.equalToSuperview().offset(-20)
            $0.height.equalTo(18)
            $0.width.equalTo(1)
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

  


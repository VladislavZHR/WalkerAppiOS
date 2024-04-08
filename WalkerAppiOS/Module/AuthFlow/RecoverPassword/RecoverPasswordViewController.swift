import UIKit
import SnapKit

final class RecoverPasswordViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .colorRecoverPassword
        title = "Напомнить пароль"
        addConstraintWithSnp()
    }
    
    private let emailTextField: CustomTextField = {
        let emailTextfield = CustomTextField(frame: .zero, placeholder: "E-mail")
        
        return emailTextfield
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Пожалуйста, укажите e-mail, который вы использовали для входа в Petapp для того, чтобы мы напомнили ваш пароль."
        label.numberOfLines = 0
        label.font = UIFont(name: "SFUIText-Light", size: 12)
        label.textAlignment = .center
        label.textColor = .colorTextLabelRecover
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 18/15
        paragraphStyle.alignment = .center
        let attributed = NSMutableAttributedString(string: label.text ?? "")
        attributed.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributed.length))
        label.attributedText = attributed
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        
        return label
    }()
    

    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 30
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Отправить код", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFUIText-Medium", size: 18)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .butttonRecoverScreen
        
        return button
    }()
    
    private func addConstraintWithSnp() {
        self.view.addSubview(emailTextField)
        self.view.addSubview(label)
        self.view.addSubview(button)
        
        emailTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(356)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        
        label.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(21)
            $0.top.equalToSuperview().offset(426)
        }
        
        button.snp.makeConstraints {
            $0.width.equalTo(212)
            $0.height.equalTo(60)
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
}



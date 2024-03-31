import UIKit
import SnapKit

final class RecoverPasswordViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .colorRecoverPassword
        title = "Напомнить пароль"
        addConstraintWithSnp()
    }
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.placeholder = "E-mail"
        textField.layer.borderColor = .init(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
        textField.textColor = .textColorPlaceholder
        textField.returnKeyType = .done
        textField.font = UIFont(name: "SFUIText-Light", size: 16)
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)


        
        return textField
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
        let button = UIButton()
        button.layer.cornerRadius = 32
        button.setTitle("Отправить код", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFUIText-Medium", size: 18)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .butttonRecoverScreen
        
        return button
    }()
    
    private func addConstraintWithSnp() {
        self.view.addSubview(textField)
        self.view.addSubview(label)
        self.view.addSubview(button)
        
        
        textField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(356)
            $0.height.equalTo(60)
            
        }
        
        label.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(21)
            $0.top.equalToSuperview().offset(426)
            //Установить расстояниее между линиями
        }
        
        button.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(101)
            $0.height.equalTo(60)
            $0.top.equalTo(label.snp.bottom).offset(20)
            //исправить угловатость кнопки
            //GIT
        }
    }
    
}



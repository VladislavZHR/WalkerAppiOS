import UIKit
import SnapKit

final class CustomTextField: UIView {
    
    var toggle = false
    let contentView = UIView()
    let imageIcon = UIImageView()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
    
        return stackView
    }()
    
    let placeholder: UILabel = {
        let label = UILabel()
        label.textColor = .textColorPlaceholder
        label.backgroundColor = .rectalgleCLR
        label.font = UIFont(name: "SFUIText-Medium", size: 16)
    
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.contentVerticalAlignment = .top
        textField.isHidden = true
        textField.textColor = .textFieldColorForText
        textField.font = UIFont(name: "SFUIText-Medium", size: 16)
        textField.returnKeyType = .done
        textField.autocapitalizationType = .none
        
        return textField
    }()

     init(frame: CGRect, placeholder: String) {
        super.init(frame: frame)
        self.placeholder.text = placeholder
        configure()
        textField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(stackView)
        stackView.addArrangedSubview(placeholder)
        stackView.addArrangedSubview(textField)
        
        setupUI()
        addConstraintsSnp()
        addGesture()
    }
    
    private func setupUI() {
        backgroundColor = UIColor.clear
        layer.borderWidth = 1
        layer.borderColor = UIColor.textFieldBorderFor.cgColor
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(showTextField(_:)))
        stackView.addGestureRecognizer(gesture)
    }
    
    @objc
    func showTextField(_ sender: UIGestureRecognizer) {
        if sender.view is UIStackView {
            textField.isHidden = false
            textField.becomeFirstResponder()
            placeholder.font = UIFont(name: "SFUIText-Medium", size: 12)
           
            textField.snp.updateConstraints {
                       $0.height.equalTo(40)
                   }
                   
            placeholder.snp.updateConstraints {
                       $0.height.equalTo(30)
                   }

            UIView.animate(withDuration: 0.2) {
                self.layoutIfNeeded()
            }
        }
    }
}

extension CustomTextField {
    
    private func addConstraintsSnp() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension CustomTextField: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.becomeFirstResponder()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if self.toggle == true {
            self.addSecure()

        }
        
        if textField.text == "" {
            self.deleteSecure()
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if (textField.text ?? "").isEmpty {
            textField.isHidden = true
            placeholder.font = UIFont(name: "SFUIText-Medium", size: 16)
            self.deleteSecure()
            
            
            UIView.animate(withDuration: 0.2) {
                self.layoutIfNeeded()
            }
        }
    }
}

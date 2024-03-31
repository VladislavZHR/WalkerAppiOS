import UIKit
import SnapKit

final class CustomTextField: UIView {
    
    var checkEmail: (()->())?
    
     let textField: UITextField = {
        let textField = UITextField()
        
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
         textField.layer.borderWidth = 1.5
        textField.layer.borderColor = .init(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.textColor = .textFieldColorForText
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.font = UIFont(name: "SFUIText-Medium", size: 16)
        textField.returnKeyType = .done

        
        return textField
    }()
    
    private let labelPlaceHolder: UILabel = {
        let labelPlaceholder = UILabel()
        labelPlaceholder.textAlignment = .center
        labelPlaceholder.textColor = .textColorPlaceholder
        labelPlaceholder.backgroundColor = .rectalgleCLR
        labelPlaceholder.font = UIFont(name: "SFUIText-Medium", size: 12)
        
        return labelPlaceholder
    }()
    
    init(frame: CGRect, placeholder: String) {
        super.init(frame: frame)
        configure(placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(_ placeholder: String) {
        self.addSubview(textField)
        self.textField.addSubview(labelPlaceHolder)
        addConstraints()
        textField.delegate = self
        
        self.labelPlaceHolder.text = placeholder
    }
    
    private func addConstraints() {
        
        self.textField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.verticalEdges.equalToSuperview()
        }
        
        self.labelPlaceHolder.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.centerY.equalTo(self.textField.snp.centerY)
        }
        
    }
}

extension CustomTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        addTransformLabel()
        self.textField.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        addBackTransformLabel()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkEmail?()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        
        return true
    }
    
    private func addTransformLabel() {
        
        

        self.labelPlaceHolder.snp.updateConstraints {
            $0.left.equalToSuperview().offset(2)
            $0.centerY.equalToSuperview().offset(-15)
        }
        
        self.labelPlaceHolder.transform = .init(scaleX: 0.6, y: 0.6)
        

        
    }
    
    private func addBackTransformLabel() {
        
        guard let text = textField.text , text.isEmpty else { return}
            
            self.labelPlaceHolder.transform = .identity
            self.labelPlaceHolder.snp.updateConstraints {
                $0.left.equalToSuperview().offset(10)
                $0.centerY.equalTo(self.textField.snp.centerY)
            }
        
    }
}

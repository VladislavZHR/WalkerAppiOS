//import UIKit
//import SnapKit
//
//final class CustomTextField: UIView {
//    
//    var sendToSubject: ((String)->())?
//    
//     let textField: UITextField = {
//        let textField = UITextField()
//        
//        textField.autocapitalizationType = .none
//        textField.autocorrectionType = .no
//         textField.layer.borderWidth = 1.5
//        textField.layer.borderColor = .init(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
//        textField.layer.cornerRadius = 10
//        textField.textColor = .textFieldColorForText
//        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
//        textField.leftViewMode = .always
//        textField.font = UIFont(name: "SFUIText-Medium", size: 16)
//        textField.returnKeyType = .done
//
//        
//        return textField
//    }()
//    
//    private let labelPlaceHolder: UILabel = {
//        let labelPlaceholder = UILabel()
//        labelPlaceholder.textAlignment = .center
//        labelPlaceholder.textColor = .textColorPlaceholder
//        labelPlaceholder.backgroundColor = .rectalgleCLR
//        labelPlaceholder.font = UIFont(name: "SFUIText-Medium", size: 12)
//        
//        return labelPlaceholder
//    }()
//    
//    private let stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.alignment = .leading
//        stackView.spacing = 30
//        stackView.backgroundColor = .red
//        
//        return stackView
//    }()
//    
//    init(frame: CGRect, placeholder: String) {
//        super.init(frame: frame)
//        configure(placeholder)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func configure(_ placeholder: String) {
//        self.addSubview(textField)
//        self.textField.addSubview(stackView)
//        self.stackView.addArrangedSubview(labelPlaceHolder)
////        self.addSubview(stackView)
////        self.stackView.addArrangedSubview(textField)
////        self.stackView.addArrangedSubview(labelPlaceHolder)
//        addConstraints()
//        
//        textField.delegate = self
//        
//        self.labelPlaceHolder.text = placeholder
//        
//        
//    }
//    
//    private func addConstraints() {
//        
////        self.stackView.snp.makeConstraints {
////            $0.horizontalEdges.equalToSuperview()
////            
////            
////        }
//        
//        self.textField.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//            
//        }
//        
//        self.stackView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//            
//        }
//        
//        self.labelPlaceHolder.snp.makeConstraints {
//            $0.centerY.equalToSuperview()
//            
//        }
//        
//
//////
////        self.labelPlaceHolder.snp.makeConstraints {
////            $0.horizontalEdges.equalToSuperview()
////        }
//        
////        self.textField.snp.makeConstraints {
////            $0.horizontalEdges.equalToSuperview()
////            $0.verticalEdges.equalToSuperview()
////        }
////        
////        self.labelPlaceHolder.snp.makeConstraints {
////            $0.left.equalToSuperview().offset(10)
////            $0.centerY.equalTo(self.textField.snp.centerY)
////        }
//        
//    }
//}
//
//extension CustomTextField: UITextFieldDelegate {
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        stackView.backgroundColor = .blue
////        addTransformLabel()
////        self.textField.becomeFirstResponder()
//
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
////        addBackTransformLabel()
//    }
//    
//    func textFieldDidChangeSelection(_ textField: UITextField) {
////        sendToSubject?(textField.text ?? "")
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
////        self.textField.resignFirstResponder()
//        
//        return true
//    }
//    
//    private func addTransformLabel() {
//        
//        
//
////        self.labelPlaceHolder.snp.updateConstraints {
////            $0.left.equalToSuperview().offset(2)
////            $0.centerY.equalToSuperview().offset(-15)
////        }
////        
////        self.labelPlaceHolder.transform = .init(scaleX: 0.6, y: 0.6)
//        
//
//        
//    }
//    
//    private func addBackTransformLabel() {
////        
////        guard let text = textField.text , text.isEmpty else { return}
////            
////            self.labelPlaceHolder.transform = .identity
////            self.labelPlaceHolder.snp.updateConstraints {
////                $0.left.equalToSuperview().offset(10)
////                $0.centerY.equalTo(self.textField.snp.centerY)
////            }
//        
//    }
//}

import UIKit
import SnapKit

final class CustomTextField: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
    
        return stackView
    }()
    
    private let placeholder: UILabel = {
        let label = UILabel()
        label.textColor = .textColorPlaceholder
        label.backgroundColor = .rectalgleCLR
        label.font = UIFont(name: "SFUIText-Medium", size: 16)
    
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.contentVerticalAlignment = .top
        textField.isHidden = true
        textField.textColor = .textFieldColorForText
        textField.font = UIFont(name: "SFUIText-Medium", size: 16)
        textField.returnKeyType = .done
        
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
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        if (textField.text ?? "").isEmpty {
            textField.isHidden = true
            placeholder.font = UIFont(name: "SFUIText-Medium", size: 16)
            
            UIView.animate(withDuration: 0.2) {
                self.layoutIfNeeded()
            }
        }
    }
}

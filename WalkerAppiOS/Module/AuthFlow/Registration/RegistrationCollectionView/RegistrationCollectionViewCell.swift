import UIKit
import SnapKit

final class RegistrationCollectionViewCell: UICollectionViewCell {
    
//    var customTextField: CustomTextField?
//    var imageView = UIImageView()
    
    let customTextFieldArray = [
    
        CustomTextField(frame: .zero, placeholder: "E-mail"),
        CustomTextField(frame: .zero, placeholder: "E-mail"),
        CustomTextField(frame: .zero, placeholder: "E-mail"),
        CustomTextField(frame: .zero, placeholder: "E-mail"),
        CustomTextField(frame: .zero, placeholder: "E-mail"),
        CustomTextField(frame: .zero, placeholder: "E-mail"),
        CustomTextField(frame: .zero, placeholder: "E-mail"),
    
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraintsCustomTextField()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    convenience init(frame: CGRect, placeholder: String) {
//        self.init(frame: frame)
//        setupCustomTextField(placeholder: placeholder)
//        addConstraintsCustomTextField()
//    }
    
//    func setupCustomTextField(placeholder: String) {
//        self.customTextField = CustomTextField(frame: .zero, placeholder: placeholder)
//    }
    
    func addConstraintsCustomTextField() {
        
        addSubview(customTextFieldArray[0])
        addSubview(customTextFieldArray[1])
        addSubview(customTextFieldArray[2])
        addSubview(customTextFieldArray[3])
        addSubview(customTextFieldArray[4])
        addSubview(customTextFieldArray[5])
        addSubview(customTextFieldArray[6])
        
        self.customTextFieldArray[0].snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(5)
            $0.top.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(120)
            
        }
        
        self.customTextFieldArray[1].snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(5)
            $0.top.equalToSuperview()
            
        }
        
        self.customTextFieldArray[2].snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(5)
            $0.top.equalToSuperview()
            
        }
        
        self.customTextFieldArray[3].snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(5)
            $0.top.equalToSuperview()
            
        }
        
        self.customTextFieldArray[4].snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(5)
            $0.top.equalToSuperview()
            
        }
        
        self.customTextFieldArray[5].snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(5)
            $0.top.equalToSuperview()
            
        }
        
        self.customTextFieldArray[6].snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(5)
            $0.top.equalToSuperview()
            
        }


        
//        self.contentView.addSubview(imageView)
//        self.imageView.contentMode = .scaleAspectFill
        
//        imageView.snp.makeConstraints {
//            $0.height.equalTo(100)
//            $0.horizontalEdges.equalToSuperview()
//            $0.width.equalTo(122)
//            $0.top.equalToSuperview()
//            
//        }
        
//        guard let textFieldCollectionView = self.customTextField else { return }
//        self.contentView.addSubview(textFieldCollectionView)
//        self.addSubview(customTextField!)
//        
//        customTextField?.snp.makeConstraints({
//            $0.horizontalEdges.equalToSuperview()
//            $0.top.equalToSuperview()
//            $0.height.equalToSuperview()
//            $0.width.equalToSuperview()
//        })
        
        
    }
}

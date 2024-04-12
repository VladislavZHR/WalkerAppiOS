import UIKit

extension CustomTextField {
    

    
    func addSecure() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changeSecure))
        
        
        self.textField.isSecureTextEntry = true
        self.imageIcon.image = UIImage(named: "eye")
        
        contentView.addSubview(imageIcon)
        contentView.addGestureRecognizer(tapGesture)
        
        self.addSubview(contentView)
        
        contentView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(self.snp.right).offset(-10) 
            $0.width.height.equalTo(25)
        }
        
        imageIcon.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.contentMode = .scaleAspectFit

    }
    
    func deleteSecure() {
        
        self.imageIcon.image = .none
        
    }
    
    @objc
    private func changeSecure() {
        self.textField.isSecureTextEntry.toggle()
        
        if textField.isSecureTextEntry {
            self.imageIcon.image = UIImage(named: "eye")
        } else {
            self.imageIcon.image = UIImage(named: "closeEye")

        }
    }
    
}

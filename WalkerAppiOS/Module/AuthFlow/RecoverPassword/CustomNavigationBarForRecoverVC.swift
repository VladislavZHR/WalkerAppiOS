import UIKit
import SnapKit

final class CustomNavigationBarForRecoverVC: UIView {
    
    private lazy var backButton: UIButton = {
        var backButton = UIButton(type: .custom)
        backButton.frame = .init(x: 20, y: 62, width: 34, height: 34)
        backButton.layer.cornerRadius = backButton.frame.width/2
        backButton.backgroundColor = .red
        
        
        return backButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        self.backgroundColor = .clear
        self.addSubview(backButton)
        
     
        
        
    }
}


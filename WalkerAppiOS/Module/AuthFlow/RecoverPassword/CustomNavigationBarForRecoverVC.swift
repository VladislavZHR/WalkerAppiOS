//import UIKit
//import SnapKit
//
//final class CustomNavigationBarForRecoverVC: UIView {
//    
//    private lazy var backButton: UIButton = {
//        var backButton = UIButton(type: .custom)
//        backButton.layer.cornerRadius = 34/2
//        backButton.backgroundColor = .red
//        backButton.backgroundColor = .clear
//        backButton.layer.borderWidth = 2
//        backButton.layer.borderColor = CGColor(red: 117/255, green: 127/255, blue: 140/255, alpha: 0.07)
//        
//        
//        return backButton
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        configure()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func configure() {
//        
//        self.backgroundColor = .clear
//        self.addSubview(backButton)
//        addConstraintsForSubViews()
//        
//    }
//    
//
//    
//    
//}
//
//private extension CustomNavigationBarForRecoverVC {
//    
//    func addConstraintsForSubViews() {
//        
//        self.backButton.snp.makeConstraints {
//            $0.height.equalTo(34)
//            $0.width.equalTo(34)
//            $0.top.equalToSuperview().offset(62)
//            $0.left.equalToSuperview().offset(20)
//        }
//        
//    }
//    
//
//    
//}
//

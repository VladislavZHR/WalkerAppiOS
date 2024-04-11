import UIKit
import SnapKit

final class CustomNavigationBar: UIView {
 
    
    let customButton: UIButton = {
        let customButton = UIButton(type: .custom)
        customButton.setImage(UIImage(named: "backButtonforCustom"), for: .normal)

        return customButton
    }()
    
    let rectangle: UIImageView = {
        let rectangle = UIImageView(frame: .zero)
        rectangle.image = UIImage(named: "blueRectangle")
        rectangle.contentMode = .scaleAspectFit
        
        return rectangle
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

private extension CustomNavigationBar {
    
    func configure() {
        
        self.backgroundColor = .clear
        self.addSubview(rectangle)
        self.addSubview(customButton)
        
        addConstraintsSubView()
    }
    
    func addConstraintsSubView() {
     
        customButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(62)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(34)
            $0.height.equalTo(34)
            
        }
        
        rectangle.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview().offset(-5)
            
        }
    }
}

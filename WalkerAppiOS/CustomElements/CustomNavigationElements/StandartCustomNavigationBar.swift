import UIKit
import SnapKit

final class StandartCustomNavigationBar: UIView {
    
    let customButton: UIButton = {
        let customButton = UIButton(type: .custom)
        customButton.setImage(UIImage(named: "nextButtton"), for: .normal)
        return customButton
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont(name: "SFUIText-Medium", size: 18)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black

        return titleLabel
    }()
    
    private let line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
        
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init()
        self.titleLabel.text = title
    }
}

private extension StandartCustomNavigationBar {
    
    func configure() {
        
        self.backgroundColor = .clear
        self.addSubview(customButton)
        self.addSubview(line)
        self.addSubview(titleLabel)
        addConstraintsSubView()
    }
    
    func addConstraintsSubView() {
     
        customButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(62)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(34)
            $0.height.equalTo(34)
            
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(70)
            
        }
        
        line.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview().offset(120)
            $0.height.equalTo(1)
        }
    }
}

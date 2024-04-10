import UIKit
import SnapKit

final class RecoverPasswordViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .colorRecoverPassword
        title = "Напомнить пароль"
        
        addConstraintWithSnp()
        configureNavigationBar()
        
    }
    
    
    private let emailTextField: CustomTextField = {
        let emailTextfield = CustomTextField(frame: .zero, placeholder: "E-mail")
        
        return emailTextfield
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
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 30
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Отправить код", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFUIText-Medium", size: 18)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .butttonRecoverScreen
        
        return button
    }()
    
    let custom = CustomNavigationBarForRecoverVC(frame: .zero)
    
    private let customButton: UIButton = {
        let customButton = UIButton(type: .custom)
        customButton.backgroundColor = .clear
        customButton.layer.borderWidth = 2
        customButton.layer.borderColor = CGColor(red: 117/255, green: 127/255, blue: 140/255, alpha: 0.07)
        customButton.frame = .init(x: 20, y: 62, width: 34, height: 34)
        customButton.layer.cornerRadius = customButton.frame.width/2
        
        let arrowLayer = CAShapeLayer()
         let arrowPath = UIBezierPath()
         let startPoint = CGPoint(x: 14.17, y: 17.19)
         arrowPath.move(to: startPoint)
         arrowPath.addLine(to: CGPoint(x: startPoint.x + 6.94, y: startPoint.y))
         arrowPath.move(to: startPoint)
         arrowPath.addLine(to: CGPoint(x: startPoint.x + 6.94 / 2, y: startPoint.y + 6.94 / 2))
         arrowLayer.path = arrowPath.cgPath
         arrowLayer.fillColor = UIColor.clear.cgColor
         arrowLayer.strokeColor = UIColor.green.cgColor // Цвет стрелки
         arrowLayer.lineWidth = 2 // Толщина линии стрелки
         
         customButton.layer.addSublayer(arrowLayer)
        
        
        return customButton
    }()
    
    private let subViewForBackButton: UIBezierPath = {
        
        let subViewForBackButtton = UIBezierPath()
        
        return subViewForBackButtton
    }()
    

    @objc
    func dropRecoverViewController() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    private func addConstraintWithSnp() {
        self.view.addSubview(emailTextField)
        self.view.addSubview(label)
        self.view.addSubview(button)
        
        
        emailTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(356)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        
        label.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(21)
            $0.top.equalToSuperview().offset(426)
        }
        
        button.snp.makeConstraints {
            $0.width.equalTo(212)
            $0.height.equalTo(60)
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        

        
        
    }
}

private extension RecoverPasswordViewController {
    
    func configureNavigationBar() {

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customButton)
        customButton.addTarget(self, action: #selector(dropRecoverViewController), for: .touchUpInside)
        self.navigationController?.navigationBar.tintColor = .green
        self.navigationController?.navigationBar.barTintColor = .red
        
    }
}

import UIKit
import SnapKit


final class AuthViewController: UIViewController {
    
    let baseViewImagePetApp: UIImageView = {
        let baseViewImagePetApp = UIImageView()
        baseViewImagePetApp.image = UIImage(named: "BaseViewImagePetApp")
        baseViewImagePetApp.contentMode = .scaleAspectFit

        return baseViewImagePetApp
    }()
    
    let baseSubViewImagePetApp: UIImageView = {
        let baseSubViewImagePetApp = UIImageView()
        baseSubViewImagePetApp.image = UIImage(named: "BaseSubViewImagePetApp")
        baseSubViewImagePetApp.contentMode = .scaleAspectFit

        return baseSubViewImagePetApp
    }()
    
    let rectangleOnBaseView: UIImageView = {
        let rectangleOnBaseView = UIImageView()
        rectangleOnBaseView.image = UIImage(named: "RectangleOnBaseView")
        rectangleOnBaseView.contentMode = .scaleAspectFit

        return rectangleOnBaseView
    }()
    
    let enterLabel: UILabel = {
        let enterLabel = UILabel()
        enterLabel.text = "Вход"
        enterLabel.textColor = .rectangle106
        enterLabel.font = UIFont(name: "SFUIText-Medium", size: 22)
        
        return enterLabel
    }()
    
    let textFieldFirst: UITextField = {
        let textFieldFirst = UITextField()
        textFieldFirst.layer.cornerRadius = 10
        textFieldFirst.placeholder = "E-mail"
        textFieldFirst.layer.borderWidth = 1
        textFieldFirst.layer.borderColor = .init(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
        textFieldFirst.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFieldFirst.frame.height))
        textFieldFirst.leftViewMode = .always
        textFieldFirst.isUserInteractionEnabled = true

        return textFieldFirst
    }()
    
    let textFieldSecond: UITextField = {
        let textFieldSecond = UITextField()
        textFieldSecond.layer.cornerRadius = 10
        textFieldSecond.placeholder = "Пароль"
        textFieldSecond.layer.borderWidth = 1
        textFieldSecond.layer.borderColor = .init(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
        textFieldSecond.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFieldSecond.frame.height))
        textFieldSecond.leftViewMode = .always
        textFieldSecond.isUserInteractionEnabled = true


        return textFieldSecond
    }()
    
    let buttonNext: UIButton = {
        let butttonNext = UIButton()
        butttonNext.backgroundColor = .button
        butttonNext.layer.cornerRadius = 32
        butttonNext.setTitle("Далее", for: .normal)
        
        return butttonNext
    }()
    
    let recoverPasswordButton: UIButton = {
        let recoverPasswordButton = UIButton()
        recoverPasswordButton.setTitle("Восстановить пароль", for: .normal)
        recoverPasswordButton.titleLabel?.textColor = .registrationRecover1
        recoverPasswordButton.titleLabel?.font = UIFont(name: "SFUIText-Bold_0", size: 12)
        
        
        return recoverPasswordButton
    }()
    
    let registrationButton: UIButton = {
        let registrationButton = UIButton()
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.titleLabel?.textColor = .registrationRecover1
        registrationButton.titleLabel?.font = UIFont(name: "SFUIText-Bold_0", size: 12)
        
        
        return registrationButton
    }()
    
    let line: UIView = {
        let line = UIView()
        line.backgroundColor = .registrationRecover1
        line.layer.masksToBounds = true
        
        return line
    }()
    

    
    enum Event {
        case authComplete
    }
    
    
    var didSendEventHendler: ((AuthViewController.Event) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .purple
        
        addConstraintWithSnp()
        setUPRootView()

    }
    
    func addConstraintWithSnp() {
        self.view.addSubview(baseViewImagePetApp)
        self.view.addSubview(baseSubViewImagePetApp)
        self.view.addSubview(rectangleOnBaseView)
        self.rectangleOnBaseView.addSubview(enterLabel)
        self.rectangleOnBaseView.addSubview(textFieldFirst)
        self.rectangleOnBaseView.addSubview(textFieldSecond)
        self.rectangleOnBaseView.addSubview(buttonNext)
        self.rectangleOnBaseView.addSubview(recoverPasswordButton)
        self.rectangleOnBaseView.addSubview(registrationButton)
        self.rectangleOnBaseView.addSubview(line)

        
        baseViewImagePetApp.snp.makeConstraints {
            $0.width.equalTo(view.snp.width)
            $0.height.equalTo(562.74)
            $0.top.equalToSuperview().inset(53)
            $0.left.equalToSuperview()
        }
        
        baseSubViewImagePetApp.snp.makeConstraints {
            $0.width.equalTo(173.88)
            $0.height.equalTo(234.28)
            $0.top.equalToSuperview().inset(237)
            $0.left.equalToSuperview().inset(111)
        }
        
        rectangleOnBaseView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(500.5)
        
            $0.top.equalTo(366)
            $0.left.equalToSuperview()
        }
        
        enterLabel.snp.makeConstraints {
            $0.width.equalTo(55)
            $0.height.equalTo(29)
            $0.top.equalTo(baseSubViewImagePetApp.snp.bottom).offset(45.5)
            $0.centerX.equalTo(rectangleOnBaseView)
        }
        
        textFieldFirst.snp.makeConstraints {
            $0.top.equalTo(baseSubViewImagePetApp.snp.bottom).offset(104.5)
            $0.centerX.equalTo(rectangleOnBaseView)
            $0.width.equalTo(365)
            $0.height.equalTo(59)


        }
        
        textFieldSecond.snp.makeConstraints {
            $0.top.equalTo(baseSubViewImagePetApp.snp.bottom).offset(179.5)
            $0.centerX.equalTo(rectangleOnBaseView)
            $0.width.equalTo(365)
            $0.height.equalTo(59)


        }
        
        buttonNext.snp.makeConstraints {
            $0.top.equalTo(baseSubViewImagePetApp.snp.bottom).offset(269.5)
            $0.centerX.equalTo(rectangleOnBaseView)
            $0.width.equalTo(370)
            $0.height.equalTo(60)
        }
        
        recoverPasswordButton.snp.makeConstraints {
            $0.top.equalTo(baseSubViewImagePetApp.snp.bottom).offset(354.5)
            $0.left.equalTo(46)
            $0.width.equalTo(130)
            $0.height.equalTo(18)
            
        }
        
        registrationButton.snp.makeConstraints {
            $0.top.equalTo(baseSubViewImagePetApp.snp.bottom).offset(354.5)
            $0.left.equalTo(264)
            $0.width.equalTo(78)
            $0.height.equalTo(18)
            
        }
        
        line.snp.makeConstraints {
            $0.top.equalTo(baseSubViewImagePetApp.snp.bottom).offset(354.5)
            $0.left.equalTo(207)
            $0.width.equalTo(1)
            $0.height.equalTo(18)
            
           
            
        }

        
        
    }
    
    func setUPRootView() {
        self.view.backgroundColor = .rectangle111
    }

    
    
    
    
}

import UIKit
import SnapKit

enum TypeScreen {
    case recover, registration, next
}


final class AuthViewController: UIViewController {
    
    var delegateTransitionScreen: TransitionScreen?
        
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
        rectangleOnBaseView.contentMode = .scaleToFill
        
        
        return rectangleOnBaseView
        
        
    }()
    
    

    
    let enterLabel: UILabel = {
        let enterLabel = UILabel()
        enterLabel.textColor = .rectangle106
        enterLabel.font = UIFont(name: "SFUIText-Medium", size: 22)
        enterLabel.text = "Вход"
        enterLabel.textAlignment = .center
        
        

        
        
        return enterLabel
    }()
    

    
    let textFieldFirst: UITextField = {
        let textFieldFirst = UITextField()
        textFieldFirst.layer.cornerRadius = 10
        textFieldFirst.placeholder = "E-mail"
        textFieldFirst.layer.borderColor = .init(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
        textFieldFirst.layer.borderWidth = 1
        textFieldFirst.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFieldFirst.frame.height))
        textFieldFirst.leftViewMode = .always
        textFieldFirst.textColor = .textFieldColorForText

        return textFieldFirst
    }()
    
    let textFieldSecond: UITextField = {
        let textFieldSecond = UITextField()
        textFieldSecond.layer.cornerRadius = 10
        textFieldSecond.placeholder = "Пароль"
        textFieldSecond.layer.borderColor = .init(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
        textFieldSecond.layer.borderWidth = 1
        textFieldSecond.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFieldSecond.frame.height))
        textFieldSecond.leftViewMode = .always
        textFieldSecond.textColor = .textFieldColorForText



        return textFieldSecond
    }()
    
    let buttonNext: UIButton = {
        let buttonNext = UIButton(type: .system)
        buttonNext.backgroundColor = .button
        buttonNext.layer.cornerRadius = 32
        buttonNext.setTitle("Далее", for: .normal)
        buttonNext.titleLabel?.textAlignment = .left
        buttonNext.setTitleColor(.white, for: .normal)
        buttonNext.titleLabel?.font = UIFont(name: "SFUIText-Medium", size: 18)
        
        return buttonNext
    }()
    
    let recoverPasswordButton: UIButton = {
        let recoverPasswordButton = UIButton(type: .system)
        recoverPasswordButton.setTitle("Восстановить пароль", for: .normal)
        recoverPasswordButton.setTitleColor(.colotTextButton, for: .normal)
        recoverPasswordButton.titleLabel?.font = UIFont(name: "SFUIText-Medium", size: 12)
        
        
        
        
        return recoverPasswordButton
    }()
    
    let registrationButton: UIButton = {
        let registrationButton = UIButton(type: .system)
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.setTitleColor(.colotTextButton, for: .normal)

        registrationButton.titleLabel?.font = UIFont(name: "SFUIText-Medium", size: 12)
        
        
        return registrationButton
    }()
    
    let line: UIView = {
        let line = UIView()
        line.backgroundColor = .colotTextButton
        line.layer.masksToBounds = true
        
        return line
    }()
    

    
    enum Event {
        case authComplete
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addConstraintWithSnp()
        setUPRootView()
        addActionToButton()
        

    }
    

    
    func addConstraintWithSnp() {
        self.view.addSubview(baseViewImagePetApp)
        self.baseViewImagePetApp.addSubview(rectangleOnBaseView)
        self.rectangleOnBaseView.addSubview(enterLabel)
        self.view.addSubview(textFieldFirst)
        self.view.addSubview(textFieldSecond)
        self.view.addSubview(buttonNext)
        self.view.addSubview(recoverPasswordButton)
        self.view.addSubview(registrationButton)
        self.baseViewImagePetApp.addSubview(baseSubViewImagePetApp)
        self.rectangleOnBaseView.addSubview(line)
        
        baseViewImagePetApp.snp.makeConstraints {
            $0.top.equalToSuperview().offset(35)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(562.74)
            
        }
        
        
        rectangleOnBaseView.snp.makeConstraints {
            $0.bottom.equalTo(self.view.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        enterLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(rectangleOnBaseView.snp.top).inset(45.5)
            $0.width.equalTo(55)
            $0.height.equalTo(29)
            
        }
        
        textFieldFirst.snp.makeConstraints {
            $0.horizontalEdges.equalTo(rectangleOnBaseView).inset(20)
            $0.height.equalTo(59)
            $0.top.equalTo(rectangleOnBaseView.snp.top).offset(104.5)
        }
        
        textFieldSecond.snp.makeConstraints {
            $0.horizontalEdges.equalTo(rectangleOnBaseView).inset(20)
            $0.height.equalTo(59)
            $0.top.equalTo(rectangleOnBaseView.snp.top).offset(179.5)
        }
        
        buttonNext.snp.makeConstraints {
            $0.top.equalTo(rectangleOnBaseView.snp.top).offset(269.5)
            $0.height.equalTo(60)
            $0.horizontalEdges.equalTo(rectangleOnBaseView).inset(15)
          
            
        }
        
        recoverPasswordButton.snp.makeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(130)
            $0.left.equalTo(46)
            $0.bottom.equalTo(rectangleOnBaseView.snp.bottom).offset(-25)
            $0.top.equalTo(rectangleOnBaseView.snp.top).offset(354.5)

        }
        
        registrationButton.snp.makeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(78)
            $0.left.equalTo(264)
            $0.bottom.equalTo(rectangleOnBaseView.snp.bottom).offset(-25)
            $0.top.equalTo(rectangleOnBaseView.snp.top).offset(354.5)


        }
        
        baseSubViewImagePetApp.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(120)
            $0.height.equalTo(234.28)
            $0.width.equalTo(173.88)
            $0.bottom.equalTo(rectangleOnBaseView.snp.top)
        }
        
        line.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(207)
            $0.top.equalTo(rectangleOnBaseView.snp.top).offset(354.5)
            $0.height.equalTo(18)
            $0.width.equalTo(1)
        }
        



        
        
    }
    
    func setUPRootView() {
        self.view.backgroundColor = .rectangle111
    }
    
    func addActionToButton() {
        recoverPasswordButton.addTarget(self, action: #selector(getRecoverPassword), for: .touchUpInside)
        registrationButton.addTarget(self, action: #selector(getRegistration), for: .touchUpInside)
        buttonNext.addTarget(self, action: #selector(getNextScreen), for: .touchUpInside)
    }
    
    
    @objc 
    func getRecoverPassword() {
        
        delegateTransitionScreen?.didTransitionScreen(.recover)
    }
    
    @objc 
    func getRegistration() {
        delegateTransitionScreen?.didTransitionScreen(.registration)
    }
    
    @objc
    func getNextScreen() {
        delegateTransitionScreen?.didTransitionScreen(.next)
    }
    
    
    
}

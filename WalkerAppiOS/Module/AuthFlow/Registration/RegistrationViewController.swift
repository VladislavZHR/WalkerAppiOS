import UIKit
import Lottie
import SnapKit

final class RegistrationViewController: UIViewController {
    
    let label = UILabel()
    
    func addDev() {
        label.text = "Раздел находится в разработке"
        label.numberOfLines = 0
        label.textAlignment = .center
    }
    

    let lottie = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        title = "Регистрация"
        addDev()
        addAnimateAndSnp()

    }
    
    func addAnimateAndSnp() {
        
        
        self.view.addSubview(lottie)
        self.view.addSubview(label)
        
        lottie.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(350)
            $0.width.equalTo(350)
        }
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(100)
            $0.width.equalTo(150)
        }
        
        let animation = Animation.named("workDevelopment")
        lottie.animation = animation
        lottie.contentMode = .scaleAspectFit
        lottie.loopMode = .loop
        
        self.lottie.play()
        
        
    }
}

private extension RegistrationViewController {
    
    

    
}

import UIKit
import SnapKit

final class RegistrationViewController: UIViewController {
    
    private let customNavigationBar = CustomNavigationBar(frame: .zero)
    
//    let label = UILabel()
    
//    func addDev() {
//        label.text = "Раздел находится в разработке"
//        label.numberOfLines = 0
//        label.textAlignment = .center
//    }
    

//    let lottie = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .colorBaseBackround
        configure()
//        addDev()
//        addAnimateAndSnp()

    }
    
//    func addAnimateAndSnp() {
//        
//        
//        self.view.addSubview(lottie)
//        self.view.addSubview(label)
//        
//        lottie.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.centerY.equalToSuperview()
//            $0.height.equalTo(350)
//            $0.width.equalTo(350)
//        }
//        
//        label.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(150)
//            $0.centerX.equalToSuperview()
//            $0.height.equalTo(100)
//            $0.width.equalTo(150)
//        }
//        
//        let animation = Animation.named("workDevelopment")
//        lottie.animation = animation
//        lottie.contentMode = .scaleAspectFit
//        lottie.loopMode = .loop
//        
//        self.lottie.play()
//        
//        
//    }
}

private extension RegistrationViewController {
    
    func configure() {
        self.view.addSubview(customNavigationBar)
        self.navigationController?.navigationBar.isHidden = true
        addconstraintsSubView()
        
        self.customNavigationBar.customButton.addTarget(self, action: #selector(returnToBaseVC), for: .touchUpInside)
    }
    
    func addconstraintsSubView() {
        
        customNavigationBar.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(233)
        }
        
    }
    
    @objc
    func returnToBaseVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    

    
}

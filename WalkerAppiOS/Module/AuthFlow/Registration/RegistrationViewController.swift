import UIKit
import SnapKit

final class RegistrationViewController: UIViewController {
    
    private let customNavigationBar = CustomNavigationBar(frame: .zero)
    
    private lazy var registrationCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayoutCollectionView())
    
    
    
//    private let collectionViewCellArray: [RegistrationCollectionViewCell] = [
//        RegistrationCollectionViewCell(frame: .zero, placeholder: "Имя"),
//        RegistrationCollectionViewCell(frame: .zero, placeholder: "E-mail"),
//        RegistrationCollectionViewCell(frame: .zero, placeholder: "Местоположение"),
//        RegistrationCollectionViewCell(frame: .zero, placeholder: "Телефон"),
//        RegistrationCollectionViewCell(frame: .zero, placeholder: "О себе"),
//        RegistrationCollectionViewCell(frame: .zero, placeholder: "Введите пароль"),
//        RegistrationCollectionViewCell(frame: .zero, placeholder: "Повторите пароль")
//    ]
    
//    private let cellArray = [
//    
//        RegistrationCollectionViewCell(frame: .zero),
//        RegistrationCollectionViewCell(frame: .zero),
//        RegistrationCollectionViewCell(frame: .zero)
//        
//    ]
    
//    private lazy var collectionView: UICollectionView = {
//        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setupFlowLayout())
//        
//        return collectionView
//    }()
    
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
//        self.view.addSubview(collectionView)
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubview(registrationCollectionView)
        addconstraintsSubView()
        
        self.customNavigationBar.customButton.addTarget(self, action: #selector(returnToBaseVC), for: .touchUpInside)
        self.registrationCollectionView.dataSource = self
        self.registrationCollectionView.register(RegistrationCollectionViewCell.self, forCellWithReuseIdentifier: "RegistrationViewCell")
        
       

        
    }
    
    func addconstraintsSubView() {
        
        customNavigationBar.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(233)
        }
        
        registrationCollectionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(self.customNavigationBar.snp.bottom)
            $0.width.equalToSuperview() 
            $0.height.equalToSuperview()
        }
        
//        collectionView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
    }
    
    @objc
    func returnToBaseVC() {
        self.navigationController?.popViewController(animated: true)
    }
    

    
//    func setupFlowLayout() -> UICollectionViewFlowLayout {
//        
//    }
}

extension RegistrationViewController: UICollectionViewDataSource {
    
    
    
    func flowLayoutCollectionView() -> UICollectionViewFlowLayout {
        let collectionView = UICollectionViewFlowLayout()
        collectionView.scrollDirection = .horizontal
//        print("RegFlow")
        
        return collectionView
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        print("RegCount")

//        return self.cellArray.count
        
        return 7

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        guard let cell = registrationCollectionView.dequeueReusableCell(withReuseIdentifier: "RegistrationViewCell", for: indexPath) as? RegistrationCollectionViewCell else {
//            return RegistrationCollectionViewCell()
//        }
        
        let cell = registrationCollectionView.dequeueReusableCell(withReuseIdentifier: "RegistrationViewCell", for: indexPath) as? RegistrationCollectionViewCell
        
//        cell?.imageView.image = UIImage(named: "eye")
        
//        let placeholder = collectionViewCellArray[indexPath.item]
//        cell?.setupCustomTextField(placeholder: collectionViewCellArray[indexPath.item].customTextField?.placeholder.text ?? "")


        print("RegLast")

        
        return cell!
    }
    
    
}

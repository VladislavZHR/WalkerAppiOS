import UIKit

protocol IModuleContainer {
    func getAuthView() -> UIViewController
    func getMainView() -> UIViewController
}

final class ModuleContainer: IModuleContainer {
    
    private let dependencies: IDependencies
    
    required init(_ dependencies: IDependencies) {
        self.dependencies = dependencies
    }
}


extension ModuleContainer {
    
    func getAuthView() -> UIViewController {
        return AuthViewController()
    }

}

extension ModuleContainer {
    
    func getMainView() -> UIViewController {
        return MainViewController()
    }
    
}

import UIKit

protocol IModuleContainer {
    func getAuthView() -> UIViewController
    func getMainView() -> UIViewController
    func getRecoverView() -> UIViewController
    func getRegistrationView() -> UIViewController
    func getNextScreenFromAuth() -> UIViewController
}

final class ModuleContainer: IModuleContainer {
    
    private let dependencies: IDependencies
    
    required init(_ dependencies: IDependencies) {
        self.dependencies = dependencies
    }
}


extension ModuleContainer {
    
    func getAuthView() -> UIViewController {
        return AuthorizationViewController()
    }

}

extension ModuleContainer {
    
    func getMainView() -> UIViewController {
        return MainViewController()
    }
    
}

extension ModuleContainer {
    
    func getRecoverView() -> UIViewController {
        return RecoverPasswordViewController()
    }
    
}

extension ModuleContainer {
    func getRegistrationView() -> UIViewController {
        return RegistrationViewController()
    }

}

extension ModuleContainer {
    func getNextScreenFromAuth() -> UIViewController {
        return NextScreenFromAuthViewController()
    }
}

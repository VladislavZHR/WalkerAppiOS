import UIKit

protocol AuthCoordinatorProtocol: Coordinator {
    
    func start()
}

protocol TransitionScreen: AnyObject {
    func didTransitionScreen(_ type: TypeScreen)
}




//сделать протокол который будет держать метод для отправки перееходов через типы экранов

final class AuthCoordinator: AuthCoordinatorProtocol {
    
    var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .auth }
    var typeScreen: CoordinatorTypeScreen?
    var dependencies: IDependencies
    
    
    required init(_ navigationController: UINavigationController, _ dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showAuthViewController()
    }

    
   private func showAuthViewController() {
       
       guard let authViewController = AuthAssembly.configure(dependencies) as? AuthorizationViewController else {return}
       
       authViewController.delegateTransitionScreen = self
       navigationController.pushViewController(authViewController, animated: true)
       
       
    }
}

extension AuthCoordinator: TransitionScreen {
    func didTransitionScreen(_ type: TypeScreen) {
        
        switch type {
        case .recover:
            let recoverPasswordViewController = RecoverPasswordAssembly.configure(dependencies)
            navigationController.pushViewController(recoverPasswordViewController, animated: true)
        case .registration:
            let registrationViewController = RegistrationAssembly.configure(dependencies)
            navigationController.pushViewController(registrationViewController, animated: true)
        case .next:
            let nextScreenFromAuth = NextScreenFromAuthAssembly.configure(dependencies)
            navigationController.pushViewController(nextScreenFromAuth, animated: true)
        }
        
    }

}


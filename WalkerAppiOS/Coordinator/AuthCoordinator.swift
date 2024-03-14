import UIKit

protocol AuthCoordinatorProtocol: Coordinator {
    
    func start()
}

final class AuthCoordinator: AuthCoordinatorProtocol {
    
    var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .auth }
    var dependencies: IDependencies
    
    
    required init(_ navigationController: UINavigationController, _ dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showAuthViewController()
    }

    
   private func showAuthViewController() {
       
       let authViewController = AuthAssembly.configure(dependencies)
       
        navigationController.pushViewController(authViewController, animated: true)
    }
    
    

    
}

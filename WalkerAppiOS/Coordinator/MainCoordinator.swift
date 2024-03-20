import UIKit

protocol MainCoordinatorProtocol: Coordinator {
    
    func start()
}

final class MainCoordinator: MainCoordinatorProtocol {
    
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var dependencies: IDependencies
    
    var type: CoordinatorType { .main }
    
    required init(_ navigationController: UINavigationController, _ dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        
        showMainViewController()
    }
    
    private func showMainViewController() {
        let mainViewController = dependencies.moduleContainer.getMainView()
        navigationController.pushViewController(mainViewController, animated: true)
    }
    

    
}

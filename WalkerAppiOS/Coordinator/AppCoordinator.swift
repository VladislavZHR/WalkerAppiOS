import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func start()
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType { .app }
    var dependencies: IDependencies
    private let userDefaultsRepository: IUserDefaultsRepository
    
    
    required init(_ navigationController: UINavigationController, _ dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        self.userDefaultsRepository = dependencies.userDefaultsRepository
    }
    
    func start() {
        showLaunchFlow()
    }
    
    private func showLaunchFlow() {
        
        
            if !userDefaultsRepository.isAppLaunchedBefore {
                userDefaultsRepository.setAppLaunched()
                showAuthFlow()
            } else {
                showAuthFlow()

//                showMainFlow()
            }
        
        
    }
    
    private func showAuthFlow() {
        let authCoordinator = AuthCoordinator(navigationController, dependencies)
        authCoordinator.finishDelegate = self
        authCoordinator.start()
        childCoordinators.append(authCoordinator)
    }
    
    private func showMainFlow() {
        let mainCoordinator = MainCoordinator(navigationController, dependencies)
        mainCoordinator.finishDelegate = self
        mainCoordinator.start()
        childCoordinators.append(mainCoordinator)
    }
    

    

}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(_ childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        switch childCoordinator.type {
        case .auth:
            showAuthFlow()
        case .main:
            showMainFlow()
        default: break
            
        }
    }
}

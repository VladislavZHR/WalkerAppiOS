import UIKit

enum CoordinatorType {
    case app, auth, main
}

protocol Coordinator: AnyObject {
    
    var finishDelegate: CoordinatorFinishDelegate? { get }
    var navigationController: UINavigationController {get set}
    var childCoordinators: [Coordinator] { get set }
    var dependencies: IDependencies { get }
    var type: CoordinatorType { get }
    func start()
    func finish()
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(_ childCoordinator: Coordinator)
}

extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(self)
    }
}

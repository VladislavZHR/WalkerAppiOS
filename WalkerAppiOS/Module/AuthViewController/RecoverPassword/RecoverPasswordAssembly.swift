import UIKit

final class RecoverPasswordAssembly {
    
    static func configure(_ dependencies: IDependencies) -> UIViewController {
        dependencies.moduleContainer.getRecoverView()
    }
    
}

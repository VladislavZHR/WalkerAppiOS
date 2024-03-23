import UIKit

final class AuthAssembly {
    
    static func configure(_ dependencies: IDependencies) -> UIViewController {
        dependencies.moduleContainer.getAuthView()
    }
    
}

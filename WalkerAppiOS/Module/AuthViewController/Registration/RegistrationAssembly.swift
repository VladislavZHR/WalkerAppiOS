import UIKit

final class RegistrationAssembly {
    static func configure(_ dependencies: IDependencies) -> UIViewController {
        dependencies.moduleContainer.getRegistrationView()
    }
}




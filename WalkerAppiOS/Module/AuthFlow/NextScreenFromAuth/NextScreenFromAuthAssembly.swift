import UIKit

final class NextScreenFromAuthAssembly {
    static func configure(_ dependencies: IDependencies) -> UIViewController {
        dependencies.moduleContainer.getNextScreenFromAuth()
    }
}

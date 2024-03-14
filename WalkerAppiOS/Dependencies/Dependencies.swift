import UIKit

protocol IDependencies {
    
    var moduleContainer: IModuleContainer { get }
    var userDefaultsRepository: IUserDefaultsRepository { get }

    
}

final class Dependencies: IDependencies {
    
    lazy var moduleContainer: IModuleContainer = ModuleContainer(self)
    lazy var userDefaultsRepository: IUserDefaultsRepository = UserDefaultsRepository(container: UserDefaults.standard)

}

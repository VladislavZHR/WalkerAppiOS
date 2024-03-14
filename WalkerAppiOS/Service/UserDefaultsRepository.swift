import Foundation

protocol IUserDefaultsRepository {
    
    var isOnboardingCompleteBefore: Bool { get }
    func setOnboardingComplete()
    var isAppLaunchedBefore: Bool { get }
    func setAppLaunched()

  
}

struct UserDefaultsRepository: IUserDefaultsRepository {
    private let container: UserDefaults
    
    var isAppLaunchedBefore: Bool {
        return container.bool(forKey: UserDefaultsKey.appLaunched)
    }
    
    init(container: UserDefaults) {
        self.container = container
    }
    
    var isOnboardingCompleteBefore: Bool {
        return container.bool(forKey: UserDefaultsKey.onboardingComplete)
    }
    
    func setOnboardingComplete() {
        container.setValue(true, forKey: UserDefaultsKey.onboardingComplete)
    }
    
    func setAppLaunched() {
        container.setValue(true, forKey: UserDefaultsKey.appLaunched)
    }
    
    
}

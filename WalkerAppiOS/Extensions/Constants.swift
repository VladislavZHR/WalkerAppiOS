import UIKit

enum UserDefaultsKey {
    
    static let onboardingComplete = "OnboardingComplete"
    static let appLaunched = ""
}

enum TypeScreen {
    
    case recover, registration, next
}

enum Regex {
    static let regexLogin = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
}

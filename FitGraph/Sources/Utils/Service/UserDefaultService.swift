import SwiftUI
import Combine

class UserDefaultService: ObservableObject {
    static let shared = UserDefaultService()
    private let defaults = UserDefaults.standard
    
    @Published var appearance: String = "Light"
    
    init() {
        if let storedAppearance = defaults.string(forKey: "appearance") {
            self.appearance = storedAppearance
        } else {
            defaults.set("Light", forKey: "appearance")
        }
    }
    
    func getAppearance() -> String {
        return defaults.string(forKey: "appearance") ?? "Light"
    }
    
    func setAppearance() {
        withAnimation {        
            let newAppearance = appearance == "Light" ? "Dark" : "Light"
            defaults.set(newAppearance, forKey: "appearance")
            appearance = newAppearance
        }
    }
}

import SwiftUI

@main
struct FitGraphApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(UserDefaultService.shared)
        }
    }
}

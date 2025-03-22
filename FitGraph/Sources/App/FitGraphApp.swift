import SwiftUI
import ComposableArchitecture

@main
struct FitGraphApp: App {
    
    var body: some Scene {

        WindowGroup {
            MainTabView(store: Store(initialState: MainTabFeature.TabState(), reducer: {
                MainTabFeature(HKService: HealthKitService())
            }))
        }
    }
}

import SwiftUI
import ComposableArchitecture

struct MainTabView: View {
    let store: StoreOf<MainTabFeature>
    
    var body: some View {
        TabView {
            Tab("", systemImage: "house.fill") {
                ActivityView(store: Store(initialState: ActivityFeature.ActivityState(), reducer: {
                    ActivityFeature(hkService: HealthKitService())
                }))
            }

            Tab("", systemImage: "person.fill") {
                MyPageView()
            }
        }
        .onAppear {
            store.send(.requestAuth)
        }
        .tint(Color.mainColor)
    }
}

#Preview {
    MainTabView(store: Store(initialState: MainTabFeature.TabState(), reducer: {
        MainTabFeature(HKService: HealthKitService())
    }))
}

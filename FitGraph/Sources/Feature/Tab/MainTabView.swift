import SwiftUI
import ComposableArchitecture

struct MainTabView: View {
    
    var body: some View {
        TabView {
            Tab("", systemImage: "house.fill") {
                ActivityView(store: Store(initialState: ActivityFeature.ActivityState(selectedIndex: 0, dates: []), reducer: {
                    ActivityFeature()
                }))
            }

            Tab("", systemImage: "person.fill") {
                MyPageView()
            }
        }
        .tint(Color.mainColor)
    }
}

#Preview {
    MainTabView()
}

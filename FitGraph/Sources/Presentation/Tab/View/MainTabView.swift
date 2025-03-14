import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            Tab("", systemImage: "house.fill") {
                HomeView()
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

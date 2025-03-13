import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var userService: UserDefaultService
    
    var body: some View {
        TabView {
            Tab("", systemImage: "house.fill") {
                BackgroundView {                
                    HomeView()
                }
            }

            Tab("", systemImage: "person.fill") {
                BackgroundView {                
                    MyPageView()
                }
            }
        }
        .tint(Color.mainColor)
    }
}

#Preview {
    MainTabView()
        .environmentObject(UserDefaultService.shared)
}

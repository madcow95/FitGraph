import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userService: UserDefaultService
    
    var body: some View {
        VStack {
            Text("Home View")
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(UserDefaultService.shared)
}

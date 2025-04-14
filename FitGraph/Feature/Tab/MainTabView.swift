import SwiftUI

struct MainTabView: View {
    private let viewModel: MainTabViewModel
    
    init(viewModel: MainTabViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        TabView {
            Tab("", systemImage: "house.fill") {
                ActivityView()
            }

            Tab("", systemImage: "person.fill") {
                MyPageView()
            }
        }
        .onAppear {
            viewModel.requestHKAuth()
        }
        .tint(Color.mainColor)
    }
}

#Preview {
    MainTabView(viewModel: MainTabViewModel())
}

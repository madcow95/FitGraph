import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Home View")
                }
            }
            .onAppear {
                let hkService = HealthKitService()
                hkService.requestHKAuth() { result in
                    if result {
                        hkService.startObserve()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

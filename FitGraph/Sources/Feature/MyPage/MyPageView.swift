import SwiftUI

struct MyPageView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SettingView()
                    } label: {
                        Image(systemName: "gearshape")
                            .tint(.mainColor)
                    }
                }
            }
        }
    }
}

#Preview {
    MyPageView()
}

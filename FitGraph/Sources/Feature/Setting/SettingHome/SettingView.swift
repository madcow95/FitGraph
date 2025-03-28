import SwiftUI
import ComposableArchitecture

struct SettingView: View {
    @Bindable var store: StoreOf<SettingFeature>
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                ZStack {
                    Color.lightBackgroundColor
                        .ignoresSafeArea()
                    SettingContentView(store: store, width: geo.size.width - 40)
                }
                .navigationTitle("사용자 설정")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct SettingContentView: View {
    @Bindable var store: StoreOf<SettingFeature>
    let width: CGFloat
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                BasicInfoContainer(width: width)
                
                AlarmContainer(width: width)
                
                AitivityContainer(width: width)
            }
        }
    }
}

#Preview {
    SettingView(store: Store(initialState: SettingFeature.SettingState(), reducer: {
        SettingFeature()
    }))
}

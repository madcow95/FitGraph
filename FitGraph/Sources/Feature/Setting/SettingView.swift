import SwiftUI
import ComposableArchitecture

struct SettingView: View {
    @Bindable var store: StoreOf<SettingFeature>
    
    var body: some View {
        VStack {
            
        }
    }
}

#Preview {
    SettingView(store: Store(initialState: SettingFeature.SettingState(), reducer: {
        SettingFeature()
    }))
}

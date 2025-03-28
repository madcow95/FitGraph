import SwiftUI
import ComposableArchitecture

struct MyPageView: View {
    @Bindable var store: StoreOf<MyPageFeature>

    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            VStack {
                // 메인 내용
            }
            .navigationTitle("My Page")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(state: SettingFeature.SettingState()) {
                        Image(systemName: "gearshape")
                            .tint(.mainColor)
                    }
                }
            }
        } destination: { store in
            SettingView(store: store)
        }
    }
}

#Preview {
    MyPageView(store: Store(initialState: MyPageFeature.MyPageState(), reducer: {
        MyPageFeature()
    }))
}

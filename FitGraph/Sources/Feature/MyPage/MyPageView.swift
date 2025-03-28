import SwiftUI
import ComposableArchitecture

struct MyPageView: View {
    @Bindable var store: StoreOf<MyPageFeature>
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.lightBackgroundColor
                    .ignoresSafeArea()
                MyPageContentView(store: store)
            }
        }
    }
}

struct MyPageContentView: View {
    @Bindable var store: StoreOf<MyPageFeature>

    var body: some View {
        NavigationStack(path: $store.scope(state: \.settingPath, action: \.settingPathAction)) {
            ScrollView {
                VStack {
                    
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

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
                    ScrollView {
                        VStack(spacing: 20) {
                            BasicInfoContainer(width: geo.size.width - 40)
                            
                            AlarmContainer(width: geo.size.width - 40)
                            
                            AitivityContainer(width: geo.size.width - 40)
                        }
                    }
                }
                .navigationTitle("사용자 설정")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: SettingNavigationState.self) { state in
                    switch state {
                    case let .basicInfo(basicInfoState):
                        BasicInfoView(store: Store(initialState: basicInfoState, reducer: {
                            BasicInfoFeature()
                        }))
                    case let .alarmSetting(alarmState):
                        AlarmSettingView(store: Store(initialState: alarmState, reducer: {
                            AlarmSettingFeature()
                        }))
                    }
                }
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

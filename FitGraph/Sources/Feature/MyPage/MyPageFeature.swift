import SwiftUI
import ComposableArchitecture

@Reducer
struct MyPageFeature {
    @ObservableState
    struct MyPageState {
        var settingPath = StackState<SettingFeature.SettingState>()
    }

    @CasePathable
    enum MyPageAction {
        case settingButtonTapped
        case settingPathAction(StackActionOf<SettingFeature>)
    }

    var body: some Reducer<MyPageState, MyPageAction> {
        
        Reduce { state, action in
            switch action {
            case .settingButtonTapped:
                
                return .none
            case .settingPathAction:
                return .none
            }
        }
        .forEach(\.settingPath, action: \.settingPathAction) {
            SettingFeature()
        }
    }
}

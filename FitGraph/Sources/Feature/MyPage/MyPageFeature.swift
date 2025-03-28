import SwiftUI
import ComposableArchitecture

@Reducer
struct MyPageFeature {
    @ObservableState
    struct MyPageState {
        var path = StackState<SettingFeature.SettingState>()
    }

    @CasePathable
    enum MyPageAction {
        case settingButtonTapped
        case path(StackActionOf<SettingFeature>)
    }

    var body: some Reducer<MyPageState, MyPageAction> {
        
        Reduce { state, action in
            switch action {
            case .settingButtonTapped:
                
                return .none
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            SettingFeature()
        }
    }
}

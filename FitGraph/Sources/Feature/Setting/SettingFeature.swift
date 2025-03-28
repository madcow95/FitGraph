import SwiftUI
import ComposableArchitecture

@Reducer
struct SettingFeature {
    @ObservableState
    struct SettingState: Equatable {
        
    }
    
    enum SettingAction {
        case moveToSetting
    }
    
    var body: some Reducer<SettingState, SettingAction> {
        Reduce { state, action in
            switch action {
            case .moveToSetting:
                return .none
            }
        }
    }
}

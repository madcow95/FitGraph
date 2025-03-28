import SwiftUI
import ComposableArchitecture

@Reducer
struct SettingFeature {
    @ObservableState
    struct SettingState {
        var basicInfoPath = StackState<BasicInfoFeature.State>()
        var alarmSettingPath = StackState<AlarmSettingFeature.State>()
    }
    
    @CasePathable
    enum SettingAction {
        case moveToSetting
        case moveToBasicInfoAction(StackActionOf<BasicInfoFeature>)
        case moveToAlarmSettingAction(StackActionOf<AlarmSettingFeature>)
    }
    
    var body: some Reducer<SettingState, SettingAction> {
        Reduce { state, action in
            switch action {
            case .moveToSetting:
                return .none
            case .moveToBasicInfoAction:
                return .none
            case .moveToAlarmSettingAction:
                return .none
            }
        }
        .forEach(\.basicInfoPath, action: \.moveToBasicInfoAction) {
            BasicInfoFeature()
        }
        .forEach(\.alarmSettingPath, action: \.moveToAlarmSettingAction) {
            AlarmSettingFeature()
        }
    }
}

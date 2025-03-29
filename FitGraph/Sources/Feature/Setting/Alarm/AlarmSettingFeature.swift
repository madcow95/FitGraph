//
//  AlarmSettingFeature.swift
//  FitGraph
//
//  Created by 최광우 on 3/28/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AlarmSettingFeature {
    @ObservableState
    struct State: Hashable {
        
    }
    
    enum Action {
        case temp
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .temp:
                return .none
            }
        }
    }
}

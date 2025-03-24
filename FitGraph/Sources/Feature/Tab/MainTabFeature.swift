//
//  AppReducer.swift
//  FitGraph
//
//  Created by 최광우 on 3/23/25.
//

import ComposableArchitecture

@Reducer
struct MainTabFeature {
    let HKService: HealthKitService
    @ObservableState
    struct TabState {
        
    }
    
    enum TabAction {
        case requestAuth
    }
    
    var body: some Reducer<TabState, TabAction> {
        Reduce { state, action in
            switch action {
            case .requestAuth:
                Task {
                    await HKService.requestAuth()
                }
                return .none
            }
        }
    }
}

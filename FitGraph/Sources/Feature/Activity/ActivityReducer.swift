//
//  ActivityReducer.swift
//  FitGraph
//
//  Created by 최광우 on 3/23/25.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct ActivityFeature {
    @ObservableState
    struct ActivityState: Equatable {
        var selectedIndex: Int
        var dates: [Date]
    }
    
    enum ActivityAction {
        case onAppear
        case dateSelected(Int)
    }
    
    var body: some Reducer<ActivityState, ActivityAction> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.dates = Date().getWeekDay(from: Date())
                return .none
            case .dateSelected(let index):
                state.selectedIndex = index
                return .none
            }
        }
    }
}

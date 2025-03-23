//
//  ActivityReducer.swift
//  FitGraph
//
//  Created by 최광우 on 3/23/25.
//

import ComposableArchitecture
import HealthKit
import SwiftUI

@Reducer
struct ActivityFeature {
    let hkService: HealthKitService
    
    @ObservableState
    struct ActivityState: Equatable {
        var selectedIndex: Int
        var dates: [Date]
        var stepCount: Int
    }
    
    enum ActivityAction {
        case onAppear
        case dateSelected(Int)
        case fetchStepCount(Int)
        case fetchSleep([HKCategorySample])
    }
    
    var body: some Reducer<ActivityState, ActivityAction> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.dates = Date().getWeekDay(from: Date())
                return .merge([
                    .run { send in
                        await send(.fetchStepCount(Int(await hkService.fetchStepCount(date: Date()))))
                    },
                    .run { send in
                        await send(.fetchSleep(await hkService.fetchSleep(date: Date())))
                    }
                ])
            case .dateSelected(let index):
                state.selectedIndex = index
                let selectedDate = state.dates[state.selectedIndex]
                return .merge([
                    .run { send in
                        await send(.fetchStepCount(Int(await hkService.fetchStepCount(date: selectedDate))))
                    },
                    .run { send in
                        await send(.fetchSleep(await hkService.fetchSleep(date: selectedDate)))
                    }
                ])
            case .fetchStepCount(let step):
                state.stepCount = step
                
                return .none
            case .fetchSleep(let sleepData):
                
                return .none
            }
        }
    }
}

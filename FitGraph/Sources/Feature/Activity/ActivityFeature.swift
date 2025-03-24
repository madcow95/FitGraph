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
        var selectedIndex: Int = 0
        var dates: [Date] = []
        var stepCount: Int = 0
        var calories: Int = 0
        var workoutTime: Int = 0
        var standTime: Int = 0
    }
    
    enum ActivityAction {
        case onAppear
        case dateSelected(Int)
        case fetchStepCount(Int)
        case fetchSleep([HKCategorySample])
        case fetchEnergyConsumption((Int, Int, Int))
        case fetchWorkoutTime(Int)
        case fetchStandTime(Int)
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
                    },
                    .run { send in
                        await send(.fetchEnergyConsumption(await hkService.fetchCalorieConsumption(date: Date())))
                    },
                    .run { send in
                        await send(.fetchWorkoutTime(await hkService.fetchWorkoutTime(date: Date())))
                    },
                    .run { send in
                        await send(.fetchStandTime(await hkService.fetchStandTime(date: Date())))
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
                    },
                    .run { send in
                        await send(.fetchEnergyConsumption(await hkService.fetchCalorieConsumption(date: selectedDate)))
                    },
                    .run { send in
                        await send(.fetchWorkoutTime(await hkService.fetchWorkoutTime(date: selectedDate)))
                    },
                    .run { send in
                        await send(.fetchStandTime(await hkService.fetchStandTime(date: selectedDate)))
                    }
                ])
            case .fetchStepCount(let step):
                state.stepCount = step
                
                return .none
            case .fetchSleep/*(let _)*/:
                
                return .none
            case .fetchEnergyConsumption(let workouts):
                state.calories = workouts.0
                
                return .none
            case .fetchWorkoutTime(let time):
                state.workoutTime = time
                
                return .none
            case .fetchStandTime(let time):
                state.standTime = time
                
                return .none
            }
        }
    }
}

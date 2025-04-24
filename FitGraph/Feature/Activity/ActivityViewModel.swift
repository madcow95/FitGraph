//
//  ActivityViewModel.swift
//  FitGraph
//
//  Created by 최광우 on 4/14/25.
//

import SwiftUI
import Combine

@MainActor
final class ActivityViewModel: ObservableObject {
    private let hkService = HealthKitService()
    @Published var dates: [Date] = []
    @Published var selectedIndex: Int = 0
    @Published var calories: Int = 0
    @Published var workoutTime: Int = 0
    @Published var standTime: Int = 0
    @Published var stepCount: Int = 0
    
    init() {
        self.dates = Date().getWeekDay(from: Date())
    }
    
    func updateSelectedIndex(index: Int) {
        self.selectedIndex = index
    }
    
    func fetchData(selectedDate: Date) {
        Task {
            async let stepCount = hkService.fetchStepCount(date: selectedDate)
            async let energy = hkService.fetchCalorieConsumption(date: selectedDate)
            
            self.stepCount = Int(await stepCount)
            let (calories, workout, standTime) = await energy
            self.calories = calories
            self.workoutTime = workout
            self.standTime = standTime
//            await fetchStepCount(date: selectedDate)
//            await fetchEnergyConsumption(date: selectedDate)
        }
    }
    
    private func fetchStepCount(date: Date) async {
        self.stepCount = Int(await hkService.fetchStepCount(date: date))
    }
    
    private func fetchEnergyConsumption(date: Date) async {
        let (calories, workout, standTime) = await hkService.fetchCalorieConsumption(date: date)
        self.calories = calories
        self.workoutTime = workout
        self.standTime = standTime
    }
}
/*
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
 */

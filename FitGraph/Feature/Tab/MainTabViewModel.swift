//
//  AppReducer.swift
//  FitGraph
//
//  Created by 최광우 on 3/23/25.
//

import SwiftUI

struct MainTabViewModel {
    let HKService = HealthKitService()
    
    func requestHKAuth() {
        Task {
            await HKService.requestAuth()
        }
    }
}

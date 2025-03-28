//
//  BasicInfoFeature.swift
//  FitGraph
//
//  Created by 최광우 on 3/28/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct BasicInfoFeature {
    @ObservableState
    struct State {
        
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

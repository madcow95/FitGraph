//
//  AlarmSettingView.swift
//  FitGraph
//
//  Created by 최광우 on 3/28/25.
//

import SwiftUI
import ComposableArchitecture

struct AlarmSettingView: View {
    
    let store: StoreOf<AlarmSettingFeature>
    
    var body: some View {
        Text("AlarmSettingView")
    }
}

#Preview {
    AlarmSettingView(store: Store(initialState: AlarmSettingFeature.State(), reducer: {
        AlarmSettingFeature()
    }))
}

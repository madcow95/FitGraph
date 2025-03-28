//
//  BasicInfoView.swift
//  FitGraph
//
//  Created by 최광우 on 3/28/25.
//

import SwiftUI
import ComposableArchitecture

struct BasicInfoView: View {
    let store: StoreOf<BasicInfoFeature>
    
    var body: some View {
        Text("BasicInfoView")
    }
}

#Preview {
    BasicInfoView(store: Store(initialState: BasicInfoFeature.State(), reducer: {
        BasicInfoFeature()
    }))
}

//
//  SettingComponents.swift
//  FitGraph
//
//  Created by 최광우 on 3/28/25.
//

import SwiftUI
import ComposableArchitecture

enum SettingNavigationState: Hashable {
    case basicInfo(BasicInfoFeature.State)
    case alarmSetting(AlarmSettingFeature.State)
}

struct DestinationItem {
    let title: String
    let destinationState: SettingNavigationState
}

struct SettingContainer: View {
    let title: String
    let content: [DestinationItem]
    let navigationIcon: Image
    let width: CGFloat
    
    init(title: String, content: [DestinationItem], navigationIcon: Image, width: CGFloat) {
        self.title = title
        self.content = content
        self.navigationIcon = navigationIcon
        self.width = width
    }
    
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Text(title)
                    .font(.title)
                    .bold()
                
                Spacer()
            }
            
            ForEach(content.indices, id: \.self) { idx in
                let ct = content[idx]
                
                NavigationLink(state: ct.destinationState) {
                    HStack {
                        Text(ct.title)
                            .foregroundStyle(Color.black)
                        
                        Spacer()
                        
                        navigationIcon
                            .tint(Color(UIColor.lightGray))
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .frame(width: width)
    }
}

struct BasicInfoContainer: View {
    let width: CGFloat
    
    var body: some View {
        SettingContainer(title: "기본 정보",
                         content: [DestinationItem(title: "이름", destinationState: .basicInfo(BasicInfoFeature.State()))],
                         navigationIcon: Image(systemName: "chevron.right"),
                         width: width)
    }
}

struct AlarmContainer: View {
    let width: CGFloat
    
    var body: some View {
        SettingContainer(title: "알림",
                         content: [DestinationItem(title: "알림", destinationState: .alarmSetting(AlarmSettingFeature.State()))],
                         navigationIcon: Image(systemName: "chevron.right"),
                         width: width)
    }
}

struct AitivityContainer: View {
    let width: CGFloat
    
    var body: some View {
        SettingContainer(title: "활동",
                         content: [/*"수면", "운동", "걸음", "수분 섭취"*/],
                         navigationIcon: Image(systemName: "chevron.right"),
                         width: width)
    }
}

//
//  ActivityView.swift
//  FitGraph
//
//  Created by 최광우 on 4/14/25.
//

import SwiftUI

struct ActivityView: View {
    @StateObject private var viewModel = ActivityViewModel()
    
    var body: some View {
        GeometryReader { geo in
            let containerWidth = geo.size.width - 40
            let containerHeight = geo.size.height / 5
            
            ActivityContentView(
                containerWidth: containerWidth,
                containerHeight: containerHeight,
                viewModel: viewModel
            )
            .onAppear {
                viewModel.fetchData(selectedDate: Date())
                viewModel.updateSelectedIndex(index: Date().weekdayOffset())
            }
        }
    }
}

struct ActivityContentView: View {
    private let containerWidth: CGFloat
    private let containerHeight: CGFloat
    @ObservedObject private var viewModel: ActivityViewModel
    
    init(containerWidth: CGFloat, containerHeight: CGFloat, viewModel: ActivityViewModel) {
        self.containerWidth = containerWidth
        self.containerHeight = containerHeight
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.lightBackgroundColor
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: -20) {
                    HStack {
                        Text("오늘의 활동")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }
                    .padding()
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        let weeks = viewModel.dates
                        HStack(spacing: -30) {
                            ForEach(weeks.indices, id: \.self) { i in
                                let date = weeks[i]
                                VStack(alignment: .center) {
                                    Text(date.dayStr)
                                        .bold()
                                    Text(date.dayOfWeek)
                                        .bold()
                                }
                                .padding()
                                .overlay {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(i == viewModel.selectedIndex ? Color.green.opacity(0.5) : Color.clear)
                                    }
                                }
                                .foregroundStyle(Int(Date().dayStr)! >= Int(date.dayStr)! ? Color(UIColor.label) : Color(UIColor.lightGray))
                                .onTapGesture {
                                    if Int(Date().dayStr)! < Int(date.dayStr)! {
                                        return
                                    }
                                    viewModel.fetchData(selectedDate: date)
                                    withAnimation {
                                        viewModel.updateSelectedIndex(index: i)
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        SleepContainer(width: containerWidth,
                                       height: containerHeight)
                        WorkoutContainer(width: containerWidth,
                                         height: containerHeight,
                                         caloriesConsumption: viewModel.calories,
                                         workoutTime: viewModel.workoutTime,
                                         standTime: viewModel.standTime)
                        
                        FeelingContainer(width: containerWidth,
                                         height: containerHeight)
                        
                        HStack {
                            WalkingContainer(width: containerWidth,
                                             height: containerHeight,
                                             walkCount: viewModel.stepCount)
                            WaterContainer(width: containerWidth,
                                           height: containerHeight)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ActivityView()
}

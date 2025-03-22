import SwiftUI
import ComposableArchitecture

struct ActivityView: View {
    let store: StoreOf<ActivityFeature>
    
    var body: some View {
        GeometryReader { geo in
            let containerWidth = geo.size.width - 40
            let containerHeight = geo.size.height / 5
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
                            let weeks = store.dates
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
                                                .fill(i == store.selectedIndex ? Color.green.opacity(0.5) : Color.clear)
                                        }
                                    }
                                    .foregroundStyle(Int(Date().dayStr)! >= Int(date.dayStr)! ? Color(UIColor.label) : Color(UIColor.lightGray))
                                    .onTapGesture {
                                        self.store.send(.dateSelected(i), animation: .interactiveSpring)
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            SleepContainer(width: containerWidth, height: containerHeight)
                            WorkoutContainer(width: containerWidth, height: containerHeight)
                            
                            FeelingContainer(width: containerWidth, height: containerHeight)
                            
                            HStack {
                                SunTimeContainer(width: containerWidth, height: containerHeight)
                                MindSetContainer(width: containerWidth, height: containerHeight)
                            }
                            
                            HStack {
                                WalkingContainer(width: containerWidth, height: containerHeight)
                                NoiseContainer(width: containerWidth, height: containerHeight)
                            }
                            
                            HStack {
                                WaterContainer(width: containerWidth, height: containerHeight)
                                CaffeinContainer(width: containerWidth, height: containerHeight)
                            }
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                store.send(.dateSelected(Date().weekdayOffset()))
                store.send(.onAppear)
            }
        }
    }
}

#Preview {
    ActivityView(store: Store(initialState: ActivityFeature.ActivityState(selectedIndex: 0, dates: []), reducer: {
        ActivityFeature()
    }))
}

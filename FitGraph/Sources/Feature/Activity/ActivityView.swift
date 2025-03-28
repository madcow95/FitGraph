import SwiftUI
import ComposableArchitecture

struct ActivityView: View {
    let store: StoreOf<ActivityFeature>
    
    var body: some View {
        GeometryReader { geo in
            let containerWidth = geo.size.width - 40
            let containerHeight = geo.size.height / 5
            
            ActivityContentView(
                store: store,
                containerWidth: containerWidth,
                containerHeight: containerHeight
            )
        }
    }
}

struct ActivityContentView: View {
    let store: StoreOf<ActivityFeature>
    let containerWidth: CGFloat
    let containerHeight: CGFloat
    
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
                                    if Int(Date().dayStr)! < Int(date.dayStr)! {
                                        return
                                    }
                                    self.store.send(.dateSelected(i), animation: .interactiveSpring)
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
                                         caloriesConsumption: store.calories,
                                         workoutTime: store.workoutTime,
                                         standTime: store.standTime)
                        
                        FeelingContainer(width: containerWidth,
                                         height: containerHeight)
                        
                        HStack {
                            WalkingContainer(width: containerWidth,
                                             height: containerHeight,
                                             walkCount: store.stepCount)
                            WaterContainer(width: containerWidth,
                                           height: containerHeight)
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            store.send(.onAppear)
            store.send(.dateSelected(Date().weekdayOffset()))
        }
    }
}

#Preview {
    ActivityView(store: Store(initialState: ActivityFeature.ActivityState(), reducer: {
        ActivityFeature(hkService: HealthKitService())
    }))
}

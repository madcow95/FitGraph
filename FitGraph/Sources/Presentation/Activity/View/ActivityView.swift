import SwiftUI

struct ActivityView: View {
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
                            HStack {
                                ForEach(0..<7, id: \.self) { _ in
                                    VStack {
                                        Text("11")
                                        Text("월")
                                    }
                                    .padding()
                                }
                            }
                        }
                        .padding()
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            SleepContainer(width: containerWidth, height: containerHeight)
                            WorkoutContainer(width: containerWidth, height: containerHeight)
                            FeelingRecordContainer(width: containerWidth, height: containerHeight - 20)
                            
                            HStack {
                                SunTimeContainer(width: containerWidth, height: containerHeight)
                                MindSettingContainer(width: containerWidth, height: containerHeight)
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
        }
    }
}

#Preview {
    ActivityView()
}

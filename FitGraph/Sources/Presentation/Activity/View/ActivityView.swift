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
                            ActivityContainer(width: containerWidth,
                                              height: containerHeight,
                                              backgroundColor: .white,
                                              headerImage: Image(systemName: "bed.double"),
                                              headerImageColor: .purple,
                                              headerTitle: "수면",
                                              headerIcon: Image(systemName: "chevron.right"),
                                              headerIconColor: Color(UIColor.lightGray)) {
                                HStack {
                                    VStack(alignment: .leading, spacing: containerHeight / 10) {
                                        Text("기간")
                                            .foregroundStyle(Color.purple)
                                        Text("-")
                                    }
                                    Spacer()
                                    VStack(alignment: .leading, spacing: containerHeight / 10) {
                                        Text("품질")
                                            .foregroundStyle(Color.blue)
                                        Text("-")
                                    }
                                    Spacer()
                                    VStack(alignment: .leading, spacing: containerHeight / 10) {
                                        Text("평균 심박수")
                                        Text("-")
                                    }
                                    Spacer()
                                    Image(systemName: "gauge.with.needle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                }
                            }
                            
                            ActivityContainer(
                                width: containerWidth,
                                height: containerHeight,
                                backgroundColor: .white,
                                headerImage: Image(systemName: "flame.fill"),
                                headerImageColor: .red,
                                headerTitle: "운동",
                                headerIcon: Image(systemName: "chevron.right"),
                                headerIconColor: Color(UIColor.lightGray)) {
                                    HStack {
                                        VStack(alignment: .leading, spacing: containerHeight / 10) {
                                            Text("움직임")
                                                .foregroundStyle(Color.red)
                                            HStack(spacing: 3) {
                                                Text("0")
                                                Text("Cal")
                                                    .foregroundStyle(Color(UIColor.lightGray))
                                            }
                                        }
                                        Spacer()
                                        VStack(alignment: .leading, spacing: containerHeight / 10) {
                                            Text("운동")
                                                .foregroundStyle(Color.green)
                                            HStack(spacing: 3) {
                                                Text("0")
                                                Text("분")
                                                    .foregroundStyle(Color(UIColor.lightGray))
                                            }
                                        }
                                        Spacer()
                                        VStack(alignment: .leading, spacing: containerHeight / 10) {
                                            Text("서기")
                                                .foregroundStyle(Color.blue)
                                            HStack(spacing: 3) {
                                                Text("0")
                                                Text("시간")
                                                    .foregroundStyle(Color(UIColor.lightGray))
                                            }
                                        }
                                        Spacer()
                                        Image(systemName: "gauge.with.needle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                    }
                                }
                            
                            ActivityContainer(
                                width: containerWidth,
                                height: containerHeight - 40,
                                backgroundColor: .white,
                                headerImage: Image(systemName: "face.smiling"),
                                headerImageColor: .cyan,
                                headerTitle: "감정 기록",
                                headerIcon: Image(systemName: "pencil"),
                                headerIconColor: Color(UIColor.lightGray)) {
                                    HStack {
                                        VStack(alignment: .leading, spacing: containerHeight / 10) {
                                            Text("지금 기분이 어떠세요?")
                                                .foregroundStyle(Color(UIColor.lightGray))
                                        }
                                        Spacer()
                                    }
                                }
                            
                            HStack {
                                ActivityContainer(
                                    width: containerWidth / 2,
                                    height: containerHeight,
                                    backgroundColor: .white,
                                    headerImage: Image(systemName: "sun.max"),
                                    headerImageColor: .yellow,
                                    headerTitle: "일광 시간",
                                    headerIcon: Image(systemName: "chevron.right"),
                                    headerIconColor: Color(UIColor.lightGray)) {
                                        HStack {
                                            VStack(alignment: .leading, spacing: containerHeight / 10) {
                                                VStack {
                                                    HStack(spacing: 0) {
                                                        Text("0")
                                                        Text("/20분")
                                                            .foregroundStyle(Color(UIColor.lightGray))
                                                        Spacer()
                                                    }
                                                    HStack {
                                                        Spacer()
                                                        Image(systemName: "circle.circle")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: containerWidth / 8,
                                                                   height: containerWidth / 8)
                                                    }
                                                }
                                            }
                                            Spacer()
                                        }
                                    }
                                
                                ActivityContainer(
                                    width: containerWidth / 2,
                                    height: containerHeight,
                                    backgroundColor: .white,
                                    headerImage: Image(systemName: "figure.mind.and.body"),
                                    headerImageColor: .blue,
                                    headerTitle: "마음챙김",
                                    headerIcon: Image(systemName: "chevron.right"),
                                    headerIconColor: Color(UIColor.lightGray)) {
                                        HStack {
                                            VStack(alignment: .leading, spacing: containerHeight / 10) {
                                                VStack {
                                                    HStack {
                                                        Text("0")
                                                        Text("/3분")
                                                            .foregroundStyle(Color(UIColor.lightGray))
                                                        Spacer()
                                                    }
                                                    HStack {
                                                        Spacer()
                                                        Image(systemName: "circle.circle.fill")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: containerWidth / 8,
                                                                   height: containerWidth / 8)
                                                    }
                                                }
                                            }
                                            Spacer()
                                        }
                                    }
                            }
                            
                            HStack {
                                ActivityContainer(
                                    width: containerWidth / 2,
                                    height: containerHeight,
                                    backgroundColor: .white,
                                    headerImage: Image(systemName: "shoe"),
                                    headerImageColor: .green,
                                    headerTitle: "걸음",
                                    headerIcon: Image(systemName: "chevron.right"),
                                    headerIconColor: Color(UIColor.lightGray)) {
                                        HStack {
                                            VStack(alignment: .leading, spacing: containerHeight / 10) {
                                                VStack {
                                                    HStack(spacing: 0) {
                                                        Text("0")
                                                        Text("/10000")
                                                            .foregroundStyle(Color(UIColor.lightGray))
                                                        Spacer()
                                                    }
                                                    HStack {
                                                        Spacer()
                                                        Image(systemName: "circle.circle.fill")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: containerHeight / 8, height: containerHeight / 8)
                                                    }
                                                }
                                            }
                                            Spacer()
                                        }
                                    }
                                
                                ActivityContainer(
                                    width: containerWidth / 2,
                                    height: containerHeight,
                                    backgroundColor: .white,
                                    headerImage: Image(systemName: "waveform.path"),
                                    headerImageColor: Color(UIColor.systemBlue),
                                    headerTitle: "소음",
                                    headerIcon: Image(systemName: "chevron.right"),
                                    headerIconColor: Color(UIColor.lightGray)) {
                                        HStack {
                                            VStack(alignment: .leading, spacing: containerHeight / 10) {
                                                VStack {
                                                    HStack {
                                                        Text("-")
                                                        Spacer()
                                                    }
                                                    HStack {
                                                        Spacer()
                                                        Image(systemName: "ear")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: containerWidth / 8,
                                                                   height: containerWidth / 8)
                                                    }
                                                }
                                            }
                                            Spacer()
                                        }
                                    }
                            }
                            
                            HStack {
                                ActivityContainer(
                                    width: containerWidth / 2,
                                    height: containerHeight,
                                    backgroundColor: .white,
                                    headerImage: Image(systemName: "drop"),
                                    headerImageColor: .blue,
                                    headerTitle: "수분 섭취",
                                    headerIcon: Image(systemName: "plus.circle"),
                                    headerIconColor: .blue) {
                                        HStack {
                                            VStack(alignment: .leading, spacing: containerHeight / 10) {
                                                VStack {
                                                    HStack {
                                                        Text("0")
                                                        Text("/2000ml")
                                                            .foregroundStyle(Color(UIColor.lightGray))
                                                        Spacer()
                                                    }
                                                    HStack {
                                                        Spacer()
                                                        Image(systemName: "ear")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: containerWidth / 8,
                                                                   height: containerWidth / 8)
                                                    }
                                                }
                                            }
                                            Spacer()
                                        }
                                    }
                                
                                ActivityContainer(
                                    width: containerWidth / 2,
                                    height: containerHeight,
                                    backgroundColor: .white,
                                    headerImage: Image(systemName: "heart"),
                                    headerImageColor: .brown,
                                    headerTitle: "카페인",
                                    headerIcon: Image(systemName: "plus.circle"),
                                    headerIconColor: .brown) {
                                        HStack {
                                            VStack(alignment: .leading, spacing: containerHeight / 10) {
                                                VStack {
                                                    HStack {
                                                        Text("0")
                                                        Text("mg")
                                                            .foregroundStyle(Color(UIColor.lightGray))
                                                        Spacer()
                                                    }
                                                    HStack {
                                                        Spacer()
                                                        Image(systemName: "mug")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: containerWidth / 8,
                                                                   height: containerWidth / 8)
                                                    }
                                                }
                                            }
                                            Spacer()
                                        }
                                    }
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

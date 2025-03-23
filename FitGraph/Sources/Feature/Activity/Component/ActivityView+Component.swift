import SwiftUI

struct ActivityContainer<BodyContainer: View>: View {
    var width: CGFloat
    var height: CGFloat
    var backgroundColor: Color
    var headerImage: Image
    var headerImageColor: Color
    var headerTitle: String
    var headerIcon: Image
    var headerIconColor: Color
    var bodyContainer: BodyContainer
    
    init(width: CGFloat,
         height: CGFloat,
         backgroundColor: Color,
         headerImage: Image,
         headerImageColor: Color,
         headerTitle: String,
         headerIcon: Image,
         headerIconColor: Color,
         @ViewBuilder bodyContainer: () -> BodyContainer) {
        self.width = width
        self.height = height
        self.backgroundColor = backgroundColor
        self.headerImage = headerImage
        self.headerImageColor = headerImageColor
        self.headerTitle = headerTitle
        self.headerIcon = headerIcon
        self.headerIconColor = headerIconColor
        self.bodyContainer = bodyContainer()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(backgroundColor)
            
            VStack(spacing: 20) {
                HStack {
                    Button {
                        
                    } label: {
                        headerImage
                            .tint(headerImageColor)
                        Text(headerTitle)
                            .foregroundStyle(Color(UIColor.label))
                        Spacer()
                        headerIcon
                            .tint(headerIconColor)
                    }
                }
                
                bodyContainer
            }
            .padding()
            .padding([.leading, .trailing], 10)
        }
        .frame(width: width, height: height)
    }
}

struct SleepContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ActivityContainer(width: width,
                          height: height,
                          backgroundColor: .white,
                          headerImage: Image(systemName: "bed.double"),
                          headerImageColor: .purple,
                          headerTitle: "수면",
                          headerIcon: Image(systemName: "chevron.right"),
                          headerIconColor: Color(UIColor.lightGray)) {
            HStack {
                VStack(alignment: .leading, spacing: height / 10) {
                    Text("기간")
                        .foregroundStyle(Color.purple)
                    Text("-")
                }
                .bold()
                Spacer()
                VStack(alignment: .leading, spacing: height / 10) {
                    Text("품질")
                        .foregroundStyle(Color.blue)
                    Text("-")
                }
                .bold()
                Spacer()
                VStack(alignment: .leading, spacing: height / 10) {
                    Text("평균 심박수")
                    Text("-")
                }
                .bold()
                Spacer()
                Image(systemName: "gauge.with.needle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }
        }
    }
}

struct WorkoutContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ActivityContainer(
            width: width,
            height: height,
            backgroundColor: .white,
            headerImage: Image(systemName: "flame.fill"),
            headerImageColor: .red,
            headerTitle: "운동",
            headerIcon: Image(systemName: "chevron.right"),
            headerIconColor: Color(UIColor.lightGray)) {
                HStack {
                    VStack(alignment: .leading, spacing: height / 10) {
                        Text("움직임")
                            .foregroundStyle(Color.red)
                        HStack(spacing: 3) {
                            Text("0")
                            Text("Cal")
                                .foregroundStyle(Color(UIColor.lightGray))
                        }
                    }
                    .bold()
                    Spacer()
                    VStack(alignment: .leading, spacing: height / 10) {
                        Text("운동")
                            .foregroundStyle(Color.green)
                        HStack(spacing: 3) {
                            Text("0")
                            Text("분")
                                .foregroundStyle(Color(UIColor.lightGray))
                        }
                    }
                    .bold()
                    Spacer()
                    VStack(alignment: .leading, spacing: height / 10) {
                        Text("서기")
                            .foregroundStyle(Color.blue)
                        HStack(spacing: 3) {
                            Text("0")
                            Text("시간")
                                .foregroundStyle(Color(UIColor.lightGray))
                        }
                    }
                    .bold()
                    Spacer()
                    Image(systemName: "gauge.with.needle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
            }
    }
}

struct FeelingContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ActivityContainer(
            width: width,
            height: height - 40,
            backgroundColor: .white,
            headerImage: Image(systemName: "face.smiling"),
            headerImageColor: .cyan,
            headerTitle: "감정 기록",
            headerIcon: Image(systemName: "pencil"),
            headerIconColor: Color(UIColor.lightGray)) {
                HStack {
                    VStack(alignment: .leading, spacing: height / 10) {
                        Text("지금 기분이 어떠세요?")
                            .foregroundStyle(Color(UIColor.lightGray))
                            .bold()
                    }
                    Spacer()
                }
            }
    }
}

struct SunTimeContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ActivityContainer(
            width: width / 2,
            height: height,
            backgroundColor: .white,
            headerImage: Image(systemName: "sun.max"),
            headerImageColor: .yellow,
            headerTitle: "일광 시간",
            headerIcon: Image(systemName: "chevron.right"),
            headerIconColor: Color(UIColor.lightGray)) {
                HStack {
                    VStack(alignment: .leading, spacing: height / 10) {
                        VStack {
                            HStack(spacing: 0) {
                                Text("0")
                                Text("/20분")
                                    .foregroundStyle(Color(UIColor.lightGray))
                                Spacer()
                            }
                            .bold()
                            HStack {
                                Spacer()
                                Image(systemName: "circle.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: width / 8,
                                           height: width / 8)
                            }
                        }
                    }
                    Spacer()
                }
            }
    }
}

struct MindSetContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ActivityContainer(
            width: width / 2,
            height: height,
            backgroundColor: .white,
            headerImage: Image(systemName: "figure.mind.and.body"),
            headerImageColor: .blue,
            headerTitle: "마음챙김",
            headerIcon: Image(systemName: "chevron.right"),
            headerIconColor: Color(UIColor.lightGray)) {
                HStack {
                    VStack(alignment: .leading, spacing: height / 10) {
                        VStack {
                            HStack(spacing: 0) {
                                Text("0")
                                Text("/3분")
                                    .foregroundStyle(Color(UIColor.lightGray))
                                Spacer()
                            }
                            .bold()
                            HStack {
                                Spacer()
                                Image(systemName: "circle.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: width / 8,
                                           height: width / 8)
                            }
                        }
                    }
                    Spacer()
                }
            }
    }
}

struct WalkingContainer: View {
    var width: CGFloat
    var height: CGFloat
    var walkCount: Int
    
    var body: some View {
        ActivityContainer(
            width: width / 2,
            height: height,
            backgroundColor: .white,
            headerImage: Image(systemName: "shoe"),
            headerImageColor: .green,
            headerTitle: "걸음",
            headerIcon: Image(systemName: "chevron.right"),
            headerIconColor: Color(UIColor.lightGray)) {
                HStack {
                    VStack(alignment: .leading, spacing: height / 10) {
                        VStack {
                            HStack(spacing: 0) {
                                Text("\(walkCount)")
                                    .bold()
                                Text("/10000")
                                    .foregroundStyle(Color(UIColor.lightGray))
                                Spacer()
                            }
                            .bold()
                            HStack {
                                Spacer()
                                Image(systemName: "circle.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: width / 8,
                                           height: width / 8)
                            }
                        }
                    }
                    Spacer()
                }
            }
    }
}

struct NoiseContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ActivityContainer(
            width: width / 2,
            height: height,
            backgroundColor: .white,
            headerImage: Image(systemName: "waveform.path"),
            headerImageColor: Color(UIColor.systemBlue),
            headerTitle: "소음",
            headerIcon: Image(systemName: "chevron.right"),
            headerIconColor: Color(UIColor.lightGray)) {
                HStack {
                    VStack(alignment: .leading, spacing: height / 10) {
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
                                    .frame(width: width / 8,
                                           height: width / 8)
                            }
                        }
                        .bold()
                    }
                    Spacer()
                }
            }
    }
}

struct WaterContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ActivityContainer(
            width: width / 2,
            height: height,
            backgroundColor: .white,
            headerImage: Image(systemName: "drop"),
            headerImageColor: .blue,
            headerTitle: "수분 섭취",
            headerIcon: Image(systemName: "plus.circle"),
            headerIconColor: .blue) {
                HStack {
                    VStack(alignment: .leading, spacing: height / 10) {
                        VStack {
                            HStack(spacing: 0) {
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
                                    .frame(width: width / 8,
                                           height: width / 8)
                            }
                        }
                        .bold()
                    }
                    Spacer()
                }
            }
    }
}

struct CaffeinContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ActivityContainer(
            width: width / 2,
            height: height,
            backgroundColor: .white,
            headerImage: Image(systemName: "heart"),
            headerImageColor: .brown,
            headerTitle: "카페인",
            headerIcon: Image(systemName: "plus.circle"),
            headerIconColor: .brown) {
                HStack {
                    VStack(alignment: .leading, spacing: height / 10) {
                        VStack {
                            HStack(spacing: 0) {
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
                                    .frame(width: width / 8,
                                           height: width / 8)
                            }
                        }
                        .bold()
                    }
                    Spacer()
                }
            }
    }
}

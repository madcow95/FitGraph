import SwiftUI

struct SleepContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(.white)
            
            VStack(spacing: 20) {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "bed.double")
                            .tint(.purple)
                        Text("수면")
                            .foregroundStyle(Color(UIColor.label))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .tint(Color(UIColor.lightGray))
                    }
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: height / 10) {
                        Text("기간")
                            .foregroundStyle(Color.purple)
                        Text("-")
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: height / 10) {
                        Text("품질")
                            .foregroundStyle(Color.blue)
                        Text("-")
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: height / 10) {
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
            .padding()
            .padding([.leading, .trailing], 20)
        }
        .frame(width: width, height: height)
    }
}

struct WorkoutContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(.white)
            
            VStack(spacing: 20) {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "flame.fill")
                            .tint(.red)
                        Text("운동")
                            .foregroundStyle(Color(UIColor.label))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .tint(Color(UIColor.lightGray))
                    }
                }
                
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
                    Spacer()
                    Image(systemName: "gauge.with.needle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
            }
            .padding()
            .padding([.leading, .trailing], 20)
        }
        .frame(width: width, height: height)
    }
}

struct FeelingRecordContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(.white)
            
            VStack(spacing: 20) {
                HStack {
                    Button {
                        
                    } label: {
                        HStack(spacing: 5) {
                            Image(systemName: "face.smiling")
                                .foregroundStyle(Color.cyan)
                            Text("감정 기록")
                                .foregroundStyle(Color(UIColor.label))
                            
                            Spacer()
                            
                            Text("기록")
                                .foregroundStyle(Color(UIColor.lightGray))
                            Image(systemName: "pencil")
                                .tint(Color(UIColor.lightGray))
                        }
                    }
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: height / 10) {
                        Text("지금 기분이 어떠세요?")
                            .foregroundStyle(Color(UIColor.lightGray))
                    }
                    Spacer()
                }
            }
            .padding()
            .padding([.leading, .trailing], 20)
        }
        .frame(width: width, height: height)
    }
}

struct SunTimeContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(.white)
            
            VStack(spacing: 20) {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "sun.max")
                            .foregroundStyle(Color.yellow)
                        Text("일광 시간")
                            .foregroundStyle(Color(UIColor.label))
                        
                        Spacer()
                        
                        HStack(spacing: 5) {
                            Image(systemName: "chevron.right")
                                .tint(Color(UIColor.lightGray))
                        }
                    }
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: height / 10) {
                        VStack {
                            HStack {
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
                                    .frame(width: width / 8, height: width / 8)
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding()
            .padding([.leading, .trailing], 10)
        }
        .frame(width: width / 2, height: height)
    }
}

struct MindSettingContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(.white)
            
            VStack(spacing: 20) {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "figure.mind.and.body")
                            .foregroundStyle(Color.blue)
                        Text("마음챙김")
                            .foregroundStyle(Color(UIColor.label))
                        
                        Spacer()
                        
                        HStack(spacing: 5) {
                            Image(systemName: "chevron.right")
                                .tint(Color(UIColor.lightGray))
                        }
                    }
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: height / 10) {
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
                                    .frame(width: width / 8, height: width / 8)
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding()
            .padding([.leading, .trailing], 10)
        }
        .frame(width: width / 2, height: height)
    }
}

struct WalkingContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(.white)
            
            VStack(spacing: 20) {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "shoe")
                        Text("걸음")
                            .foregroundStyle(Color(UIColor.label))
                        
                        Spacer()
                        
                        HStack(spacing: 5) {
                            Image(systemName: "chevron.right")
                                .tint(Color(UIColor.lightGray))
                        }
                    }
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: height / 10) {
                        VStack {
                            HStack {
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
                                    .frame(width: width / 8, height: width / 8)
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding()
            .padding([.leading, .trailing], 10)
        }
        .frame(width: width / 2, height: height)
    }
}

struct NoiseContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(.white)
            
            VStack(spacing: 20) {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "waveform.path")
                        Text("소음")
                            .foregroundStyle(Color(UIColor.label))
                        
                        Spacer()
                        
                        HStack(spacing: 5) {
                            Image(systemName: "chevron.right")
                                .tint(Color(UIColor.lightGray))
                        }
                    }
                }
                
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
                                    .frame(width: width / 8, height: width / 8)
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding()
            .padding([.leading, .trailing], 10)
        }
        .frame(width: width / 2, height: height)
    }
}

struct WaterContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(.white)
            
            VStack(spacing: 20) {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "drop")
                        Text("수분 섭취")
                            .foregroundStyle(Color(UIColor.label))
                        
                        Spacer()
                        
                        HStack(spacing: 5) {
                            Image(systemName: "plus.circle")
                                .tint(Color(UIColor.systemBlue))
                        }
                    }
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: height / 10) {
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
                                    .frame(width: width / 8, height: width / 8)
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding()
            .padding([.leading, .trailing], 10)
        }
        .frame(width: width / 2, height: height)
    }
}

struct CaffeinContainer: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(.white)
            
            VStack(spacing: 20) {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                        Text("카페인")
                            .foregroundStyle(Color(UIColor.label))
                        
                        Spacer()
                        
                        HStack(spacing: 5) {
                            Image(systemName: "plus.circle")
                                .tint(Color(UIColor.systemBrown))
                        }
                    }
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: height / 10) {
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
                                    .frame(width: width / 8, height: width / 8)
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding()
            .padding([.leading, .trailing], 10)
        }
        .frame(width: width / 2, height: height)
    }
}

import SwiftUI

struct MyPageView: View {
    
    var body: some View {
        let weeks: [Week] = generateWeeks(from: Date(), weeksCount: 10)
        let dayFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "d"
            return formatter
        }()

        let weekdayFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateFormat = "E"
            return formatter
        }()
        
        TabView {
            ForEach(weeks) { week in
                HStack(spacing: 16) {
                    ForEach(week.dates, id: \.self) { date in
                        VStack {
                            Text(dayFormatter.string(from: date))
                                .font(.headline)
                            Text(weekdayFormatter.string(from: date))
                                .font(.subheadline)
                        }
//                        .frame(width: 50, height: 80)
                        .background(isToday(date) ? Color.green.opacity(0.3) : Color.clear)
                        .cornerRadius(12)
                    }
                }
            }
        }
        .padding()
        .tabViewStyle(.page(indexDisplayMode: .never)) // 좌우 스와이프
        .frame(height: 100)
    }
    
    func isToday(_ date: Date) -> Bool {
        Calendar.current.isDateInToday(date)
    }
    
    func generateWeeks(from startDate: Date, weeksCount: Int) -> [Week] {
        var weeks: [Week] = []
        var currentStart = Calendar.current.startOfWeek(for: startDate)

        for _ in 0..<weeksCount {
            let dates = (0..<7).compactMap { Calendar.current.date(byAdding: .day, value: $0, to: currentStart) }
            weeks.append(Week(dates: dates))
            currentStart = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: currentStart)!
        }
        return weeks
    }
}

#Preview {
    MyPageView()
}

struct Week: Identifiable {
    let id = UUID()
    let dates: [Date]
}

extension Calendar {
    func startOfWeek(for date: Date) -> Date {
        return self.date(from: self.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date))!
    }
}

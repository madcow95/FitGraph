//
//  Date+Extension.swift
//  FitGraph
//
//  Created by 최광우 on 3/23/25.
//

import SwiftUI

extension Date {
    func getWeekDay(from date: Date) -> [Date] {
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 2
        calendar.timeZone = TimeZone(identifier: "Asia/Seoul")!
        
        var components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
        components.weekday = 2 // 월요일
        
        guard let monday = calendar.date(from: components) else { return [] }
        
        var weekDates: [Date] = []
        for offset in 0..<7 {
            if let day = calendar.date(byAdding: .day, value: offset, to: monday) {
                weekDates.append(day)
            }
        }
        return weekDates
    }
    
    func weekdayOffset() -> Int {
        let calendar = Calendar(identifier: .gregorian)
        let weekday = calendar.component(.weekday, from: self)
        
        // 월요일(2) → 0, 일요일(1) → 6
        if weekday == 1 {
            return 6 // 일요일
        } else {
            return weekday - 2 // 월요일(2) → 0, 화요일(3) → 1, ..., 토요일(7) → 5
        }
    }
    
    var dayStr: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd"
            
            return dateFormatter.string(from: self)
        }
    }
    
    var dayOfWeek: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E"
            
            return dateFormatter.string(from: self)
        }
    }
}

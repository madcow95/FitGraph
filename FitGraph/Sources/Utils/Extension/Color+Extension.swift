import SwiftUI

extension Color {
    static var lightBackgroundColor: Color {
        get {
            var rgbValue: UInt64 = 0
            Scanner(string: "F2F2F7").scanHexInt64(&rgbValue)
            
            let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
            
            return Color(uiColor: UIColor(red: red, green: green, blue: blue, alpha: 1.0))
        }
    }
    
    static var darkBackgroundColor: Color {
        get {
            var rgbValue: UInt64 = 0
            Scanner(string: "1C1C1E").scanHexInt64(&rgbValue)
            
            let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
            
            return Color(uiColor: UIColor(red: red, green: green, blue: blue, alpha: 1.0))
        }
    }
    
    static var mainColor: Color {
        get {
            var rgbValue: UInt64 = 0
            Scanner(string: "34C759").scanHexInt64(&rgbValue)
            
            let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
            
            return Color(uiColor: UIColor(red: red, green: green, blue: blue, alpha: 1.0))
        }
    }
}

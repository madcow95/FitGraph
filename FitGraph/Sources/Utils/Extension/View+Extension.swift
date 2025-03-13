import SwiftUI
import Combine

struct BackgroundView<Content: View>: View {
    @EnvironmentObject var userService: UserDefaultService
    var content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            (userService.appearance == "Light" ? Color.lightBackgroundColor : Color.darkBackgroundColor)
                .ignoresSafeArea()
            content
        }
    }
}

import SwiftUI

struct SettingView: View {
    let list: [String] = []
    
    var body: some View {
        List(list, id: \.self) { item in
            Button {
                
            } label: {
                Text(item)
            }
        }
    }
}

#Preview {
    SettingView()
}

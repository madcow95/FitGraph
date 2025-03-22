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

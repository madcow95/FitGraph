// swift-tools-version: 6.0
import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,]
        productTypes: ["ComposableArchitecture": .framework,
                       "Kingfisher": .framework]
    )
#endif

let package = Package(
    name: "FitGraph",
    dependencies: [
        // Add your own dependencies here:
         .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.18.0"),
         .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.0.0")
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
    ]
)

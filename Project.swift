import ProjectDescription

let project = Project(
    name: "FitGraph",
    options: .options(
        automaticSchemesOptions: .disabled,
        defaultKnownRegions: ["en", "ko"],
        developmentRegion: "ko",
        textSettings: .textSettings(usesTabs: false, indentWidth: 4, tabWidth: 4)
    ),
    targets: [
        .target(
            name: "FitGraph",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.FitGraph",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: [
                "FitGraph/Sources/**",
                "FitGraph/Sources/App/**",
                "FitGraph/Sources/Data/**",
                "FitGraph/Sources/Service/**",
                "FitGraph/Sources/Utils/**",
                "FitGraph/Sources/Presentation/**"
            ],
            resources: ["FitGraph/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "FitGraphTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.FitGraphTests",
            infoPlist: .default,
            sources: ["FitGraph/Tests/**"],
            resources: [],
            dependencies: [.target(name: "FitGraph")]
        ),
    ]
)

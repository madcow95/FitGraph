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
            bundleId: "com.madcow.FitGraph",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                    "NSHealthShareUsageDescription": "이 앱은 사용자의 걸음 수 데이터를 읽기 위해 HealthKit을 사용합니다.",
                    "NSHealthUpdateUsageDescription": "이 앱은 사용자의 걸음 수 데이터를 기록하기 위해 HealthKit을 사용합니다."
                ]
            ),
            sources: [
                "FitGraph/Sources/**",
                "FitGraph/Sources/Dependency/**",
                "FitGraph/Sources/Feature/**",
                "FitGraph/Sources/App/**",
                "FitGraph/Sources/Utils/**"
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

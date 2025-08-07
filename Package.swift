// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "FWAdManager",
    platforms: [
        .iOS(.v12), .tvOS(.v12)
    ],
    products: [
        .library(
            name: "AdManager",
            targets: ["AdManager"]),
    ],
    targets: [
        .binaryTarget(
            name: "AdManager",
            url: "https://github.com/FreeWheelVIS/FWAdManager_Apple/releases/download/0.0.8/Apple_AdManagerDistribution_0.0.8.zip",
            checksum: "abaa3d00e617e3ff5749157a5647ab46ba3a605d5b6a4fd25792e9864b981216"),
    ]
)

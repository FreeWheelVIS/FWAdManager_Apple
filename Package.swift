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
            url: "https://github.com/FreeWheelVIS/FWAdManager_Apple/releases/download/7.13.0/Apple_AdManagerDistribution_7.13.0.zip",
            checksum: "ecf711ff3d0c3c9ffc873adcf7453b8ec4ff93e75c0c59f473944d1845665478"),
    ]
)

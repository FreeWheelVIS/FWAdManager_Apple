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
            url: "https://github.com/FreeWheelVIS/FWAdManager_Apple/releases/download/7.20.0/Apple_AdManagerDistribution_7.20.0.zip",
            checksum: "d26ac6def89c9ff77c4daeb80d3c6184603d481cc40b98a9a841358e55827c95"),
    ]
)

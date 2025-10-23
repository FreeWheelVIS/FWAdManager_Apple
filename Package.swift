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
            url: "https://github.com/FreeWheelVIS/FWAdManager_Apple/releases/download/7.12.0/Apple_AdManagerDistribution_7.12.0.zip",
            checksum: "8a4cfd7366e35d8c841316d9e58474044f52624688a76e5028b487fc0f1a4674"),
    ]
)

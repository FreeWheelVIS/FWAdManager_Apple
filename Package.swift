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
            checksum: "a5f9274ea6cef54d8b84ff94ee9b2f5c6aeac2d0866a13f18f404ae175a156ed"),
    ]
)

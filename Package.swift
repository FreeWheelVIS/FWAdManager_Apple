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
            url: "https://github.com/FreeWheelVIS/FWAdManager_Apple/releases/download/7.18.0/Apple_AdManagerDistribution_7.18.0.zip",
            checksum: "a8709dd4f1c70423b72afe7dd1e3449c187f3454b0ac4519395d36200aa3da05"),
    ]
)

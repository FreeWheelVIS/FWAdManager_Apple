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
            checksum: "b3415c68169001cd5d2b92db6fe964d685f4558f0c9bf86a67c650eb62e11ab4"),
    ]
)

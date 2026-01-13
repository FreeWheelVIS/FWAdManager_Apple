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
            url: "https://github.com/FreeWheelVIS/FWAdManager_Apple/releases/download/7.14.0/Apple_AdManagerDistribution_7.14.0.zip",
            checksum: "2b0a29ac57f9a504c8f0647bec211efff30d3006bdf93cdb1d9b00380399c7d8"),
    ]
)

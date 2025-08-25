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
            url: "https://github.com/FreeWheelVIS/FWAdManager_Apple/releases/download/7.11.0/Apple_AdManagerDistribution_7.11.0.zip",
            checksum: "de315c239508e6a3bbb750e9b4149c22752c742a532c24b02c40abb65be20c8b"),
    ]
)

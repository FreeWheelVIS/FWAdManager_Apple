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
            url: "https://github.com/FreeWheelVIS/FWAdManager_Apple/releases/download/7.15.0/Apple_AdManagerDistribution_7.15.0.zip",
            checksum: "15e75bafe43bbad7022d3714d142962caa2731189ca0eaf8c9656e5be5e36c1a"),
    ]
)

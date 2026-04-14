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
            url: "https://github.com/FreeWheelVIS/FWAdManager_Apple/releases/download/7.15.1/Apple_AdManagerDistribution_7.15.1.zip",
            checksum: "13a26eded08813220c6c2c8f7527fd165848e854fbb1eadafbe10b2bef8f8a51"),
    ]
)

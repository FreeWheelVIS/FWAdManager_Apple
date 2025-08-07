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
            url: "https://github.com/FreeWheelVIS/FWAdManager_Apple/releases/download/0.0.9/Apple_AdManagerDistribution_0.0.9.zip",
            checksum: "925954f142b8c11dfe2391130517c56402628ab27c3c0ca24c5adb1b4d21ee18"),
    ]
)

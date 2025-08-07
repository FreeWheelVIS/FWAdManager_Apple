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
            url: "https://github.com/FreeWheelVIS/FWAdManager_Apple/releases/download/0.10.0/Apple_AdManagerDistribution_0.10.0.zip",
            checksum: "ce6f51f2cb9daeaff43019b7b54c02bb920cab8c0ca613b92249923e392d5059"),
    ]
)

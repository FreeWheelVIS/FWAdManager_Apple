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
            url: "https://arti.freewheel.tv/generic-local/vi/dist/Apple_AdManagerDistribution_7.10.0.zip",
            checksum: "9266c31fe1c6a013528abf3663eb383d78dcb4ab623681d130a383238c0b3d92"),
    ]
)

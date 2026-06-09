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
            url: "https://github.com/FreeWheelVIS/FWAdManager_Apple/releases/download/7.17.0/Apple_AdManagerDistribution_7.17.0.zip",
            checksum: "2b6487b481c4a9c52eaccf0811848c6bfd83802745e62d8aa740dbcf3c87db6e"),
    ]
)

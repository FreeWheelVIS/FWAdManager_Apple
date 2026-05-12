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
            url: "https://github.com/FreeWheelVIS/FWAdManager_Apple/releases/download/7.16.0/Apple_AdManagerDistribution_7.16.0.zip",
            checksum: "82d7c2298c07bf439f76879251bfd30623dc6ea6c1549feeb0612c49511c3581"),
    ]
)

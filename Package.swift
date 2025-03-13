// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "FWAdManager",
    platforms: [
        .iOS(.v10), .tvOS(.v12)
    ],
    products: [
        .library(
            name: "FWAdManager",
            targets: ["FWAdManager"]),
    ],
    targets: [
        .binaryTarget(
            name: "FWAdManager",
            url: "https://mssl.fwmrm.net/p/am_dist/Apple_AdManagerDistribution.zip",
            checksum: "9779b8babc316edc52e7a493ce2d4629e671a4261848fbe297c4dbcb3c23cfec"),
    ]
)

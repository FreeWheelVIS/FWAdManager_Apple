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
            url: "https://arti.freewheel.tv/generic-local/vi/dist/Apple_AdManagerDistribution_0.0.8.zip",
            checksum: "231585e23cd98f975c4f4091119a013a222c0107a42814ed61d1b54421321864"),
    ]
)

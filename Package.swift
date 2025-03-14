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
            url: "https://vi.freewheel.tv/static/demos/AdManager.xcframework.zip",
            checksum: "a9c9fccafd3189da9eab1b410fea673801a126bf9bf3b68823de1c4cd3624598"),
    ]
)

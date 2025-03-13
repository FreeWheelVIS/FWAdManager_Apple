// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "FWAdManager",
    platforms: [
        .iOS(.v12), .tvOS(.v12)
    ],
    products: [
        .library(
            name: "FWAdManager",
            targets: ["FWAdManager"]),
    ],
    targets: [
        .binaryTarget(
            name: "FWAdManager",
            url: "https://vi.freewheel.tv/static/demos/AdManager.xcframework.zip",
            checksum: "092bbd3e57e25093e85b7bc8d6e9b594512be87b7d2bd7eac7ed74e8cfad2c40"),
    ]
)

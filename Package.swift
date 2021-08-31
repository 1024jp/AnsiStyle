// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "AnsiStyle",
    products: [
        .library(name: "AnsiStyle", targets: ["AnsiStyle"]),
    ],
    targets: [
        .target(name: "AnsiStyle", dependencies: []),
        .testTarget(name: "AnsiStyleTests", dependencies: ["AnsiStyle"]),
    ]
)

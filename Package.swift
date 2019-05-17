// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Sequences",
    products: [
        .library(
            name: "Sequences",
            targets: ["Sequences"]),
    ],
    targets: [
        .target(
            name: "Sequences",
            dependencies: []),
        .testTarget(
            name: "SequencesTests",
            dependencies: ["Sequences"]),
    ]
)

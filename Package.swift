// swift-tools-version:5.1

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

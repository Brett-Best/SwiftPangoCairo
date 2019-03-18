// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "PangoCairo",
    products: [
        .library(name: "PangoCairo", targets: ["PangoCairo"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Brett-Best/SwiftCairo.git", .branch("bb-pkg-dev")),
        .package(url: "https://github.com/Brett-Best/SwiftPango.git", .branch("bb-pkg-dev"))
    ],
    targets: [
        .target(name: "PangoCairo", dependencies: ["Cairo", "Pango"]),
        .testTarget(name: "PangoCairoTests", dependencies: ["PangoCairo"]),
    ]
)

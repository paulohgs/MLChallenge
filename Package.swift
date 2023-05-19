// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MLChallenge",
    products: [
        .executable(name: "MLChallenge", targets: ["MLChallenge"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftcsv/SwiftCSV.git", from: "0.8.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "MLChallenge",
            dependencies: ["SwiftCSV"],
            path: "Sources",
            resources: [
                .process("Resources")
            ]
        ),
    ]
)

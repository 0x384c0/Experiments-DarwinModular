// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [
        .macOS(.v10_13), .iOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Domain",
            targets: ["Domain"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .exact("6.5.0")),
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
        .package(url: "../Common", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Domain",
            dependencies: [
                "Common",
                "RxSwift",
                .product(name: "Algorithms", package: "swift-algorithms"),
            ]),
        .testTarget(
            name: "DomainTests",
            dependencies: [
                "Domain",
                .product(name: "RxBlocking", package: "RxSwift"),
            ]),
    ]
)

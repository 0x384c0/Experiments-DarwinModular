// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [
        .macOS(.v10_13), .iOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Data",
            targets: ["Data"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1")),
        .package(url: "https://github.com/RxSwiftCommunity/RxAlamofire.git", from: "6.1.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .exact("6.5.0")),
        .package(url: "../Common", from: "1.0.0"),
        .package(url: "../Domain", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Data",
            dependencies: [
                "Alamofire",
                "RxAlamofire",
                "RxSwift",
                "Common",
                "Domain",
            ]),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"]),
    ]
)

// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let templatePath = "Templates/AutoUseCaseProvider.stencil"

let package = Package(
    name: "MonobankCore",
    platforms: [
        .macOS(.v11),
        .iOS(.v15)
    ],
    products: [
        .library(name: "MonobankCore", targets: ["MonobankCore"])
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya", from: "15.0.0"),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess", from: "4.2.2"),
        .package(url: "https://github.com/krzysztofzablocki/Sourcery", from: "1.6.1"),
    ],
    targets: [
        .target(name: "MonobankCore",
                dependencies: ["KeychainAccess", .product(name: "Moya", package: "Moya")],
                exclude: [templatePath]),
        .testTarget(name: "MonobankCoreTests", dependencies: ["MonobankCore"])
    ]
)

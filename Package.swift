// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FCExtensionKit",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "FCExtensionKit",
            targets: ["FCExtensionKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.1.2"),
        .package(name: "libwebp", url: "https://github.com/SDWebImage/libwebp-Xcode", from: "1.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "FCExtensionKit",
            dependencies: ["Kingfisher", "KingfisherWebP-ObjC"],
            path: "Sources",
            exclude: ["KingfisherWebP-ObjC", "Info.plist"]),
        
        .target(
            name: "KingfisherWebP-ObjC",
            dependencies: ["libwebp"],
            exclude: ["Info.plist"]),
        
        .testTarget(
            name: "FCExtensionKitTests",
            dependencies: ["FCExtensionKit"],
            path: "Tests"),
    ]
)

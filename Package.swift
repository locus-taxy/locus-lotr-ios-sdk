// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocusLotrSdk",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "LocusLotrSdk", type: .dynamic, targets: ["LocusLotrSdk"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.9.0"),
        .package(url: "https://github.com/Moya/Moya", from: "15.0.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift", from: "6.6.0"),
        .package(url: "https://github.com/realm/realm-swift", from: "10.54.4"),
    ],
    targets: [
        .binaryTarget(
            name: "LotrModels",
            url: "https://locus-binaries.s3.ap-south-1.amazonaws.com/LotrModels.xcframework.zip",
            checksum: "5f957e932e67150d4b74268ce1607f8508d4b097e65982f09dc106e66b4c9a79"
        ),
        .binaryTarget(
            name: "LotrSdk",
            url: "https://locus-binaries.s3.ap-south-1.amazonaws.com/LotrSdk.xcframework.zip",
            checksum: "776ce4beeecac34a78dad3987e4c023af7684c78b17c7c8a3d33298400b9a181"
        ),
        .target(
            name: "LocusLotrSdk",
            dependencies: [
                "LotrModels",
                "LotrSdk",
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "Moya", package: "Moya"),
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RealmSwift", package: "realm-swift"),
            ]
        ),
    ]
)

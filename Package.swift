// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocusLotrSdk",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "LocusLotrSdk", targets: ["LocusLotrSdk"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.9.0"),
        .package(url: "https://github.com/Moya/Moya", from: "15.0.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift", from: "6.6.0"),
    ],
    targets: [
        .binaryTarget(
            name: "LotrModels",
            url: "https://locus-binaries.s3.ap-south-1.amazonaws.com/LotrModels.xcframework.zip",
            checksum: "4d5f99fc92ed4a3c7ad943dc8ca8b8745c8cc7d2576e7d79df635f348e26ad7f"
        ),
        .binaryTarget(
            name: "LotrSdk",
            url: "https://locus-binaries.s3.ap-south-1.amazonaws.com/LotrSdk.xcframework.zip",
            checksum: "ddd589d66e4a4ed403c6fef05a669cac4692b6ea8d5cbe4b16058b3503de39d3"
        ),
        .target(
            name: "LocusLotrSdk",
            dependencies: [
                "LotrModels",
                "LotrSdk",
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "Moya", package: "Moya"),
                .product(name: "RxSwift", package: "RxSwift"),
            ]
        ),
    ]
)

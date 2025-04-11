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
        .package(url: "https://github.com/RxSwiftCommunity/RxCoreLocation", from: "1.5.1"),
        .package(url: "https://github.com/realm/realm-swift", exact: "10.49.1"),
    ],
    targets: [
        .binaryTarget(
            name: "LotrModels",
            url: "https://ios-sdk.locus-api.com/swiftpm/lotrModels/1.0.0/LotrModels.xcframework.zip",
            checksum: "e5b96fa5f55c18e62b9cedbe3e21517e8f8e72c90191467662f6b6c8e760c58c"
        ),
        .binaryTarget(
            name: "LotrSdk",
            url: "https://ios-sdk.locus-api.com/swiftpm/lotrSdk/1.0.0/LotrSdk.xcframework.zip",
            checksum: "b5f1c2914e5b08d3c7e6a0882860ea4d228c39b0d976c225d7a483d4b3981cbd"
        ),
        .target(
            name: "LocusLotrSdk",
            dependencies: [
                "LotrModels",
                "LotrSdk",
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "Moya", package: "Moya"),
                .product(name: "RxCoreLocation", package: "RxCoreLocation"),
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "Realm", package: "realm-swift"),
                .product(name: "RealmSwift", package: "realm-swift"),
            ]
        ),
    ]
)

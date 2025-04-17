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
    targets: [
        .binaryTarget(
            name: "LotrModels",
            url: "https://locus-binaries.s3.ap-south-1.amazonaws.com/LotrModels.xcframework.zip",
            checksum: "4d5f99fc92ed4a3c7ad943dc8ca8b8745c8cc7d2576e7d79df635f348e26ad7f"
        ),
        .binaryTarget(
            name: "LotrSdk",
            url: "https://locus-binaries.s3.ap-south-1.amazonaws.com/LotrSdk.xcframework.zip",
            checksum: "16397acd50fc0fb3ced88da4c32306bb79f204a7bf330f8ca42e85fdac454a51"
        ),
        .target(
            name: "LocusLotrSdk",
            dependencies: [
                "LotrModels",
                "LotrSdk",
            ]
        ),
    ]
)

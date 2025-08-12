// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let kustomerChatFramework = Target.binaryTarget(
  name: "KustomerChatSDK",
  url: "https://github.com/kustomer/kustomer-ios/archive/refs/tags/6.0.0.zip",
  checksum: "42f6dff1ac4e459948db375611f4f223db2a27c0c2aeb3b03e4f637f7b761089")

let package = Package(
  name: "kustomer-ios",
  platforms: [
    .iOS(.v12)
  ],
  products: [
    .library(
      name: "kustomer-ios",
      targets: ["KustomerChatSDK", "_KustomerChat"])
  ],
  targets: [
    kustomerChatFramework,
    .target(name: "_KustomerChat", path: "_KustomerChat"),
  ]
)

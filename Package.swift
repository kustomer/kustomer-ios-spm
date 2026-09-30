// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let kustomerChatFramework = Target.binaryTarget(
  name: "KustomerChatSDK",
  url: "https://github.com/kustomer/kustomer-ios/archive/refs/tags/8.2.2.zip",
  checksum: "2467b4c5517e4357573ee73748391b1d629f2c466242872e2b2414bd2b4372c1")

let package = Package(
  name: "kustomer-ios",
  platforms: [
    .iOS(.v15)
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

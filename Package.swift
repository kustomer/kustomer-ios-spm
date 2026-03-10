// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let kustomerChatFramework = Target.binaryTarget(
  name: "KustomerChatSDK",
  url: "https://github.com/kustomer/kustomer-ios/archive/refs/tags/7.1.3.zip",
  checksum: "9c70679575793ca11edbf314e28a520b1c1030f1c6e430da8ff331de2b5adb4f")

let package = Package(
  name: "kustomer-ios",
  platforms: [
    .iOS(.v14)
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

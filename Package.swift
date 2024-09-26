// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let kustomerChatFramework = Target.binaryTarget(
  name: "KustomerChatSDK",
  url: "https://github.com/kustomer/kustomer-ios/archive/refs/tags/5.0.1.zip",
  checksum: "f77d83b1b72dfb25f8e530eeea66b2a7796f629421ac40a03a030cb6bffeb8e7")

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

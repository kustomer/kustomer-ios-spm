// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let kustomerChatFramework = Target.binaryTarget(
  name: "KustomerChatSDK",
  url: "https://github.com/kustomer/kustomer-ios/archive/refs/tags/7.1.0.zip",
  checksum: "2143ee5f71a36fc4eb093bc52c5cc3dc7569ef6ccdc6c246f3f410b9d450449f")

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

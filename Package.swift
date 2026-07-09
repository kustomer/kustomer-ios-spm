// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let kustomerChatFramework = Target.binaryTarget(
  name: "KustomerChatSDK",
  url: "https://github.com/kustomer/kustomer-ios/archive/refs/tags/7.2.6.zip",
  checksum: "2a36fefee4c0c2697d09ebb4ea4a6d99019b8e5ac291a43808ee0f6040c188fe")

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

// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let kustomerChatFramework = Target.binaryTarget(
  name: "KustomerChatSDK",
  url: "https://github.com/kustomer/kustomer-ios/archive/refs/tags/7.2.4.zip",
  checksum: "9d2e464ae9cb48cd8b28463b7868bb0a3d0e2c8140f7d93ab817a4793877d3e3")

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

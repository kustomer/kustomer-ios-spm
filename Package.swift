// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let kustomerChatFramework = Target.binaryTarget(
  name: "KustomerChatSDK",
  url: "https://github.com/kustomer/kustomer-ios/archive/refs/tags/8.3.6.zip",
  checksum: "f69eacfee6abf41fecae9d54f140b49e4510dd038a3d500c7392c847fe0b7c0c")

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

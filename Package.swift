// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Cgd",
    pkgConfig: "gdlib",
    providers: [
        .brew(["gd"]),
        .apt(["libgd-dev"])
    ]
)

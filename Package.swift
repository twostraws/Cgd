// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Cgd",
    pkgConfig: "gdlib",
    providers: [
        .brew(["gd"]),
        .apt(["libgd-dev"])
    ]
)

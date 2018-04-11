// swift-tools-version:4.1
import PackageDescription

let package = Package(
    name: "iSwift",
    dependencies: [
        .package(url: "https://github.com/Zewo/ZeroMQ.git", from: "1.0.0"),
        .package(url: "https://github.com/IBM-Swift/BlueCryptor.git", from: "0.0.0"),
        .package(url: "https://github.com/DanToml/Jay.git", from: "1.0.0"),
        .package(url: "https://github.com/jatoben/CommandLine", .exact("3.0.0-pre1")),
        .package(url: "https://github.com/jensravens/interstellar.git", from: "2.0.0"),
        .package(url: "https://github.com/jpsim/SourceKitten.git", .exact("0.20.0"))
    ],
    targets: [
        .target(
            name: "iSwift",
            dependencies: [
                "ZeroMQ",
                "Cryptor",
                "Jay",
                "CommandLine",
                "Interstellar",
                "SourceKittenFramework"
            ],
            path: "Sources"
        )
    ]
)

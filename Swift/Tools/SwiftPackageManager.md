# Swift Package Manager



Swift Package Manager (SPM) is Apple’s official tool for managing dependencies and organizing Swift code into reusable packages. It is built into Swift and Xcode, making it a seamless solution for managing third-party libraries and modularizing your own projects.

* Are static as default
* Uses [Semantic Versioning](https://semver.org)
* The manifest file follow Swift's API design guidelines.

## Anatomy of a Package

The anatomy of a package consiste de tres elementos principales

* Dependencies: Los paquetes que tu usar para desarrollar tus features, cada dependencia provee una o más productos como librerías que tu Package puede usar.
* Targets: Targets are the basic building blocks of packages. Describes how to build a set of source files into ether a module or a test suite. Targets can depend on other targets of the same package and on products exported from other packages declared as dependencies.
* Products: Are executable to librares and products are assembled from the build artifacts of one or more target. Packages provide libraries to other packages by defining products

By default you dont have to declare the type of labrary explicitly. 

```
MyPackage/
|--- Package.swift // Swift Package Manifest. 
|--- Sources // Contains folders for separate targets in the package.
|    |--- TargetOneFolder/
|    |--- TargetTwoFolder/
|--- Tests 
|    |--- TestSuiteOne // One folder per Suit
|         |--- MyPackageTests.swift
```

```swift
// swift-tools-version: 5.0
import PackageDescription

let package = Package(
	name: "MyPackage",
  platforms: [
    .macOS(.v10_15), .iOS(.v13)
  ],
	products: [
		.library(name: "MyPackage"
						 targets: ["MyPackage"]),
    .executable(name: "ExecutableName", 
                targets: ["TargetTwoFolder"]), // For command line use
	],
  dependencies: [
		.package(url: "https://github.com/path/to/the/project.git", from: "1.0.0"),
    .package(url: "https://github.com/path/to/the/project.git", .upToNextMajor(from: "1.0.0")),
    .package(url: "https://github.com/path/to/the/project.git", .upToNextMinor(from: "1.0.0")),
		.package(url: "https://github.com/path/to/the/project.git", .exact("1.0.0"))
		.package(url: "https://github.com/path/to/the/project.git", .branch("master"))
		.package(url: "https://github.com/path/to/the/project.git", .revision("85cfe06"))
  ],
	targets: [
		.target(name: "TargetOneFolder"),
		.target(name: "TargetTwoFolder",
					  dependencies: ["TargetOneFolder"]),
    .binaryTarget(name: "BinaryTargetName", path: "./path/to/the/framework.xcframework.zip"),
    .testTarget(name: "TestSuiteOne",
    					  dependencies: ["TargetTwoFolder"])
	],
	swiftLanguageVersions: [.v4, .v4_2, .v4]
)
```

## Semantic Versionsing

For the `1.2.4` (MAJOR.MINOR.PATCH)version.

* `1` (the major version) changes whenever there are breaking changes to the API that cause the clients to have to be modified like:
  * Rename a method
  * Remove a method
  * Making semanticalli meaningful change
* `2` (the minor version) will be incremented whe functionality is added in a way that doesn't break existing clients like
  * Adding methods
* `4` (the patch version) will be incremented for bug fixes

## Package.resolved

Package.resolved is a file that Swift Package Manager (SPM) generates inside the .swiftpm directory of your project. It records the exact versions of all dependencies used in the project.

1. **Ensures Dependency Consistency** 
   1. When multiple developers work on a project, Package.resolved guarantees that everyone uses the **same versions** of dependencies.
   2. Prevents unexpected changes due to automatic version resolution.

2. **Locks Dependencies for CI/CD**
   1.  Continuous Integration (CI) servers and deployment environments use this file to install the correct versions of dependencies.
   2. Prevents breaking builds due to unexpected dependency updates.

3. **Avoids Accidental Updates**
   1. Without this file, SPM would resolve dependencies based only on version constraints in Package.swift, which can lead to unexpected updates when new versions are released.

## Platform Availability

* macOS
* iOS
* tvOS
* watchOS
* Linux

```swift
#if os(Linux)
// Code specific to Linux
#endif

#if canImport(Network)
// Code specific to platforms where Network framework is available
#endif
```



## Commands

SwiftPM consists of four command line tools

* `swift package`: Run various non-build operations on the Package.
  * `init`
    * `--type`
      * `executable`
  * `update`
* `swift build`: Build your package
* `swift run`: Run yout package's executable products.
* `swift test`: Run tests.
  * `--parallel`
  * `--filter`
    * `ByteBufferTest`
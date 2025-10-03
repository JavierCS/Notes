# Xcode

## Xcode Build Command

### XCFramework Generation

To generate an `xcframework` you can use the `xcodebuild` command, first you have to create an archive for iOS simulator:

```sh
xcodebuild archive \
-scheme YourSchemeName \
-destination "generic/platform=iOS Simulator" \
-archivePath ~/Your/Archive/Destination/Folder/Simulator \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES
```

Now yo have to create an archive for iOS Device:

```sh
xcodebuild archive \
-scheme YourSchemeName \
-destination "generic/platform=iOS" \
-archivePath ~/Your/Archive/Destination/Folder/Device \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES
```

Finaly you must combine both archives to get your xcframework:

```sh
xcodebuild -create-xcframework \       
-framework ~/Your/Archive/Destination/Folder/Simulator.xcarchive/Products/Library/Frameworks/YourSchemeName.framework \
-framework ~/Your/Archive/Destination/Folder/Device.xcarchive/Products/Library/Frameworks/YourSchemeName.framework \
-output ~/Your/Archive/Destination/Folder/YourSchemeName.xcframework
```
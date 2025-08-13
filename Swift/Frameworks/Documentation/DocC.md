# DocC (Documentation Compiler)

DocC (Documentation Compiler) is Apple's documentation tool designed specifically for Swift and Objective-C projects in Xcode. It helps developers create rich, interactive documentation that's tightly integrated with their code.

## Key Features of DocC

1. **Markdown-based documentation**: Write docs using a Swift-flavored Markdown syntax
2. **Code integration**: Automatically links documentation to your actual code
3. **Interactive tutorials**: Create step-by-step guides with executable code
4. **Rich formatting**: Supports images, videos, diagrams, and API reference
5. **Xcode integration**: Built directly into the development environment

## Why DocC is Important for Swift Development

1. **Better Code Understanding**:
   - Provides clear explanations of your API's purpose and usage
   - Helps new team members onboard faster
2. **Improved Maintenance**:
   - Documentation stays in sync with code changes
   - Reduces "what does this do?" questions in code reviews
3. **Enhanced Discoverability**:
   - Documentation appears in Xcode's Quick Help (Option-click)
   - Supports symbol searching in documentation
4. **Professional Deliverables**:
   - Generates beautiful web-based documentation
   - Can be hosted on your website or distributed with frameworks
5. **Community Contribution**:
   - Makes your open source projects more accessible
   - Encourages better adoption of your libraries

## Syntax

```swift
/// Symbol's summary
///
/// Symbol's discussion
///
/// - Parameters:
///     - parameterOne: First Parameter
///     - parameterTwo: Second Parameter
/// - Returns: Return Value
/// - Throws: `Error.Type`
///
/// ```swift
/// // some example code
/// ```
/// ``OtherProjectSymbol`` or ``OtherSymbol/OtherSymbolChild``
public struct SomeSymbol {
  
}
```

## Documentation Archive

## Commands

`xcodebuild docbuild`

## References

1. [Meet DocC Documentation in Xcode](https://developer.apple.com/videos/play/wwdc2021/10166)
2. [Elevate your DocC documentation in Xcode]()
3. [Build interactive tutorials using DocC]()
4. [Host and automate your DocC documentation]()
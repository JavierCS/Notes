# Signposts

Signposts in Swift are a performance debugging tool provided by Apple’s `os_log` framework. They allow developers to mark specific points or regions in their code for performance analysis using Instruments (such as the Time Profiler or System Trace).

```swift
static let pointsOfInterest = OSLog(subsystem: "com.some.domain", category: .pointsOfInterest)

func someFunction() {
    os_signpost(.begin, log: ThisController.pointsOfInterest, name: "someFunction")
    defer {
        os_signpost(.end, log: ThisController.pointsOfInterest, name: "someFunction")
    }
}
```
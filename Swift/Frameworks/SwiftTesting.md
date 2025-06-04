

# Swift Testing

**Swift Testing** is Apple’s modern testing framework introduced in **Swift 5.9** as a replacement for **XCTest**. It provides a more **declarative, structured, and type-safe** approach to writing unit tests, making it easier to understand and maintain.

**Key Features of Swift Testing**

​	1.	**Declarative Syntax** – Uses a Swift-native approach, making test definitions more readable and expressive.

​	2.	**Structured Test Plans** – Organizes tests in a hierarchical structure.

​	3.	**Asynchronous Testing** – Improved support for async/await, making it easier to test async operations.

​	4.	**Parameterized Testing** – Enables running the same test with different inputs.

​	5.	**Better Error Reporting** – More informative failure messages and diagnostics.

**Why It’s Important for Every Project**

​	1.	**Ensures Code Quality** – Helps catch bugs early, reducing the risk of regressions.

​	2.	**Improves Maintainability** – Well-tested code is easier to refactor and extend.

​	3.	**Facilitates CI/CD** – Automates testing in workflows like GitHub Actions or Xcode Cloud.

​	4.	**Enhances Developer Confidence** – Enables developers to modify code without fear of breaking functionality.

By adopting **Swift Testing**, teams can write more reliable, maintainable, and efficient test cases, leading to higher software quality in Swift projects. 🚀

### Comparison between Swift Testing and XCTest

#### Test Functions

|                    |                   XCTest                    |                        Swift Testing                         |
| :----------------: | :-----------------------------------------: | :----------------------------------------------------------: |
|     Discovery      |           Name begins with "test"           |                           `@Test`                            |
|  Supported types   |              Instance methods               | Instance methods<br />Static/class methods<br />Global functions |
|   Support traits   |                     No                      |                             Yes                              |
| Parallel execution | Multi process<br />macOS and Simulator only |               In-process<br />Supports devices               |

#### Expectations

|                       XCTest                       |              Swift Testing               |
| :------------------------------------------------: | :--------------------------------------: |
|   `XCTAssert`, `XCTAssertTrue`, `XCTAssertFalse`   |       `#expect(x)`, `#expect(!x)`        |
|         `XCTAssertNil`, `XCTAssertNotNil`          | `#expect(x == nil)`, `#expect(x != nil)` |
|       `XCTAssertEqual`, `XCTAssertNotEqual`        |   `#expect(x == y)`, `#expect(x != y)`   |
|   `XCTAssertIdentical`, `XCTAssertNotIdentical`    |  `#expect(x === y)`, `#expect(x !== y)`  |
| `XCTAssertGreaterThan`, `XCTAssertLessThanOrEqual` |   `#expect(x > y)`, `#expect(x <= y)`    |
| `XCTAssertGreaterThanOrEqual`, `XCTAssertLessThan` |   `#expect(x >= y)`, `#expect(x <  y)`   |

#### Fails

```swift
// XCTest
func testExample() {
	self.continueAfterFailure = false
	XCTAssertEqual(x, y)
  XCTAssertTrue(z.isEnabled)
}

// Swift Testing
@Test func example() throws {
	try #require(x == y)
  #expect(z.isEnabled)
}
```

#### Suites

|                  |                            XCTest                            |           Swift Testing            |
| ---------------- | :----------------------------------------------------------: | :--------------------------------: |
| Types            |                           `class`                            | `struct`<br />`actor`<br />`class` |
| Discovery        |                    Subclass `XCTestCase`                     |              `@Suite`              |
| Before each test | `setUp()`<br />`setUpWithError() throws`<br />`setUp() async throws` |       `init() async throws`        |
| After each test  | `tearDown() async throws`<br />`tearDownWithError() throws`<br />`tearDown()` |              `deinit`              |
| Sub-groups       |                         Unsupported                          |          Via type nesting          |



## Test functions

Test functions are ordinary swift functions with a `@Test` attribute. 

* Annotated using `@Test`.
* Can be global functions or methods in a type.
* May be `async` or `throws`.
* May be global actor-isolated (such as `@MainActor`).

```swift
import Testing

@Test func functionName() {
	// Make here your validations
}
```

> :bulb: **Tip**: Do not forget using `@testable` for your imports due to the default access level for your code is Internal so you'll need it to test your code.

You can also provide a display name in the `@Test` attribute.

```swift
@Test("Here you can set your custom display name") func test() {
	// Test Body
}
```

Soak two or more tests inside a `struct` to create a group.

```swift
import Testing
@testable import YourProyectOrFrameworkName

struct SomeTopicTests {
	@Test func testOne() {
		// Test Body
	}
	
	@Test func testTwo() {
		// Test Body
	}
}
```

> :bulb: **Tip**: This group will be reflected in the Test Navigatior.

> :bulb: **Tip**: You can run your test target using `cmd + u` in your xcode project or the `swift test` command in terminal

## Macros

### Expect

The `#expect()` macro performs an expectation to validate that an expected condition is `true`

* Accepts ordirary expressions and operators.
* Captures source code and subexpression values upon failure.

```swift
// Expectation examples

#expect(1 == 2) // Expectation failed: 1 == 2

#expect(user.name == "Alice") // Expectation failed: (user.name -> "Sarah") == "Alice"

#expect(!array.isEmpty) // Expectation failed: !((array -> []).isEmpty -> true)

#expect(numbers.contains(4)) // Expectation failed: (numbers -> [1,2,3]).contains(4)
```

### Require

Use `try #require(...)` to stop the test if the condition is `false`.

```swift
try #require(session.isValid()) // Expectation failed: (session -> Session(id: 45678)).isValid -> false
session.invalidate() // not extecuted 
```

This macro can also unwrap optional values, and stopt test when `nil`.

```swift
let method = try #require(paymentMethods.first) // Expectation failed: (paymentMethods -> []).first -> nil
#expect(method.isDefault) // not executed
```

## Traits

The third building block.

* Add descriptive information about a test.
* Customize whether a test runs.
* Modify how a test behaves.

```swift
@Test("Custom name") // Customize the display name of a test.
@Test(.bug("example.com/issues/99999", "Title")) // Reference an issue from a bug tracker.
@Test(.tags(.critical)) // Add a custom tag to a test
@Test(.enabled(if: Server.isOnline)) // Specify a runtime condition for a test
@Test(.disabled("Currently broken")) // Unconditionally disable a test
@Test(...) @available(macOS 15, *) // Limit a test to certain OS versions
@Test(.timeLimit(.minutes(3))) // Set a maximum time limit for a test
@Suite(.serialized) // Run the tests in a suite one at time, without parallelization
```

## Common Workflows

### Runtime Conditions

Specify a runtime-evaluated condition for a test using `.enabled(if: ...).    

```swift
@Test(.enabled(if: AppFeatures.isCommentingEnabled))
func test() {
	// ...
}
```

> :memo: **​Note**: If the condition is `false` the test will be marked as  skipped.

Also you can unconditionaly disable a test using `.disabled(...)`

```swift
@Test(.disabled("Due to a known crash"))
func example() {
	// ...
}

@Test(.disabled("Due to a known crash"),
     .bug("example.org/bugs/1234", "Program crashes at <symbol>"))
func exampleTwo() {
  // ...
}
```

> :memo: **Note**: Disabling a test is preferable over other techniques, like commenting out the test function.

Use `@available(...)` to specify an OS availability condition.

```swift
@Test func hasRuntimeVersionCheck() {
  guard #available(macOS 15, *) else { return } // Avoid this
  // ...
}

@Test
@available(macOS 15, *) // Use this instead
func usesNewAPIs() {
	// ...
}
```

> :warning: **Warning**: Use the `@available(...)` instead of checking at runtime using `#available(...)`

### Parameterized Testing

You can transform multiple repetitive tests into one prameterized test.

* View details of each argument in results
* Re-run individual arguments to debug
* Run arguments in parallel

```swift
@Test func testForCaseA() {
	#expect(someExpectation(parameter: a))
}

@Test func testForCaseB() {
	#expect(someExpectation(parameter: b))
}

@Test func testForCaseC() {
	#expect(someExpectation(parameter: c))
}

@Test(
  "Some display name",
	arguments: [
		a,
		b,
		c
	]
)
func test(parameter: ABCType) {
	#expect(someExpectation(parameter: parameter))
}
```

## Suites

Group related test functions and suites.

* Annotated using `@Suite`
  * Implicit for types containing `@Test` functions or suites
* May have stored instance properties.
* Can use `init` and `deinit` for set-up and tear-down logic, respectively.
* Initialized once per instance `@Test` method to avoid unintentional state sharing.

> :memo: **Note**: Any type wich contains `@Test` functions or `@Suites` is considered a `@Suite` itself implicitly.

## Tags

Associate tests wich have things in common to:

* Run all tests with a specific tag
* Filter by tag or see insights in Test Report

Test tags are shared among test anywhere in a project and can be local to a project or shared.

You can also use tags in order to group tests in different files or suites.

```swift
extension Tag {
  @Tag static var someTag: Self
}

struct TestsForTopicOne() {
	@Test("Some test description", .tags(.someTag)) func testOne() {
		// ...
	}
  
  @Test("Some test description", .tags(.someTag)) func testTwo() {
		// ...
	}
}

struct OtherTopicTests() {
  @Test("Some test description", .tags(.someTag)) func testThree() {
		// ...
	}
}
```

if you want to tag all the functions inside a `@Suite` you can add `.tags(...)` for that `@Suite`.

```swift
@Suite(.tags(.yourTag))
struct SomeSuite {
  @Test("Some test description") func testOne() {
		// ...
	}
  
  @Test("Some test description") func testTwo() {
		// ...
	}
}
```

> :warning: **Warning**: Prefer tags over test names when including/excluding in a Test Plan
>
> Use the mos appropriate trait type
>
> * Example: `.enabled(if: ...)` instead `.tags(...)` to represent a condition



## Migrating from XCTest

### Recommended practices

* Chare a single unit test target
  * `Swif Testing` tests can coexist with `XCTests`
* Consolidate similar `XCTests` into a parameterized test
* Migrate each `XCTest` class with only one test method to a global `@Test` function
* Remove redundant "test" prefix from method names
* Continue using XCTest for tests with:
  * Use UI automation APIs (such as `XCUIApplication`)
  * Use performance testing APIs (such as `XCTMetric`)
  * Can only be written in Objective-C
* Avoid calling `XCTAssert(...)` from Swift Testing tests, or `#expect(...)` from `XCTests

You can read more information about [here](https://developer.apple.com/documentation/testing/migratingfromxctest).

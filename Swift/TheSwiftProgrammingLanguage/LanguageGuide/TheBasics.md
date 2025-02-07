# The Swift Programming Language



## The Basics

Swift is a *type-safe* language, witch means the language helps you to be clear about the types of values your code can work with, for example:

If part of your code requires a `String`, type safety prevents you from pasing it an `Int` by mistake.

---

### Constants and Variables

#### Declaring Constatns and Variables

Both must be declared before they're used. You delcare constants with the `let` keyword and variables with the `var` keyword.

```swift
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
```

*Note: Use `var` only for storing values that change.*

When you declare a constant or a variable, you can give it a value as part of that declaration.

```swift
var environment = "development"
let maximumNumberOfLoginAttempts: Int
// maximumNumberOfLoginAttempts has no value yet.


if environment == "development" {
    maximumNumberOfLoginAttempts = 100
} else {
    maximumNumberOfLoginAttempts = 10
}
// Now maximumNumberOfLoginAttempts has a value, and can be read.
```

You can declare multiple constants or multiple variables on a single line, separated by commas:

```swift
var x = 0.0, y = 0.0, z = 0.0
```

#### Type Annotations

You can provide a *type annotation* when you declare a constant or variable to be clear about the kind of values the constant or variable can store.

```swift
var welcomeMessage: String
```

So the `welcomeMessage` var can change to a `String` value.

```swift
wellcomeMessage = "Hello"
```

You can change the value of an existing variable to another value of a compatible type.

```swift
wellcomeMessage = "Bonjour!"
```

You can define multiple related variables of the same type on a single line.

```swift
var red, green, blue: Double
```

#### Naming Constants and Variables

Constant and variable names can contain almos any character, including Unicode characters:

```swift
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
```

But these names can't contain whitespace characters, mathematical symbols, arrows, private-use Unicode scalar values, or line- and bo-drawing characters.

#### Printing Constants and Variables

You can print the current value of a constant or variable with the `print(_:separator:terminator:)` function.

```swift
print(wellcomeMessage)
// Prints Bonjour!
print("Hello", "Swift", "World", separator: " - ", terminator: " 🌍\n")
// Prints Hello - Swift - World 🌍
```

Also you can use *string interpolation* to include values inside a `String`

```swift
print("The current value of friendlyWelcome is \(wellcomeMessage)")
// Prints "The current value of friendlyWelcome is Bonjour!"
```

---

### Comments

Use comments to include nonexecutable text in your code, as a note or reminder to yourself.

```swift
// This is a comment.

/* This is also a comment
but is written over multiple lines. */


```

---

### Semicolons

Unlike many other languages, Swift doesn't require you to write a semicolon after each statement in your code, but semicolons are required if you want to write multiple separate statements on a single line.

```swift
let cat = "🐱"; print(cat)
// Prints "🐱"
```

---

### Integers

*Integers* are whole numbers with no factional component. Integers are either *signed* (positive, zero, or negative) or *unsigned* (positive or zero).

#### Integer Bounds

You can access the minimum and maximum values of each integer type with its `min` and `max` properties.

```swift
let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8
```

#### Int

Swift provides an integer type, `Int`, which has the same size as the current platform's native word size:

- On a 32-bit platform, `Int` is the same size as `Int32`.
- On a 64-bit platform, `Int` is the same size as `Int64`.

---

### Floating-Point Numbers

*Floating-point numbers* are numbers with fractional component and can represent a much widger range of values than integer types, and can store numbers that are much larger or smaller than can be stored in an `Int`.

*  `Double` can represents a 64-bit floating-point number (`Double` has a precision of at least 15 decimal digits).
* `Float` represents a 32-bit floating-point number (`Float` has a precision of 6 decimal digits).

---

### Type Safety and Type Inference

Swift is a *type-safe* language. So if part of your core requries a `String`, you can't pass it an `Int` by mistake because swift performs *type checks* when compiling your code and flags any mismatched types as errors.

Swift uses *type inference* to work out the apropiate type. Type inference enables a compiler to deduce the type of a particular expression automatically when it compiles your code by examining the values you provide.

Type inference is particulary useful when you declare a constant or variable with an initial value.

```swift
let meaningOfLife = 42
// meaningOfLife is inferred to be of type Int

let pi = 3.14159
// pi is inferred to be of type Double

let anotherPi = 3 + 0.14159
// anotherPi is also inferred to be of type Double
```

---

### Numeric Literals

Integer literals can be written as:

* A *decimal* number, with no prefix.
* A *binary* number, with a `0b` prefix.
* A *octal* number, with a `0o` prefix.
* A *hexadecimal* number, with a `0x` prefix.

```swift
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation
```

Floating-point literals can be:

* *Decimal* with no prefix.
* *Hexadecimal* with a `0x` prefix.

```swift
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
```

Numeric literals can contain extra formatting to make them easier to read.

```swift
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
```

---

### Numeric Type Conversion

#### Integer Conversion

The range of numbers can be stored in an integer constant or variable is different for each numeric type. For example An `Int8` can store numbers between -128 and 127 while `UInt8` can store numbers between 0 and 255.

```swift
let cannotBeNegative: UInt8 = -1
// UInt8 can't store negative numbers, and so this will report an error
let tooBig: Int8 = Int8.max + 1
// Int8 can't store a number larger than its maximum value,
// and so this will also report an error
```

To convert one specific number type to another, you initialize a new number of the desired type with the exsisting value.

```swift
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
```

#### Integer and Floating-Point Conversion

Conversions between integer and floating-point numeric types must be made explicit:

```swift
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
// pi equals 3.14159, and is inferred to be of type Double
```

Floating-point to integer conversion must also be made explicit.

```swift
let integerPi = Int(pi)
// integerPi equals 3, and is inferred to be of type Int
```

---

### Type Aliases

*Type aliases* define an alternative name for an existing type. You define type aliases with the `typealias` keyword.

```swift
typealias AudioSample = UInt16
```

Once you define a type alias, you can use the alias anywhere you might use the original name.

```swift
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0
```

---

### Booleans

Swift has a basic *Boolean* type called `Bool`. Boolean values are referred to as *logical*, because they only ever be `true` or `false`.

```swift
let orangesAreOrange = true
let turnipsAreDelicious = false
```

Boolean values are particulary useful when you work with conditional statements such as the `if` statement.

```swift
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}
// Prints "Eww, turnips are horrible."
```

---

### Tuples

*Tuples* group multiple values into a single compud value.

```swift
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")
```

You can create tuples for any permutation of types, and then can contain as many different types as you like.

You can *decompose* a tuple's content into separate constants or variables.

```swift
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"
```

If you only need some of the tuple's value, ignore parts of the tuple with an underscore (_) when you decompose the tuple.

```swift
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// Prints "The status code is 404"
```

Alternatively, access the individual element values in a tuple using index numbers starting at zero.

```swift
print("The status code is \(http404Error.0)")
// Prints "The status code is 404"
print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found"
```

You can name the individual elements in a tuple when the tuple is defined.

```swift
let http200Status = (statusCode: 200, description: "OK")

print("The status code is \(http200Status.statusCode)")
// Prints "The status code is 200"
print("The status message is \(http200Status.description)")
// Prints "The status message is OK"
```

---

### Optionals

You use *optionals* in situations where a value may be absent. An optional represents two possibilities: 

* Either there *is* a value of a specified type and you can unwrap the optional to access de value.
* There *isn't* a value at all.

```swift
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// The type of convertedNumber is "optional Int" and unwrapped is equal to 123
```

#### nil

You set an optional variable to a valueless statye by assigning it the special value `nil`.

```swift
var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value
```

If you define an optional variable without providing a default value, the variable is automatically set to `nil`.

```swift
var surveyAnswer: String?
// surveyAnswer is automatically set to nil
```

You can use an `if` statement to find out whether an optional contains a value.

```swift
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)


if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
// Prints "convertedNumber contains some integer value."
```

When you access an optional value, your code always handles both the `nil` and `non-nil` case. There are several things you can do when a value is missing:

* Skip the code that operates on the value when it's `nil`.
* Popagate the nil value by regurnin `nil` or using the `?` operator.
* Provide a fallback value, using the `??` operator.
* Stop program execution, using the `!` operator.

#### Optional Binding

You use optional binding to find out wheter an optional contains a value, and if so, to make that value available as a temporary constant or variable. Optional binding can be used with `if`, `guard`, and `while` statements.

```swift
if let <#constantName#> = <#someOptional#> {
   <#statements#>
}

guard let <#constantName#> = <#someOptional#> else {
    <#handle nil case (e.g., return, throw, fatalError)#>
}
<#statements#>  // This runs only if optional is non-nil

while let <#constantName#> = <#someOptional#> {
   <#statements#>  // Loops while optional is non-nil
}
```

If you don't need to refer to the original, optional constant or variable after accessing the value it contains, you can use the same name for the new constant or variable.

```swift
let myNumber = Int(possibleNumber)
// Here, myNumber is an optional integer
if let myNumber = myNumber {
    // Here, myNumber is a non-optional integer
    print("My number is \(myNumber)")
}
// Prints "My number is 123"
```

Because this kind of code is so common, you can use a shorter spelling to unwrap an optional value just by writing the name of the constant or variable that you're unwrapping.

```swift
if let myNumber {
    print("My number is \(myNumber)")
}
// Prints "My number is 123"
```

You can include many optional bindings and Boolean conditions in a single `if`.

```swift
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"


if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// Prints "4 < 42 < 100"
```

#### Providing a Fallback Value

Another way to handle a missing value is to supply a default value using the *nil-coalescing* operator (`??`).

```swift
let name: String? = nil
let greeting = "Hello, " + (name ?? "friend") + "!"
print(greeting)
// Prints "Hello, friend!"
```

### Forece Unwrapping

When `nil` represents an unrecoverable failure such as a programmer error o corrupted state, you can acces the underlying value by addin an exclamation mark (`!`) to the end of the optional's name.

The `!` is a shorter spelling of `fatalError(_:file:line:)`.

```swift
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

let number = convertedNumber!

guard let number = convertedNumber else {
    fatalError("The number was invalid")
}
```

#### Implicitly Unwrapped Optionals 

Sometimes it's clear from a program's structure that an optional will always have a value, after that value is first set. In these cases, it's useful to remove the need to check and unwrap the optional's value every time it's accessed, because it can safely assumed to have a value all of the time.

These kinds of optionals are defined as *implicitly unwrapped optionals*.You write an implicitly unwrapped optional by placing an exclamation point (`String!`) rather than a question mark (`String?`) after the type that you want to make optional.  

```swift
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // Requires explicit unwrapping

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // Unwrapped automatically
```

You can think of an implicitly unwrapped optional as giving permission for the optional to be force-unwrapped if needed.

```swift
let optionalString = assumedString
// The type of optionalString is "String?" and assumedString isn't force-unwrapped.
```

If an implicitly unwrapped optional is `nil` and you try to access its wrapped value, you'll trigger a runtime error. So you can check whether an implicitly unwrapped optional is `nil` the same way you check a normal optiona..

```swift
if assumedString != nil {
    print(assumedString!)
}
// Prints "An implicitly unwrapped optional string."
```

You can also use an implicitly unwrapped optional with optional binding.

```swift
if let definiteString = assumedString {
    print(definiteString)
}
// Prints "An implicitly unwrapped optional string."
```
### Error Handling

You use *error handling* to respond to error conditions your program may encounter during execution.

When a function encounters an error condition, it `throws` an error so that function's caller must `catch` that error.

```swift
func canThrowAnError() throws {
    // this function may or may not throw an error
}

do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}
```

## Key Points

* Avoid using *type annotations* when the type is obvios like when you are defining a `String` or `Int` in order to avoid make the code  verbose and redundant. But using *type annotations* can help you to:

- Add clarity and readability.
- Avoid ambiguity.
- Get performance optimization.
- Get better protocol conformance and generic implementation.

- If you wan to concatenate two strings it is better to use *string interpolation* due to it is type safety, faster and more optimized than using `+` because the swift compiler precomputes the interpolated string when possible while `+` creates multiple temporary `String` instances.

- Use `Double` if you need precition and `Float` otherwise.

- Swift always chooses `Double` rather than `Float` when inferring the type of floating-point numbers.

- Use `Int` type for all general-purpose integer constans and variables even if they're known to be nonnegative. Using the default integer type in everydaty situations means that integer constants and variables ar immediately interoperable in your code and will match the inferred type for integer literal values.

- Floating-point values are always truncated when used to initialize new integer values. This means that 4.75 becomes 4, and -3.9 becomes -3.

- Swift's type safety prevents non-Boolean values from being substituded for `Bool` so

  ```swift
  let i = 1
  if i {
      // this example will not compile, and will report an error
  }
  ```

  and

  ```swift
  let i = 1
  if i == 1 {
      // this example will compile successfully
  }
  ```

* You must use optional binding for `Bool?` values if you don't want to treat `nil` as `false`.

* Prefer use an `Structure` over a `Tuple` with more than two parameters for better readability and maintainability.

* In Objective-C, `nil` is a pointer to a nonexisten object, but in Swift, an `Optional` is defined by a generic enum.

  ```swift
  enum Optional<T> {
    case .none
    case .some(T)
  }
  ```

  So you can do 

  ```swift
  let enumNilDefinition: Optional<Int> = .none
  let enumSomeDefinition: Optional<Int> = .some(10)
  let optionalNil: Int? = nil
  let optionalSome: Int? = 10
  
  print(enumNilDefinition == optionalNil)     // Prints true
  print(enumSomeDefinition == optionalSome)   // Prints true
  print(enumNilDefinition == nil)             // Prints true
  print(enumSomeDefinition == 10)             // Prints true
  print(optionalNil == nil)                   // Prints true
  print(optionalSome == 10)                   // Prints true
  ```

* You can't accidentally treat an optional as if it were non-optional because this mistake produces an error at compile time.


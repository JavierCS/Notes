# The Swift Programming Language

## Basic Operators

An *operator* is a special symbol or phrase that you can use to check, change, or combine values.

### Terminology

* *Unary* operatos operate on a single target.
  * *Prefix Unary* operatos such as `-a`, `!a`.
  * *Postfix Unary* operatos such as `c!`.
* *Binary* operators operate on two targets such as `2 + 3`.
* *Ternary* operatos operate on three targets such as `a ? b : c`.

### Assignment Operator

The *assignment operator initializes or updates values.

```swift
let b = 10
var a = 5
a = b

let (x,y) = (1,2)
```

### Arithmetic Operatos

Swift supports the four standard *arithmetic operators* for all number types:

* Addition (`+`)
* Substraction (`-`)
* Multiplication (`*`)
* Division (`/`)

```swift
1 + 2   // Equals 3
5 - 3   // Equals 2
2 * 3   // Equals 6
10.0 / 2.5  //Equals 4
"Hello, " + "World" // Equals "Hello, World"
```

#### Remainder operator (a % b)

The *reminder operator* (`a % b`) works out how many multiples of `b` will fit inside `a` and returns the value that's left over (the *reminder*).

The reminder operator is also wnown as a *modulo operator* in other languages.

```swift
9 % 4   // Equals 1 a = (a = (b * someMultiplier) + remainder)
-9 % 4  // Equals -1
```

#### Unary Minus Operator

```swift
let three = 3
let minusThree = -three // Equals -3
let plusThree = -minusThree // Equals 3 or "minus minus three"
```

#### Unary Plus Operator

```swift
var minusSix = -6
let alsoMinusSix = +minusSix    // Also equals -6
```

### Compound Assignment Operators

```swift
a = 1
a += 2  // a is now equal to 3 (a = a + 2)
```

### Comparison Operatos

Swift supports the following comparison operators:

* Equal to (`a == b`)
* Not equal to (`a != b`)
* Greater than (`a > b`)
* Less than (`a < b`)
* Greater than or equal (`a >= b`)
* Less than or equal (`a <= b`)

```swift
1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 is not equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 is not less than or equal to 1

(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" are not compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"

("blue", -1) < ("purple", 1)        // OK, evaluates to true
//("blue", false) < ("purple", true)  // Error because < can't compare Boolean values
```

Comparison operators are often used in conditional statements.

```swift
let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
// Prints "hello, world", because name is indeed equal to "world".
```

### Ternary Conditional Operator

The *ternary conditional operator* is a shortcut for evaluating one of two expressions. 

```swift
if question {
    answer1
} else {
    answer2
}

question ? answer1 : answer2

let contentHeight = 40
let hasHeader = true
var rowHeight: Int!

if hasHeader {
    rowHeight = contentHeight + 50
} else {
    rowHeight = contentHeight + 20
}
// rowHeight is equal to 90

rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90
```

### Nil-CoalescingOperator (a ?? b)

The *nil-coalescing operator `a ?? b` unwraps an optional `a` if it contains a value, or returns a default value `b` if `a` is `nil`.

```swift
a != nil ? a! : b
```

```swift
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse: String 

colorNameToUse = userDefinedColorName != nil ? userDefinedColorName! : defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"

colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
```

### Range Operators

Swift includes several *range operatos*.

#### Closed Range Operator (a...b)
Defines a range that runs from a to b, and include the values a and b.

```swift
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
```

#### Half-Open Range Operator (a..<b)

Defines a range that runs from a to b, but doesn't include b.

```swift
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack
```

#### One-Sided Ranges

The closed range operator has an alternative form for ranges thath continue as far as possible in one direction

```swift
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian

for name in names[..<2] {
    print(name)
}
// Anna
// Alex

let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true
```

### Logical Operators

*Logical operators* modify or combine Boolean logic values `true` and `false`. Swift supports three standar logical operators.

* Logical NOT (`!a`)
* Logical AND (`a && b`)
* Logical OR (`a || b`)

#### Logical NOT Operator

The *logical NOT operator* (`!a`) inverts a Boolean value so `true` becomes `false` and `false` becomes `true`.

```swift
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"
```

#### Logical AND Operator (a && b)

The *logical AND operator* (`a && b`) creates logical expressions where both values must be `true` for the overall expression to also be `true`.

```swift
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"
```

#### Logical OR Operator (a || b)

The *logical OR operator* (`a || b`) is an infix operator made from two adjacent pipe characters. You use it to create logical expressins wich onlye one of the two values has to be `true` for the overall expression to be `true`.

```swift
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
```
#### Combining Logical Operators

You can combine multiple logical operatos to create longer compund expressions.

```swift
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
```

#### Explicit Parentheses

It's sometimes useful to include parentheses when they're not strictly needed, to make the intention of a complex expression easier to read.

```swift
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
```

## Key Points

* Swift arithmetic operators don't allow values to overflow by default.
* The compound assignment operators don't return a value so you can't
    ```swift
    let b = a += 2
    ```
* Swift standar library includes tuple comparison operators for tuples with fewer than seven elements.
* The Swift logical operators `&&` and `||` are left-associative, meaning that compound expressions with multiple logical operators evaluate the leftmost subexpression first.
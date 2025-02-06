# The Swift Programming Language

## Basic Operators

### Assignment Operator

```swift
let b = 10
var a = 5
a = b

let (x,y) = (1,2)
```

### Arithmetic Operatos

```swift
1 + 2   // Equals 3
5 - 3   // Equals 2
2 * 3   // Equals 6
10.0 / 2.5  //Equals 4
"Hello, " + "World" // Equals "Hello, World"
```

### Remainder operator (a % b)

```swift
9 % 4   // Equals 1 a = (a = (b * someMultiplier) + remainder)
-9 % 4  // Equals -1
```

### Unary Minus Operator

```swift
let three = 3
let minusThree = -three // Equals -3
let plusThree = -minusThree // Equals 3 or "minus minus three"
```

### Unary Plus Operator

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

### Ternary Conditional Operator (question ? answer1 : answer2)

```swift
//if question {
//    answer1
//} else {
//    answer2
//}

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90
```

### Nil-CoalescingOperator (a ?? b)

```swift
//a != nil ? a! : b

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
```

### Range Operators

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

#### Logical NOT Operator (!a)

```swift
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"
```

#### Logical AND Operator (a && b)

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

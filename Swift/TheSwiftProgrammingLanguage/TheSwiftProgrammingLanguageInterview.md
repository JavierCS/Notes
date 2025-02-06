# Swift Basics - Interview Questions and Answers

This document contains interview questions and answers based on the "The Basics" section of the Swift documentation. The source material can be found [here](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics).

---

## 1. **What are the basic data types in Swift?**
   - **Answer:**  
     Swift provides several basic data types, including:
     - Integers: `Int`, `Int8`, `Int16`, `Int32`, `Int64`
     - Unsigned Integers: `UInt`, `UInt8`, `UInt16`, `UInt32`, `UInt64`
     - Floating-Point Numbers: `Float`, `Double`
     - Boolean: `Bool`
     - Strings: `String`
     - Characters: `Character`

---

## 2. **What is type safety in Swift?**
   - **Answer:**  
     Swift is a type-safe language, meaning it ensures that variables are always assigned values of the correct type. For example, you cannot assign a `String` to a variable declared as an `Int`. This helps catch errors during compilation.

---

## 3. **What is type inference in Swift?**
   - **Answer:**  
     Type inference allows Swift to automatically deduce the type of a variable or constant based on the value assigned to it. For example:
     ```swift
     let age = 25 // Swift infers `age` as `Int`
     let name = "Alice" // Swift infers `name` as `String`
     ```

---

## 4. **What is the difference between `let` and `var` in Swift?**
   - **Answer:**  
     - `let` is used to declare a constant, which means its value cannot be changed after it is set.
     - `var` is used to declare a variable, which means its value can be changed after it is set.
     Example:
     ```swift
     let pi = 3.14159 // Constant
     var score = 100 // Variable
     score = 200 // Valid
     // pi = 3.14 // Invalid (compile-time error)
     ```

---

## 5. **What is an optional in Swift?**
   - **Answer:**  
     An optional is a type that can hold either a value or `nil` (no value). It is represented by appending a `?` to the type. For example:
     ```swift
     var optionalString: String? = "Hello"
     optionalString = nil // Valid
     ```
     Optionals are used to handle the absence of a value safely.

---

## 6. **How do you unwrap an optional in Swift?**
   - **Answer:**  
     There are several ways to unwrap an optional:
     - **Force Unwrapping:** Using `!` (risky if the value is `nil`).
       ```swift
       let value = optionalString!
       ```
     - **Optional Binding:** Using `if let` or `guard let`.
       ```swift
       if let unwrappedString = optionalString {
           print(unwrappedString)
       }
       ```
     - **Nil Coalescing Operator:** Using `??` to provide a default value.
       ```swift
       let value = optionalString ?? "Default"
       ```

---

## 7. **What is the nil-coalescing operator in Swift?**
   - **Answer:**  
     The nil-coalescing operator (`??`) is used to provide a default value for an optional if it is `nil`. For example:
     ```swift
     let name: String? = nil
     let unwrappedName = name ?? "Unknown"
     print(unwrappedName) // Output: "Unknown"
     ```

---

## 8. **What is a tuple in Swift?**
   - **Answer:**  
     A tuple is a group of multiple values combined into a single compound value. The values can be of any type and do not need to be the same. For example:
     ```swift
     let person = (name: "Alice", age: 30)
     print(person.name) // Output: "Alice"
     print(person.age) // Output: 30
     ```

---

## 9. **What is the difference between `==` and `===` in Swift?**
   - **Answer:**  
     - `==` is the equality operator and checks if two values are equal.
     - `===` is the identity operator and checks if two references point to the same object instance.
     Example:
     ```swift
     let a = [1, 2, 3]
     let b = [1, 2, 3]
     print(a == b) // true (values are equal)
     print(a === b) // false (different instances)
     ```

---

## 10. **What is type aliasing in Swift?**
   - **Answer:**  
     Type aliasing allows you to provide a new name for an existing type using the `typealias` keyword. For example:
     ```swift
     typealias StudentID = Int
     let id: StudentID = 12345
     ```

---

## 11. **What are the different numeric literals in Swift?**
   - **Answer:**  
     Swift supports several numeric literals:
     - Decimal: `let decimal = 17`
     - Binary: `let binary = 0b10001`
     - Octal: `let octal = 0o21`
     - Hexadecimal: `let hex = 0x11`

---

## 12. **What is string interpolation in Swift?**
   - **Answer:**  
     String interpolation allows you to embed variables and expressions inside a string using `\()`. For example:
     ```swift
     let name = "Alice"
     let age = 30
     let message = "My name is \(name) and I am \(age) years old."
     print(message) // Output: "My name is Alice and I am 30 years old."
     ```

---

## 13. **What is the difference between `String` and `NSString` in Swift?**
   - **Answer:**  
     - `String` is a native Swift type that provides Unicode-compliant string manipulation.
     - `NSString` is a Foundation class from Objective-C. While `String` and `NSString` are bridged, `String` is preferred in Swift for its modern API and safety features.

---

## 14. **What is the purpose of the `assert` function in Swift?**
   - **Answer:**  
     The `assert` function is used to check for conditions that must be true during development. If the condition is false, the app will terminate with a debug message. For example:
     ```swift
     let age = -5
     assert(age >= 0, "Age cannot be negative")
     ```

---

## 15. **What is the difference between `Int` and `UInt` in Swift?**
   - **Answer:**  
     - `Int` is a signed integer type that can represent both positive and negative numbers.
     - `UInt` is an unsigned integer type that can only represent non-negative numbers.

---

## 16. **What is the ternary conditional operator in Swift?**
   - **Answer:**  
     The ternary conditional operator (`? :`) is a shorthand for an `if-else` statement. It evaluates a condition and returns one of two values. For example:
     ```swift
     let isRaining = true
     let activity = isRaining ? "Stay indoors" : "Go outside"
     print(activity) // Output: "Stay indoors"
     ```

---

## 17. **What is the range operator in Swift?**
   - **Answer:**  
     Swift provides two range operators:
     - Closed Range Operator (`...`): Includes both start and end values.
       ```swift
       for i in 1...5 {
           print(i) // Output: 1, 2, 3, 4, 5
       }
       ```
     - Half-Open Range Operator (`..<`): Includes the start value but excludes the end value.
       ```swift
       for i in 1..<5 {
           print(i) // Output: 1, 2, 3, 4
       }
       ```

---

## 18. **What is the purpose of the `guard` statement in Swift?**
   - **Answer:**  
     The `guard` statement is used for early exit from a function or loop if a condition is not met. It ensures that the code only proceeds if the condition is true. For example:
     ```swift
     func greet(name: String?) {
         guard let unwrappedName = name else {
             print("Name is nil")
             return
         }
         print("Hello, \(unwrappedName)")
     }
     ```

---

## 19. **What is the difference between `Any` and `AnyObject` in Swift?**
   - **Answer:**  
     - `Any` can represent an instance of any type, including functions and optional types.
     - `AnyObject` can represent an instance of any class type.

---

## 20. **What is the purpose of the `defer` statement in Swift?**
   - **Answer:**  
     The `defer` statement is used to execute a block of code just before the current scope exits. It is often used for cleanup tasks. For example:
     ```swift
     func processFile() {
         print("Step 1")
         defer {
             print("Cleanup")
         }
         print("Step 2")
     }
     // Output: Step 1, Step 2, Cleanup
     ```

---

This concludes the interview questions and answers for the "The Basics" section of Swift.

# Swift Basic Operators - Interview Questions and Answers

This document contains interview questions and answers based on the "Basic Operators" section of the Swift documentation.

---

## 1. **What are the basic categories of operators in Swift?**
   - **Answer:**  
     Operators in Swift are categorized into the following groups:
     - **Unary Operators:** Operate on a single target (e.g., `-a`, `!isEnabled`).
     - **Binary Operators:** Operate on two targets (e.g., `a + b`, `a > b`).
     - **Ternary Operators:** Operate on three targets (e.g., `a ? b : c`).

---

## 2. **What is the assignment operator in Swift?**
   - **Answer:**  
     The assignment operator (`=`) is used to assign a value to a variable or constant. For example:
     ```swift
     let x = 10
     var y = 5
     y = x // y is now 10
     ```

---

## 3. **What are arithmetic operators in Swift?**
   - **Answer:**  
     Arithmetic operators are used to perform mathematical operations. They include:
     - Addition (`+`)
     - Subtraction (`-`)
     - Multiplication (`*`)
     - Division (`/`)
     - Remainder (`%`)
     Example:
     ```swift
     let sum = 5 + 3 // 8
     let difference = 10 - 2 // 8
     let product = 4 * 2 // 8
     let quotient = 16 / 2 // 8
     let remainder = 9 % 4 // 1
     ```

---

## 4. **What is the remainder operator in Swift?**
   - **Answer:**  
     The remainder operator (`%`) calculates the remainder of a division between two numbers. For example:
     ```swift
     let remainder = 9 % 4 // 1
     ```
     It works with both positive and negative numbers.

---

## 5. **What are compound assignment operators in Swift?**
   - **Answer:**  
     Compound assignment operators combine an arithmetic operation with an assignment. For example:
     ```swift
     var x = 5
     x += 3 // Equivalent to x = x + 3 (x is now 8)
     x -= 2 // Equivalent to x = x - 2 (x is now 6)
     x *= 2 // Equivalent to x = x * 2 (x is now 12)
     x /= 3 // Equivalent to x = x / 3 (x is now 4)
     x %= 3 // Equivalent to x = x % 3 (x is now 1)
     ```

---

## 6. **What are comparison operators in Swift?**
   - **Answer:**  
     Comparison operators are used to compare two values. They return a `Bool` value (`true` or `false`). They include:
     - Equal to (`==`)
     - Not equal to (`!=`)
     - Greater than (`>`)
     - Less than (`<`)
     - Greater than or equal to (`>=`)
     - Less than or equal to (`<=`)
     Example:
     ```swift
     let a = 5, b = 10
     print(a == b) // false
     print(a != b) // true
     print(a > b) // false
     print(a < b) // true
     ```

---

## 7. **What is the ternary conditional operator in Swift?**
   - **Answer:**  
     The ternary conditional operator (`? :`) is a shorthand for an `if-else` statement. It evaluates a condition and returns one of two values. For example:
     ```swift
     let isRaining = true
     let activity = isRaining ? "Stay indoors" : "Go outside"
     print(activity) // Output: "Stay indoors"
     ```

---

## 8. **What are nil-coalescing operators in Swift?**
   - **Answer:**  
     The nil-coalescing operator (`??`) is used to provide a default value for an optional if it is `nil`. For example:
     ```swift
     let name: String? = nil
     let unwrappedName = name ?? "Unknown"
     print(unwrappedName) // Output: "Unknown"
     ```

---

## 9. **What are range operators in Swift?**
   - **Answer:**  
     Range operators are used to represent a range of values. They include:
     - **Closed Range Operator (`...`):** Includes both start and end values.
       ```swift
       for i in 1...5 {
           print(i) // Output: 1, 2, 3, 4, 5
       }
       ```
     - **Half-Open Range Operator (`..<`):** Includes the start value but excludes the end value.
       ```swift
       for i in 1..<5 {
           print(i) // Output: 1, 2, 3, 4
       }
       ```

---

## 10. **What are logical operators in Swift?**
   - **Answer:**  
     Logical operators are used to combine or negate Boolean values. They include:
     - Logical NOT (`!`): Inverts a Boolean value.
       ```swift
       let isEnabled = false
       print(!isEnabled) // true
       ```
     - Logical AND (`&&`): Returns `true` if both operands are `true`.
       ```swift
       let a = true, b = false
       print(a && b) // false
       ```
     - Logical OR (`||`): Returns `true` if at least one operand is `true`.
       ```swift
       let a = true, b = false
       print(a || b) // true
       ```

---

## 11. **What is operator precedence in Swift?**
   - **Answer:**  
     Operator precedence determines the order in which operators are evaluated in an expression. For example, multiplication (`*`) has higher precedence than addition (`+`), so it is evaluated first:
     ```swift
     let result = 2 + 3 * 4 // 14 (not 20)
     ```

---

## 12. **What is the difference between the equality operator (`==`) and the identity operator (`===`)?**
   - **Answer:**  
     - The equality operator (`==`) checks if two values are equal.
     - The identity operator (`===`) checks if two references point to the same object instance.
     Example:
     ```swift
     let a = [1, 2, 3]
     let b = [1, 2, 3]
     print(a == b) // true (values are equal)
     print(a === b) // false (different instances)
     ```

---

## 13. **What is the purpose of the `is` operator in Swift?**
   - **Answer:**  
     The `is` operator is used to check whether an instance is of a specific type. It returns `true` if the instance is of the specified type, otherwise `false`. For example:
     ```swift
     let value: Any = 10
     if value is Int {
         print("Value is an integer")
     }
     ```

---

## 14. **What is the purpose of the `as` operator in Swift?**
   - **Answer:**  
     The `as` operator is used for type casting. It can be used in three ways:
     - `as`: For upcasting (casting to a superclass).
     - `as?`: For conditional downcasting (returns an optional).
     - `as!`: For forced downcasting (may crash if the cast fails).
     Example:
     ```swift
     let value: Any = "Hello"
     if let stringValue = value as? String {
         print(stringValue) // Output: "Hello"
     }
     ```

---

## 15. **What is the difference between the prefix and postfix operators?**
   - **Answer:**  
     - **Prefix Operators:** Appear before the operand (e.g., `-a`, `!isEnabled`).
     - **Postfix Operators:** Appear after the operand (e.g., `a!`, `b++` in some languages).
     Example:
     ```swift
     let a = 5
     let b = -a // Prefix operator
     ```

---

## 16. **What is the purpose of the `~=` operator in Swift?**
   - **Answer:**  
     The `~=` operator is used for pattern matching, often in `switch` statements. It checks if a value matches a pattern. For example:
     ```swift
     let range = 1...10
     if range ~= 5 {
         print("5 is within the range")
     }
     ```

---

## 17. **What is the difference between the `&&` and `||` operators?**
   - **Answer:**  
     - `&&` (Logical AND): Returns `true` only if both operands are `true`.
     - `||` (Logical OR): Returns `true` if at least one operand is `true`.
     Example:
     ```swift
     let a = true, b = false
     print(a && b) // false
     print(a || b) // true
     ```

---

## 18. **What is the purpose of the `defer` statement in Swift?**
   - **Answer:**  
     The `defer` statement is used to execute a block of code just before the current scope exits. It is often used for cleanup tasks. For example:
     ```swift
     func processFile() {
         print("Step 1")
         defer {
             print("Cleanup")
         }
         print("Step 2")
     }
     // Output: Step 1, Step 2, Cleanup
     ```

---

## 19. **What is the difference between `==` and `===` in Swift?**
   - **Answer:**  
     - `==` checks if two values are equal.
     - `===` checks if two references point to the same object instance.

---

## 20. **What is the purpose of the `nil` coalescing operator (`??`)?**
   - **Answer:**  
     The nil-coalescing operator (`??`) provides a default value for an optional if it is `nil`. For example:
     ```swift
     let name: String? = nil
     let unwrappedName = name ?? "Unknown"
     print(unwrappedName) // Output: "Unknown"
     ```

---

This concludes the interview questions and answers for the "Basic Operators" section of Swift.

# Swift Strings and Characters - Interview Questions and Answers

This document contains interview questions and answers based on the "Strings and Characters" section of the Swift documentation.

---

## 1. **What is a string in Swift?**
   - **Answer:**  
     A string is a collection of characters, such as `"Hello, World!"`. In Swift, strings are represented by the `String` type, which is Unicode-compliant and provides powerful methods for working with text.

---

## 2. **What is a character in Swift?**
   - **Answer:**  
     A character is a single Unicode scalar value, such as `"A"`, `"1"`, or `"😊"`. In Swift, characters are represented by the `Character` type.

---

## 3. **How do you declare a string in Swift?**
   - **Answer:**  
     You can declare a string using double quotes (`""`). For example:
     ```swift
     let greeting = "Hello, World!"
     ```

---

## 4. **What is string interpolation in Swift?**
   - **Answer:**  
     String interpolation allows you to embed variables and expressions inside a string using `\()`. For example:
     ```swift
     let name = "Alice"
     let age = 30
     let message = "My name is \(name) and I am \(age) years old."
     print(message) // Output: "My name is Alice and I am 30 years old."
     ```

---

## 5. **How do you concatenate strings in Swift?**
   - **Answer:**  
     You can concatenate strings using the `+` operator or the `+=` operator. For example:
     ```swift
     let firstName = "John"
     let lastName = "Doe"
     let fullName = firstName + " " + lastName // "John Doe"
     ```

---

## 6. **What is a multiline string literal in Swift?**
   - **Answer:**  
     A multiline string literal is a string that spans multiple lines. It is enclosed in triple quotes (`"""`). For example:
     ```swift
     let multilineString = """
     This is a multiline string.
     It spans multiple lines.
     """
     ```

---

## 7. **How do you access individual characters in a string?**
   - **Answer:**  
     You can access individual characters in a string using the `String`'s `indices` property or by iterating over the string. For example:
     ```swift
     let str = "Swift"
     let firstCharacter = str[str.startIndex] // 'S'
     ```

---

## 8. **What is the difference between `String` and `NSString` in Swift?**
   - **Answer:**  
     - `String` is a native Swift type that provides Unicode-compliant string manipulation.
     - `NSString` is a Foundation class from Objective-C. While `String` and `NSString` are bridged, `String` is preferred in Swift for its modern API and safety features.

---

## 9. **How do you check if a string is empty in Swift?**
   - **Answer:**  
     You can check if a string is empty using the `isEmpty` property. For example:
     ```swift
     let str = ""
     if str.isEmpty {
         print("The string is empty")
     }
     ```

---

## 10. **How do you compare two strings in Swift?**
   - **Answer:**  
     You can compare two strings using the equality operator (`==`) or the inequality operator (`!=`). For example:
     ```swift
     let str1 = "Hello"
     let str2 = "World"
     if str1 == str2 {
         print("Strings are equal")
     } else {
         print("Strings are not equal")
     }
     ```

---

## 11. **What is Unicode in Swift?**
   - **Answer:**  
     Unicode is a standard for encoding, representing, and processing text. Swift's `String` and `Character` types are fully Unicode-compliant, meaning they can handle any Unicode character.

---

## 12. **How do you iterate over the characters in a string?**
   - **Answer:**  
     You can iterate over the characters in a string using a `for-in` loop. For example:
     ```swift
     let str = "Swift"
     for character in str {
         print(character)
     }
     ```

---

## 13. **What is a substring in Swift?**
   - **Answer:**  
     A substring is a portion of a string. In Swift, substrings are represented by the `Substring` type. They share memory with the original string, making them efficient. For example:
     ```swift
     let str = "Hello, World!"
     let substring = str.prefix(5) // "Hello"
     ```

---

## 14. **How do you convert a string to uppercase or lowercase?**
   - **Answer:**  
     You can convert a string to uppercase or lowercase using the `uppercased()` and `lowercased()` methods. For example:
     ```swift
     let str = "Hello, World!"
     let uppercase = str.uppercased() // "HELLO, WORLD!"
     let lowercase = str.lowercased() // "hello, world!"
     ```

---

## 15. **What is string slicing in Swift?**
   - **Answer:**  
     String slicing refers to extracting a portion of a string using a range. For example:
     ```swift
     let str = "Hello, World!"
     let slice = str[str.startIndex..<str.index(str.startIndex, offsetBy: 5)] // "Hello"
     ```

---

## 16. **How do you check if a string contains a substring?**
   - **Answer:**  
     You can check if a string contains a substring using the `contains()` method. For example:
     ```swift
     let str = "Hello, World!"
     if str.contains("World") {
         print("Substring found")
     }
     ```

---

## 17. **What is the difference between `prefix()` and `suffix()` in Swift?**
   - **Answer:**  
     - `prefix()` returns a substring containing the first `n` characters of the string.
     - `suffix()` returns a substring containing the last `n` characters of the string.
     Example:
     ```swift
     let str = "Hello, World!"
     let prefix = str.prefix(5) // "Hello"
     let suffix = str.suffix(6) // "World!"
     ```

---

## 18. **How do you replace a substring in a string?**
   - **Answer:**  
     You can replace a substring using the `replacingOccurrences()` method. For example:
     ```swift
     let str = "Hello, World!"
     let newStr = str.replacingOccurrences(of: "World", with: "Swift") // "Hello, Swift!"
     ```

---

## 19. **What is the purpose of the `count` property in a string?**
   - **Answer:**  
     The `count` property returns the number of characters in a string. For example:
     ```swift
     let str = "Hello, World!"
     print(str.count) // Output: 13
     ```

---

## 20. **How do you split a string into an array of substrings?**
   - **Answer:**  
     You can split a string into an array of substrings using the `components(separatedBy:)` method. For example:
     ```swift
     let str = "Hello, World!"
     let components = str.components(separatedBy: ", ") // ["Hello", "World!"]
     ```

---

## 21. **What is the difference between `String` and `Substring`?**
   - **Answer:**  
     - `String` is an independent collection of characters.
     - `Substring` is a slice of a string that shares memory with the original string. It is more memory-efficient but must be converted to a `String` for long-term storage.

---

## 22. **How do you convert a string to an integer in Swift?**
   - **Answer:**  
     You can convert a string to an integer using the `Int()` initializer. For example:
     ```swift
     let str = "42"
     if let number = Int(str) {
         print(number) // Output: 42
     }
     ```

---

## 23. **What is the purpose of the `trimmingCharacters()` method?**
   - **Answer:**  
     The `trimmingCharacters()` method removes whitespace or other specified characters from the beginning and end of a string. For example:
     ```swift
     let str = "  Hello, World!  "
     let trimmed = str.trimmingCharacters(in: .whitespaces) // "Hello, World!"
     ```

---

## 24. **How do you check if a string starts or ends with a specific substring?**
   - **Answer:**  
     You can use the `hasPrefix()` and `hasSuffix()` methods to check if a string starts or ends with a specific substring. For example:
     ```swift
     let str = "Hello, World!"
     if str.hasPrefix("Hello") {
         print("Starts with Hello")
     }
     if str.hasSuffix("World!") {
         print("Ends with World!")
     }
     ```

---

## 25. **What is the purpose of the `unicodeScalars` property in Swift?**
   - **Answer:**  
     The `unicodeScalars` property provides access to the Unicode scalar values of a string. For example:
     ```swift
     let str = "Hello"
     for scalar in str.unicodeScalars {
         print(scalar.value)
     }
     ```

---

This concludes the interview questions and answers for the "Strings and Characters" section of Swift.

# Swift Collection Types - Interview Questions and Answers

This document contains interview questions and answers based on the "Collection Types" section of the Swift documentation.

---

## 1. **What are the primary collection types in Swift?**
   - **Answer:**  
     Swift provides three primary collection types:
     - **Arrays:** Ordered collections of values.
     - **Sets:** Unordered collections of unique values.
     - **Dictionaries:** Unordered collections of key-value pairs.

---

## 2. **What is an array in Swift?**
   - **Answer:**  
     An array is an ordered collection of values of the same type. It allows duplicate values and is indexed by integers. For example:
     ```swift
     var numbers = [1, 2, 3, 4, 5]
     ```

---

## 3. **How do you declare an array in Swift?**
   - **Answer:**  
     You can declare an array using square brackets (`[]`). For example:
     ```swift
     var fruits: [String] = ["Apple", "Banana", "Orange"]
     ```

---

## 4. **What is a set in Swift?**
   - **Answer:**  
     A set is an unordered collection of unique values of the same type. It does not allow duplicates. For example:
     ```swift
     var uniqueNumbers: Set<Int> = [1, 2, 3, 4, 5]
     ```

---

## 5. **How do you declare a set in Swift?**
   - **Answer:**  
     You can declare a set using the `Set` keyword and square brackets (`[]`). For example:
     ```swift
     var colors: Set<String> = ["Red", "Green", "Blue"]
     ```

---

## 6. **What is a dictionary in Swift?**
   - **Answer:**  
     A dictionary is an unordered collection of key-value pairs, where each key is unique. For example:
     ```swift
     var person: [String: Any] = ["name": "John", "age": 30]
     ```

---

## 7. **How do you declare a dictionary in Swift?**
   - **Answer:**  
     You can declare a dictionary using square brackets (`[]`) and a colon (`:`) to separate keys and values. For example:
     ```swift
     var capitals: [String: String] = ["France": "Paris", "Japan": "Tokyo"]
     ```

---

## 8. **What is the difference between an array and a set?**
   - **Answer:**  
     - **Array:** Ordered, allows duplicates, and is indexed by integers.
     - **Set:** Unordered, does not allow duplicates, and is not indexed.

---

## 9. **What is the difference between a set and a dictionary?**
   - **Answer:**  
     - **Set:** Stores unique values of the same type.
     - **Dictionary:** Stores key-value pairs, where keys are unique.

---

## 10. **How do you add an element to an array?**
   - **Answer:**  
     You can add an element to an array using the `append()` method or the `+=` operator. For example:
     ```swift
     var numbers = [1, 2, 3]
     numbers.append(4) // [1, 2, 3, 4]
     numbers += [5] // [1, 2, 3, 4, 5]
     ```

---

## 11. **How do you remove an element from an array?**
   - **Answer:**  
     You can remove an element from an array using the `remove(at:)` method. For example:
     ```swift
     var numbers = [1, 2, 3, 4, 5]
     numbers.remove(at: 2) // [1, 2, 4, 5]
     ```

---

## 12. **How do you check if a set contains a specific element?**
   - **Answer:**  
     You can check if a set contains a specific element using the `contains()` method. For example:
     ```swift
     var colors: Set<String> = ["Red", "Green", "Blue"]
     if colors.contains("Red") {
         print("Set contains Red")
     }
     ```

---

## 13. **How do you add an element to a set?**
   - **Answer:**  
     You can add an element to a set using the `insert()` method. For example:
     ```swift
     var colors: Set<String> = ["Red", "Green"]
     colors.insert("Blue") // {"Red", "Green", "Blue"}
     ```

---

## 14. **How do you remove an element from a set?**
   - **Answer:**  
     You can remove an element from a set using the `remove()` method. For example:
     ```swift
     var colors: Set<String> = ["Red", "Green", "Blue"]
     colors.remove("Green") // {"Red", "Blue"}
     ```

---

## 15. **How do you add a key-value pair to a dictionary?**
   - **Answer:**  
     You can add a key-value pair to a dictionary using subscript syntax. For example:
     ```swift
     var person = ["name": "John"]
     person["age"] = 30 // ["name": "John", "age": 30]
     ```

---

## 16. **How do you remove a key-value pair from a dictionary?**
   - **Answer:**  
     You can remove a key-value pair from a dictionary by setting the value to `nil`. For example:
     ```swift
     var person = ["name": "John", "age": 30]
     person["age"] = nil // ["name": "John"]
     ```

---

## 17. **How do you iterate over an array?**
   - **Answer:**  
     You can iterate over an array using a `for-in` loop. For example:
     ```swift
     let numbers = [1, 2, 3]
     for number in numbers {
         print(number)
     }
     ```

---

## 18. **How do you iterate over a set?**
   - **Answer:**  
     You can iterate over a set using a `for-in` loop. For example:
     ```swift
     let colors: Set<String> = ["Red", "Green", "Blue"]
     for color in colors {
         print(color)
     }
     ```

---

## 19. **How do you iterate over a dictionary?**
   - **Answer:**  
     You can iterate over a dictionary using a `for-in` loop, which provides access to each key-value pair. For example:
     ```swift
     let capitals = ["France": "Paris", "Japan": "Tokyo"]
     for (country, capital) in capitals {
         print("\(country): \(capital)")
     }
     ```

---

## 20. **What is the difference between `Array` and `ContiguousArray`?**
   - **Answer:**  
     - `Array`: A general-purpose array that can store elements of any type.
     - `ContiguousArray`: A specialized array that stores elements in a contiguous memory block, which can improve performance for certain use cases.

---

## 21. **What is the purpose of the `count` property in collections?**
   - **Answer:**  
     The `count` property returns the number of elements in a collection. For example:
     ```swift
     let numbers = [1, 2, 3]
     print(numbers.count) // Output: 3
     ```

---

## 22. **What is the purpose of the `isEmpty` property in collections?**
   - **Answer:**  
     The `isEmpty` property checks if a collection has no elements. For example:
     ```swift
     let numbers: [Int] = []
     if numbers.isEmpty {
         print("The array is empty")
     }
     ```

---

## 23. **How do you check if a dictionary contains a specific key?**
   - **Answer:**  
     You can check if a dictionary contains a specific key using the `keys` property or by accessing the key directly. For example:
     ```swift
     let capitals = ["France": "Paris", "Japan": "Tokyo"]
     if capitals.keys.contains("France") {
         print("Key found")
     }
     ```

---

## 24. **What is the purpose of the `first` property in collections?**
   - **Answer:**  
     The `first` property returns the first element of a collection, or `nil` if the collection is empty. For example:
     ```swift
     let numbers = [1, 2, 3]
     if let firstNumber = numbers.first {
         print(firstNumber) // Output: 1
     }
     ```

---

## 25. **How do you sort an array in Swift?**
   - **Answer:**  
     You can sort an array using the `sort()` method (in-place) or the `sorted()` method (returns a new array). For example:
     ```swift
     var numbers = [3, 1, 2]
     numbers.sort() // [1, 2, 3] (in-place)
     let sortedNumbers = numbers.sorted() // [1, 2, 3] (new array)
     ```

---

## 26. **How do you filter an array in Swift?**
   - **Answer:**  
     You can filter an array using the `filter()` method. For example:
     ```swift
     let numbers = [1, 2, 3, 4, 5]
     let evenNumbers = numbers.filter { $0 % 2 == 0 } // [2, 4]
     ```

---

## 27. **What is the purpose of the `map()` function in collections?**
   - **Answer:**  
     The `map()` function transforms each element of a collection using a closure and returns a new collection. For example:
     ```swift
     let numbers = [1, 2, 3]
     let squaredNumbers = numbers.map { $0 * $0 } // [1, 4, 9]
     ```

---

## 28. **What is the purpose of the `reduce()` function in collections?**
   - **Answer:**  
     The `reduce()` function combines all elements of a collection into a single value using a closure. For example:
     ```swift
     let numbers = [1, 2, 3, 4]
     let sum = numbers.reduce(0, +) // 10
     ```

---

## 29. **What is the difference between `flatMap()` and `compactMap()`?**
   - **Answer:**  
     - `flatMap()`: Flattens a collection of collections and applies a transformation.
     - `compactMap()`: Transforms a collection and removes `nil` values.
     Example:
     ```swift
     let numbers = ["1", "2", "three"]
     let validNumbers = numbers.compactMap { Int($0) } // [1, 2]
     ```

---

## 30. **What is the purpose of the `lazy` keyword in collections?**
   - **Answer:**  
     The `lazy` keyword delays computation until it is explicitly needed, which can improve performance for large collections. For example:
     ```swift
     let numbers = [1, 2, 3, 4]
     let squaredNumbers = numbers.lazy.map { $0 * $0 }
     ```

---

This concludes the interview questions and answers for the "Collection Types" section of Swift.

# Swift Control Flow - Interview Questions and Answers

This document contains interview questions and answers based on the "Control Flow" section of the Swift documentation.

---

## 1. **What are the primary control flow statements in Swift?**
   - **Answer:**  
     Swift provides several control flow statements:
     - **Conditional Statements:** `if`, `if-else`, `switch`
     - **Loops:** `for-in`, `while`, `repeat-while`
     - **Control Transfer Statements:** `break`, `continue`, `fallthrough`, `return`, `throw`

---

## 2. **What is the `if` statement in Swift?**
   - **Answer:**  
     The `if` statement is used to execute a block of code only if a condition is `true`. For example:
     ```swift
     let temperature = 30
     if temperature > 25 {
         print("It's hot outside")
     }
     ```

---

## 3. **What is the `if-else` statement in Swift?**
   - **Answer:**  
     The `if-else` statement is used to execute one block of code if a condition is `true` and another block if the condition is `false`. For example:
     ```swift
     let temperature = 20
     if temperature > 25 {
         print("It's hot outside")
     } else {
         print("It's not hot outside")
     }
     ```

---

## 4. **What is the `switch` statement in Swift?**
   - **Answer:**  
     The `switch` statement is used to compare a value against multiple possible matching patterns. It is more powerful than `if-else` for multiple conditions. For example:
     ```swift
     let grade = "A"
     switch grade {
     case "A":
         print("Excellent")
     case "B":
         print("Good")
     default:
         print("Fail")
     }
     ```

---

## 5. **What is the `for-in` loop in Swift?**
   - **Answer:**  
     The `for-in` loop is used to iterate over a sequence, such as an array, range, or dictionary. For example:
     ```swift
     let numbers = [1, 2, 3]
     for number in numbers {
         print(number)
     }
     ```

---

## 6. **What is the `while` loop in Swift?**
   - **Answer:**  
     The `while` loop repeatedly executes a block of code as long as a condition is `true`. For example:
     ```swift
     var count = 0
     while count < 5 {
         print(count)
         count += 1
     }
     ```

---

## 7. **What is the `repeat-while` loop in Swift?**
   - **Answer:**  
     The `repeat-while` loop is similar to the `while` loop, but it guarantees that the loop body is executed at least once. For example:
     ```swift
     var count = 0
     repeat {
         print(count)
         count += 1
     } while count < 5
     ```

---

## 8. **What is the `break` statement in Swift?**
   - **Answer:**  
     The `break` statement is used to exit a loop or `switch` statement prematurely. For example:
     ```swift
     for number in 1...10 {
         if number == 5 {
             break
         }
         print(number)
     }
     ```

---

## 9. **What is the `continue` statement in Swift?**
   - **Answer:**  
     The `continue` statement skips the remaining code in the current iteration of a loop and moves to the next iteration. For example:
     ```swift
     for number in 1...5 {
         if number == 3 {
             continue
         }
         print(number)
     }
     ```

---

## 10. **What is the `fallthrough` statement in Swift?**
   - **Answer:**  
     The `fallthrough` statement is used in a `switch` statement to continue execution to the next case, even if the current case matches. For example:
     ```swift
     let number = 2
     switch number {
     case 1:
         print("One")
     case 2:
         print("Two")
         fallthrough
     case 3:
         print("Three")
     default:
         print("Other")
     }
     // Output: Two, Three
     ```

---

## 11. **What is the `guard` statement in Swift?**
   - **Answer:**  
     The `guard` statement is used for early exit from a function or loop if a condition is not met. It ensures that the code only proceeds if the condition is `true`. For example:
     ```swift
     func greet(name: String?) {
         guard let unwrappedName = name else {
             print("Name is nil")
             return
         }
         print("Hello, \(unwrappedName)")
     }
     ```

---

## 12. **What is the difference between `if-let` and `guard-let`?**
   - **Answer:**  
     - `if-let`: Unwraps an optional and executes a block of code if the optional has a value. The unwrapped value is only available inside the `if` block.
     - `guard-let`: Unwraps an optional and ensures the unwrapped value is available after the `guard` statement. If the optional is `nil`, it exits the scope early.

---

## 13. **What is the `where` clause in Swift?**
   - **Answer:**  
     The `where` clause is used to add additional conditions to `case` statements in a `switch` or to filter elements in a loop. For example:
     ```swift
     let numbers = [1, 2, 3, 4, 5]
     for number in numbers where number % 2 == 0 {
         print(number) // Output: 2, 4
     }
     ```

---

## 14. **What is the `defer` statement in Swift?**
   - **Answer:**  
     The `defer` statement is used to execute a block of code just before the current scope exits. It is often used for cleanup tasks. For example:
     ```swift
     func processFile() {
         print("Step 1")
         defer {
             print("Cleanup")
         }
         print("Step 2")
     }
     // Output: Step 1, Step 2, Cleanup
     ```

---

## 15. **What is the difference between `for-in` and `forEach` in Swift?**
   - **Answer:**  
     - `for-in`: A loop that iterates over a sequence.
     - `forEach`: A higher-order function that applies a closure to each element of a sequence.
     Example:
     ```swift
     let numbers = [1, 2, 3]
     numbers.forEach { print($0) }
     ```

---

## 16. **What is the `labeled statement` in Swift?**
   - **Answer:**  
     A labeled statement allows you to name a loop or conditional statement, which can be useful for controlling nested loops with `break` or `continue`. For example:
     ```swift
     outerLoop: for i in 1...3 {
         for j in 1...3 {
             if i == 2 && j == 2 {
                 break outerLoop
             }
             print("i: \(i), j: \(j)")
         }
     }
     ```

---

## 17. **What is the `switch` statement's `value binding` feature?**
   - **Answer:**  
     Value binding allows you to assign the value of a `switch` case to a temporary variable or constant. For example:
     ```swift
     let point = (1, 2)
     switch point {
     case (let x, let y):
         print("x: \(x), y: \(y)")
     }
     ```

---

## 18. **What is the `switch` statement's `compound cases` feature?**
   - **Answer:**  
     Compound cases allow you to combine multiple cases in a `switch` statement. For example:
     ```swift
     let character: Character = "a"
     switch character {
     case "a", "e", "i", "o", "u":
         print("Vowel")
     default:
         print("Consonant")
     }
     ```

---

## 19. **What is the `switch` statement's `where` clause?**
   - **Answer:**  
     The `where` clause in a `switch` statement allows you to add additional conditions to a case. For example:
     ```swift
     let number = 10
     switch number {
     case let x where x % 2 == 0:
         print("Even number: \(x)")
     default:
         print("Odd number")
     }
     ```

---

## 20. **What is the difference between `while` and `repeat-while`?**
   - **Answer:**  
     - `while`: Checks the condition before executing the loop body.
     - `repeat-while`: Executes the loop body at least once before checking the condition.

---

## 21. **What is the `break` statement's use in a `switch`?**
   - **Answer:**  
     The `break` statement in a `switch` is used to exit the `switch` block early. It is often used to avoid executing the code in the `default` case. For example:
     ```swift
     let number = 5
     switch number {
     case 1:
         print("One")
     default:
         break
     }
     ```

---

## 22. **What is the `continue` statement's use in a loop?**
   - **Answer:**  
     The `continue` statement skips the remaining code in the current iteration of a loop and moves to the next iteration. For example:
     ```swift
     for number in 1...5 {
         if number == 3 {
             continue
         }
         print(number) // Output: 1, 2, 4, 5
     }
     ```

---

## 23. **What is the `fallthrough` statement's use in a `switch`?**
   - **Answer:**  
     The `fallthrough` statement in a `switch` allows execution to continue to the next case, even if the current case matches. For example:
     ```swift
     let number = 2
     switch number {
     case 2:
         print("Two")
         fallthrough
     case 3:
         print("Three")
     default:
         print("Other")
     }
     // Output: Two, Three
     ```

---

## 24. **What is the `defer` statement's use in a function?**
   - **Answer:**  
     The `defer` statement is used to execute a block of code just before the function exits. It is often used for cleanup tasks. For example:
     ```swift
     func processFile() {
         print("Step 1")
         defer {
             print("Cleanup")
         }
         print("Step 2")
     }
     // Output: Step 1, Step 2, Cleanup
     ```

---

## 25. **What is the `guard` statement's use in a function?**
   - **Answer:**  
     The `guard` statement is used to exit a function early if a condition is not met. It ensures that the code only proceeds if the condition is `true`. For example:
     ```swift
     func greet(name: String?) {
         guard let unwrappedName = name else {
             print("Name is nil")
             return
         }
         print("Hello, \(unwrappedName)")
     }
     ```

---

This concludes the interview questions and answers for the "Control Flow" section of Swift.

# Swift Functions - Interview Questions and Answers

This document contains interview questions and answers based on the "Functions" section of the Swift documentation.

---

## 1. **What is a function in Swift?**
   - **Answer:**  
     A function is a reusable block of code that performs a specific task. It can take input parameters, return values, and be called multiple times. For example:
     ```swift
     func greet(name: String) -> String {
         return "Hello, \(name)!"
     }
     ```

---

## 2. **How do you define a function in Swift?**
   - **Answer:**  
     A function is defined using the `func` keyword, followed by the function name, parameters, return type, and body. For example:
     ```swift
     func add(a: Int, b: Int) -> Int {
         return a + b
     }
     ```

---

## 3. **What are function parameters in Swift?**
   - **Answer:**  
     Function parameters are inputs that a function accepts. They are defined in the function signature and can have names and types. For example:
     ```swift
     func multiply(a: Int, b: Int) -> Int {
         return a * b
     }
     ```

---

## 4. **What is the difference between parameters and arguments?**
   - **Answer:**  
     - **Parameters:** Variables defined in the function signature (e.g., `a: Int, b: Int`).
     - **Arguments:** Actual values passed to the function when it is called (e.g., `multiply(a: 2, b: 3)`).

---

## 5. **What is a return type in a function?**
   - **Answer:**  
     The return type specifies the type of value a function will return. It is written after the `->` symbol in the function signature. For example:
     ```swift
     func square(number: Int) -> Int {
         return number * number
     }
     ```

---

## 6. **What is a function without a return type called?**
   - **Answer:**  
     A function without a return type is called a **void function**. It uses `Void` or `()` as the return type. For example:
     ```swift
     func printMessage() {
         print("Hello, World!")
     }
     ```

---

## 7. **What are external and internal parameter names?**
   - **Answer:**  
     - **External Parameter Names:** Used when calling the function to make the purpose of the arguments clearer.
     - **Internal Parameter Names:** Used inside the function body to refer to the parameters.
     Example:
     ```swift
     func greet(to name: String) {
         print("Hello, \(name)!")
     }
     greet(to: "Alice") // "to" is the external name, "name" is the internal name
     ```

---

## 8. **What is the purpose of the `_` in function parameters?**
   - **Answer:**  
     The `_` (underscore) is used to omit the external parameter name when calling the function. For example:
     ```swift
     func add(_ a: Int, _ b: Int) -> Int {
         return a + b
     }
     let result = add(2, 3) // No external parameter names required
     ```

---

## 9. **What are default parameter values in Swift?**
   - **Answer:**  
     Default parameter values allow you to provide a default value for a parameter if no argument is passed. For example:
     ```swift
     func greet(name: String = "World") {
         print("Hello, \(name)!")
     }
     greet() // Output: "Hello, World!"
     greet(name: "Alice") // Output: "Hello, Alice!"
     ```

---

## 10. **What are variadic parameters in Swift?**
   - **Answer:**  
     Variadic parameters allow a function to accept zero or more values of a specified type. They are indicated by `...` after the parameter type. For example:
     ```swift
     func sum(_ numbers: Int...) -> Int {
         return numbers.reduce(0, +)
     }
     let total = sum(1, 2, 3, 4) // Output: 10
     ```

---

## 11. **What are in-out parameters in Swift?**
   - **Answer:**  
     In-out parameters allow a function to modify the value of a variable passed as an argument. They are indicated by the `inout` keyword. For example:
     ```swift
     func swapValues(_ a: inout Int, _ b: inout Int) {
         let temp = a
         a = b
         b = temp
     }
     var x = 5, y = 10
     swapValues(&x, &y) // x is now 10, y is now 5
     ```

---

## 12. **What is a function type in Swift?**
   - **Answer:**  
     A function type represents the type of a function, including its parameter types and return type. For example:
     ```swift
     let mathFunction: (Int, Int) -> Int = { $0 + $1 }
     let result = mathFunction(2, 3) // Output: 5
     ```

---

## 13. **What are nested functions in Swift?**
   - **Answer:**  
     Nested functions are functions defined inside another function. They are only accessible within the enclosing function. For example:
     ```swift
     func outerFunction() {
         func innerFunction() {
             print("Inside inner function")
         }
         innerFunction()
     }
     outerFunction() // Output: "Inside inner function"
     ```

---

## 14. **What is the difference between a function and a method?**
   - **Answer:**  
     - **Function:** A standalone block of code that can be called independently.
     - **Method:** A function that is associated with a type (e.g., a class, struct, or enum) and is called on an instance of that type.

---

## 15. **What is a higher-order function?**
   - **Answer:**  
     A higher-order function is a function that takes one or more functions as arguments or returns a function as its result. Examples include `map`, `filter`, and `reduce`. For example:
     ```swift
     let numbers = [1, 2, 3]
     let squared = numbers.map { $0 * $0 } // Output: [1, 4, 9]
     ```

---

## 16. **What is a closure in Swift?**
   - **Answer:**  
     A closure is a self-contained block of functionality that can be passed around and used in your code. It is similar to a function but can capture and store references to variables and constants from the surrounding context. For example:
     ```swift
     let greet = { (name: String) -> String in
         return "Hello, \(name)!"
     }
     print(greet("Alice")) // Output: "Hello, Alice!"
     ```

---

## 17. **What is the difference between a function and a closure?**
   - **Answer:**  
     - **Function:** A named block of code with a specific signature.
     - **Closure:** An unnamed block of code that can capture values from its surrounding context.

---

## 18. **What is trailing closure syntax in Swift?**
   - **Answer:**  
     Trailing closure syntax allows you to write a closure outside the parentheses of a function call if the closure is the last argument. For example:
     ```swift
     func performOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
         return operation(a, b)
     }
     let result = performOperation(2, 3) { $0 + $1 } // Output: 5
     ```

---

## 19. **What is the `@discardableResult` attribute in Swift?**
   - **Answer:**  
     The `@discardableResult` attribute suppresses the compiler warning when the return value of a function is not used. For example:
     ```swift
     @discardableResult
     func greet(name: String) -> String {
         return "Hello, \(name)!"
     }
     greet(name: "Alice") // No warning even though the result is not used
     ```

---

## 20. **What is the difference between `func` and `closure` in Swift?**
   - **Answer:**  
     - `func`: Declares a named function with a specific signature.
     - `closure`: Declares an unnamed block of code that can capture values from its surrounding context.

---

## 21. **What is the purpose of the `autoclosure` attribute in Swift?**
   - **Answer:**  
     The `@autoclosure` attribute automatically wraps an expression in a closure, allowing you to delay its evaluation. For example:
     ```swift
     func logIfTrue(_ condition: @autoclosure () -> Bool) {
         if condition() {
             print("True")
         }
     }
     logIfTrue(2 > 1) // Output: "True"
     ```

---

## 22. **What is the purpose of the `escaping` attribute in Swift?**
   - **Answer:**  
     The `@escaping` attribute indicates that a closure can outlive the scope of the function it is passed to. It is often used for asynchronous operations. For example:
     ```swift
     func performAsyncTask(completion: @escaping () -> Void) {
         DispatchQueue.global().async {
             completion()
         }
     }
     ```

---

## 23. **What is the difference between `escaping` and `non-escaping` closures?**
   - **Answer:**  
     - **Non-escaping Closures:** Must be executed within the function body and cannot outlive the function's scope.
     - **Escaping Closures:** Can be stored and executed after the function returns, often used for asynchronous tasks.

---

## 24. **What is the purpose of the `rethrows` keyword in Swift?**
   - **Answer:**  
     The `rethrows` keyword indicates that a function can only throw an error if one of its function parameters throws an error. For example:
     ```swift
     func customMap<T>(_ array: [T], transform: (T) throws -> T) rethrows -> [T] {
         var result = [T]()
         for item in array {
             result.append(try transform(item))
         }
         return result
     }
     ```

---

## 25. **What is the purpose of the `throws` keyword in Swift?**
   - **Answer:**  
     The `throws` keyword indicates that a function can throw an error. It is used in error-handling with `do-catch` blocks. For example:
     ```swift
     func divide(_ a: Int, _ b: Int) throws -> Int {
         if b == 0 {
             throw DivisionError.divisionByZero
         }
         return a / b
     }
     ```

---

This concludes the interview questions and answers for the "Functions" section of Swift.

# Swift Closures - Interview Questions and Answers

This document contains interview questions and answers based on the "Closures" section of the Swift documentation.

---

## 1. **What is a closure in Swift?**
   - **Answer:**  
     A closure is a self-contained block of functionality that can be passed around and used in your code. It is similar to a function but can capture and store references to variables and constants from the surrounding context. For example:
     ```swift
     let greet = { (name: String) -> String in
         return "Hello, \(name)!"
     }
     print(greet("Alice")) // Output: "Hello, Alice!"
     ```

---

## 2. **What is the difference between a function and a closure?**
   - **Answer:**  
     - **Function:** A named block of code with a specific signature.
     - **Closure:** An unnamed block of code that can capture values from its surrounding context.

---

## 3. **What are the types of closures in Swift?**
   - **Answer:**  
     Closures in Swift can be categorized into:
     - **Global Functions:** Named closures that do not capture any values.
     - **Nested Functions:** Named closures that capture values from their enclosing function.
     - **Closure Expressions:** Unnamed, lightweight closures written using a concise syntax.

---

## 4. **What is a closure expression in Swift?**
   - **Answer:**  
     A closure expression is a lightweight syntax for writing closures. It can capture values from the surrounding context and is often used inline. For example:
     ```swift
     let numbers = [1, 2, 3]
     let doubled = numbers.map { $0 * 2 } // Output: [2, 4, 6]
     ```

---

## 5. **What is trailing closure syntax in Swift?**
   - **Answer:**  
     Trailing closure syntax allows you to write a closure outside the parentheses of a function call if the closure is the last argument. For example:
     ```swift
     func performOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
         return operation(a, b)
     }
     let result = performOperation(2, 3) { $0 + $1 } // Output: 5
     ```

---

## 6. **What is shorthand argument syntax in closures?**
   - **Answer:**  
     Shorthand argument syntax allows you to refer to closure arguments using `$0`, `$1`, `$2`, etc., instead of explicitly naming them. For example:
     ```swift
     let numbers = [1, 2, 3]
     let squared = numbers.map { $0 * $0 } // Output: [1, 4, 9]
     ```

---

## 7. **What is the purpose of the `@escaping` attribute in Swift?**
   - **Answer:**  
     The `@escaping` attribute indicates that a closure can outlive the scope of the function it is passed to. It is often used for asynchronous operations. For example:
     ```swift
     func performAsyncTask(completion: @escaping () -> Void) {
         DispatchQueue.global().async {
             completion()
         }
     }
     ```

---

## 8. **What is the difference between `escaping` and `non-escaping` closures?**
   - **Answer:**  
     - **Non-escaping Closures:** Must be executed within the function body and cannot outlive the function's scope.
     - **Escaping Closures:** Can be stored and executed after the function returns, often used for asynchronous tasks.

---

## 9. **What is the purpose of the `@autoclosure` attribute in Swift?**
   - **Answer:**  
     The `@autoclosure` attribute automatically wraps an expression in a closure, allowing you to delay its evaluation. For example:
     ```swift
     func logIfTrue(_ condition: @autoclosure () -> Bool) {
         if condition() {
             print("True")
         }
     }
     logIfTrue(2 > 1) // Output: "True"
     ```

---

## 10. **What is the difference between `@autoclosure` and `@escaping`?**
   - **Answer:**  
     - `@autoclosure`: Wraps an expression in a closure to delay its evaluation.
     - `@escaping`: Indicates that a closure can outlive the scope of the function it is passed to.

---

## 11. **What is capturing values in closures?**
   - **Answer:**  
     Capturing values in closures means that a closure can capture and store references to variables and constants from the surrounding context. For example:
     ```swift
     func makeIncrementer(incrementAmount: Int) -> () -> Int {
         var total = 0
         let incrementer: () -> Int = {
             total += incrementAmount
             return total
         }
         return incrementer
     }
     let incrementByTwo = makeIncrementer(incrementAmount: 2)
     print(incrementByTwo()) // Output: 2
     print(incrementByTwo()) // Output: 4
     ```

---

## 12. **What is a closure capture list?**
   - **Answer:**  
     A closure capture list allows you to explicitly control how values are captured in a closure. It is written inside square brackets before the closure's parameter list. For example:
     ```swift
     var x = 10
     let closure = { [x] in
         print(x)
     }
     x = 20
     closure() // Output: 10 (captures the value of x at the time of closure creation)
     ```

---

## 13. **What is the purpose of the `weak` and `unowned` keywords in capture lists?**
   - **Answer:**  
     - `weak`: Used to capture a weak reference to an object, which avoids strong reference cycles. The captured object can become `nil`.
     - `unowned`: Used to capture an unowned reference to an object, which also avoids strong reference cycles but assumes the object will never be `nil`.
     Example:
     ```swift
     class MyClass {
         var closure: (() -> Void)?
         func setupClosure() {
             closure = { [weak self] in
                 print(self?.description ?? "Self is nil")
             }
         }
     }
     ```

---

## 14. **What is the difference between `weak` and `unowned` in capture lists?**
   - **Answer:**  
     - `weak`: The captured object can become `nil`, so it is always optional.
     - `unowned`: The captured object is assumed to never become `nil`, so it is non-optional.

---

## 15. **What is a strong reference cycle in closures?**
   - **Answer:**  
     A strong reference cycle occurs when a closure captures a strong reference to an object, and the object also holds a strong reference to the closure, preventing both from being deallocated. For example:
     ```swift
     class MyClass {
         var closure: (() -> Void)?
         func setupClosure() {
             closure = {
                 print(self.description) // Strong reference cycle
             }
         }
     }
     ```

---

## 16. **How do you break a strong reference cycle in closures?**
   - **Answer:**  
     You can break a strong reference cycle by using `weak` or `unowned` in the capture list. For example:
     ```swift
     class MyClass {
         var closure: (() -> Void)?
         func setupClosure() {
             closure = { [weak self] in
                 print(self?.description ?? "Self is nil")
             }
         }
     }
     ```

---

## 17. **What is the purpose of the `lazy` keyword with closures?**
   - **Answer:**  
     The `lazy` keyword delays the initialization of a property until it is first accessed. It is often used with closures to compute a value only when needed. For example:
     ```swift
     class MyClass {
         lazy var computedValue: Int = {
             return 42
         }()
     }
     ```

---

## 18. **What is the difference between `lazy` and `computed` properties?**
   - **Answer:**  
     - `lazy`: A property whose initial value is computed only when it is first accessed.
     - `computed`: A property whose value is computed every time it is accessed.

---

## 19. **What is the purpose of the `map` function with closures?**
   - **Answer:**  
     The `map` function applies a closure to each element of a collection and returns a new collection with the transformed values. For example:
     ```swift
     let numbers = [1, 2, 3]
     let squared = numbers.map { $0 * $0 } // Output: [1, 4, 9]
     ```

---

## 20. **What is the purpose of the `filter` function with closures?**
   - **Answer:**  
     The `filter` function applies a closure to each element of a collection and returns a new collection containing only the elements that satisfy the condition. For example:
     ```swift
     let numbers = [1, 2, 3, 4, 5]
     let evenNumbers = numbers.filter { $0 % 2 == 0 } // Output: [2, 4]
     ```

---

## 21. **What is the purpose of the `reduce` function with closures?**
   - **Answer:**  
     The `reduce` function combines all elements of a collection into a single value using a closure. For example:
     ```swift
     let numbers = [1, 2, 3, 4]
     let sum = numbers.reduce(0, +) // Output: 10
     ```

---

## 22. **What is the purpose of the `sorted` function with closures?**
   - **Answer:**  
     The `sorted` function sorts a collection using a closure that defines the sorting logic. For example:
     ```swift
     let numbers = [3, 1, 4, 2]
     let sortedNumbers = numbers.sorted { $0 < $1 } // Output: [1, 2, 3, 4]
     ```

---

## 23. **What is the purpose of the `forEach` function with closures?**
   - **Answer:**  
     The `forEach` function applies a closure to each element of a collection without returning a new collection. For example:
     ```swift
     let numbers = [1, 2, 3]
     numbers.forEach { print($0) } // Output: 1, 2, 3
     ```

---

## 24. **What is the purpose of the `compactMap` function with closures?**
   - **Answer:**  
     The `compactMap` function applies a closure to each element of a collection, transforms the elements, and removes `nil` values. For example:
     ```swift
     let strings = ["1", "2", "three"]
     let numbers = strings.compactMap { Int($0) } // Output: [1, 2]
     ```

---

## 25. **What is the purpose of the `flatMap` function with closures?**
   - **Answer:**  
     The `flatMap` function applies a closure to each element of a collection, transforms the elements, and flattens the resulting collection. For example:
     ```swift
     let numbers = [[1, 2], [3, 4]]
     let flattened = numbers.flatMap { $0 } // Output: [1, 2, 3, 4]
     ```

---

This concludes the interview questions and answers for the "Closures" section of Swift.

# Swift Enumerations - Interview Questions and Answers

This document contains interview questions and answers based on the "Enumerations" section of the Swift documentation.

---

## 1. **What is an enumeration in Swift?**
   - **Answer:**  
     An enumeration (or `enum`) is a user-defined data type that defines a group of related values. It allows you to work with those values in a type-safe way. For example:
     ```swift
     enum CompassDirection {
         case north, south, east, west
     }
     ```

---

## 2. **How do you define an enumeration in Swift?**
   - **Answer:**  
     An enumeration is defined using the `enum` keyword, followed by the name of the enumeration and its cases. For example:
     ```swift
     enum Weekday {
         case monday, tuesday, wednesday, thursday, friday
     }
     ```

---

## 3. **What are the benefits of using enumerations in Swift?**
   - **Answer:**  
     Enumerations provide several benefits:
     - **Type Safety:** Ensures that only valid values are used.
     - **Readability:** Makes code more expressive and self-documenting.
     - **Pattern Matching:** Works seamlessly with `switch` statements.

---

## 4. **What are raw values in enumerations?**
   - **Answer:**  
     Raw values are predefined values assigned to each case of an enumeration. They can be of type `String`, `Character`, `Int`, or `Float`. For example:
     ```swift
     enum Planet: Int {
         case mercury = 1, venus, earth, mars
     }
     let earth = Planet.earth
     print(earth.rawValue) // Output: 3
     ```

---

## 5. **What are associated values in enumerations?**
   - **Answer:**  
     Associated values allow you to store additional information along with an enumeration case. Each case can have different types and values. For example:
     ```swift
     enum Barcode {
         case upc(Int, Int, Int, Int)
         case qrCode(String)
     }
     let productBarcode = Barcode.upc(8, 85909, 51226, 3)
     ```

---

## 6. **What is the difference between raw values and associated values?**
   - **Answer:**  
     - **Raw Values:** Predefined values assigned to each case (e.g., `Int`, `String`).
     - **Associated Values:** Additional information stored with a case (e.g., tuples or custom types).

---

## 7. **How do you iterate over enumeration cases in Swift?**
   - **Answer:**  
     To iterate over enumeration cases, the enumeration must conform to the `CaseIterable` protocol. For example:
     ```swift
     enum Weekday: CaseIterable {
         case monday, tuesday, wednesday, thursday, friday
     }
     for day in Weekday.allCases {
         print(day)
     }
     ```

---

## 8. **What is a recursive enumeration in Swift?**
   - **Answer:**  
     A recursive enumeration is an enumeration that has another instance of the enumeration as an associated value for one or more of its cases. It is marked with the `indirect` keyword. For example:
     ```swift
     indirect enum ArithmeticExpression {
         case number(Int)
         case addition(ArithmeticExpression, ArithmeticExpression)
         case multiplication(ArithmeticExpression, ArithmeticExpression)
     }
     ```

---

## 9. **What is the purpose of the `indirect` keyword in enumerations?**
   - **Answer:**  
     The `indirect` keyword is used to indicate that an enumeration case is recursive, meaning it can hold another instance of the same enumeration as an associated value.

---

## 10. **How do you use enumerations with `switch` statements?**
   - **Answer:**  
     Enumerations work seamlessly with `switch` statements to handle each case. For example:
     ```swift
     enum CompassDirection {
         case north, south, east, west
     }
     let direction = CompassDirection.north
     switch direction {
     case .north:
         print("Heading north")
     case .south:
         print("Heading south")
     default:
         print("Other direction")
     }
     ```

---

## 11. **What is the purpose of the `@unknown` attribute in `switch` statements?**
   - **Answer:**  
     The `@unknown` attribute is used to handle future cases in a `switch` statement. It ensures that the code will not break if new cases are added to the enumeration. For example:
     ```swift
     enum CompassDirection {
         case north, south, east, west
     }
     let direction = CompassDirection.north
     switch direction {
     case .north:
         print("Heading north")
     @unknown default:
         print("Unknown direction")
     }
     ```

---

## 12. **What is the purpose of the `Self` keyword in enumerations?**
   - **Answer:**  
     The `Self` keyword refers to the type of the current enumeration. It is often used in methods or computed properties. For example:
     ```swift
     enum Weekday {
         case monday, tuesday, wednesday, thursday, friday
         func nextDay() -> Self {
             switch self {
             case .monday: return .tuesday
             case .tuesday: return .wednesday
             case .wednesday: return .thursday
             case .thursday: return .friday
             case .friday: return .monday
             }
         }
     }
     ```

---

## 13. **What is the purpose of the `rawValue` property in enumerations?**
   - **Answer:**  
     The `rawValue` property returns the raw value associated with an enumeration case. It is only available if the enumeration has raw values. For example:
     ```swift
     enum Planet: Int {
         case mercury = 1, venus, earth, mars
     }
     let earth = Planet.earth
     print(earth.rawValue) // Output: 3
     ```

---

## 14. **How do you initialize an enumeration from a raw value?**
   - **Answer:**  
     You can initialize an enumeration from a raw value using the `init?(rawValue:)` initializer. It returns `nil` if the raw value does not match any case. For example:
     ```swift
     enum Planet: Int {
         case mercury = 1, venus, earth, mars
     }
     if let planet = Planet(rawValue: 3) {
         print(planet) // Output: earth
     }
     ```

---

## 15. **What is the purpose of the `CaseIterable` protocol in enumerations?**
   - **Answer:**  
     The `CaseIterable` protocol allows you to iterate over all cases of an enumeration using the `allCases` property. For example:
     ```swift
     enum Weekday: CaseIterable {
         case monday, tuesday, wednesday, thursday, friday
     }
     for day in Weekday.allCases {
         print(day)
     }
     ```

---

## 16. **What is the purpose of the `Equatable` protocol in enumerations?**
   - **Answer:**  
     The `Equatable` protocol allows you to compare enumeration cases for equality. Enumerations automatically conform to `Equatable` if their cases do not have associated values. For example:
     ```swift
     enum CompassDirection {
         case north, south, east, west
     }
     let direction1 = CompassDirection.north
     let direction2 = CompassDirection.north
     print(direction1 == direction2) // Output: true
     ```

---

## 17. **What is the purpose of the `Hashable` protocol in enumerations?**
   - **Answer:**  
     The `Hashable` protocol allows enumeration cases to be used as keys in dictionaries or elements in sets. Enumerations automatically conform to `Hashable` if their cases do not have associated values. For example:
     ```swift
     enum CompassDirection: Hashable {
         case north, south, east, west
     }
     let directions: Set<CompassDirection> = [.north, .south]
     ```

---

## 18. **What is the purpose of the `Comparable` protocol in enumerations?**
   - **Answer:**  
     The `Comparable` protocol allows enumeration cases to be compared using relational operators (`<`, `>`, `<=`, `>=`). You must implement the `<` operator manually. For example:
     ```swift
     enum Weekday: Comparable {
         case monday, tuesday, wednesday, thursday, friday
         static func < (lhs: Weekday, rhs: Weekday) -> Bool {
             return lhs.rawValue < rhs.rawValue
         }
     }
     ```

---

## 19. **What is the purpose of the `Codable` protocol in enumerations?**
   - **Answer:**  
     The `Codable` protocol allows enumeration cases to be encoded and decoded to/from external representations like JSON. For example:
     ```swift
     enum Weekday: String, Codable {
         case monday, tuesday, wednesday, thursday, friday
     }
     let jsonData = try JSONEncoder().encode(Weekday.monday)
     let decodedDay = try JSONDecoder().decode(Weekday.self, from: jsonData)
     ```

---

## 20. **What is the purpose of the `CustomStringConvertible` protocol in enumerations?**
   - **Answer:**  
     The `CustomStringConvertible` protocol allows you to provide a custom string representation for enumeration cases. For example:
     ```swift
     enum Weekday: CustomStringConvertible {
         case monday, tuesday, wednesday, thursday, friday
         var description: String {
             switch self {
             case .monday: return "Monday"
             case .tuesday: return "Tuesday"
             case .wednesday: return "Wednesday"
             case .thursday: return "Thursday"
             case .friday: return "Friday"
             }
         }
     }
     print(Weekday.monday) // Output: "Monday"
     ```

---

## 21. **What is the purpose of the `CustomDebugStringConvertible` protocol in enumerations?**
   - **Answer:**  
     The `CustomDebugStringConvertible` protocol allows you to provide a custom debug description for enumeration cases. For example:
     ```swift
     enum Weekday: CustomDebugStringConvertible {
         case monday, tuesday, wednesday, thursday, friday
         var debugDescription: String {
             return "Debug: \(self)"
         }
     }
     print(Weekday.monday) // Output: "Debug: monday"
     ```

---

## 22. **What is the purpose of the `OptionSet` protocol in enumerations?**
   - **Answer:**  
     The `OptionSet` protocol allows enumeration cases to be used as a set of options. It is often used for bitmask-style options. For example:
     ```swift
     struct ShippingOptions: OptionSet {
         let rawValue: Int
         static let nextDay = ShippingOptions(rawValue: 1 << 0)
         static let secondDay = ShippingOptions(rawValue: 1 << 1)
         static let priority = ShippingOptions(rawValue: 1 << 2)
     }
     let options: ShippingOptions = [.nextDay, .priority]
     ```

---

## 23. **What is the purpose of the `Error` protocol in enumerations?**
   - **Answer:**  
     The `Error` protocol allows enumeration cases to represent errors. Enumerations are commonly used to define custom error types. For example:
     ```swift
     enum NetworkError: Error {
         case noConnection
         case serverError(String)
     }
     ```

---

## 24. **What is the purpose of the `Result` type in enumerations?**
   - **Answer:**  
     The `Result` type is an enumeration that represents either a success or a failure. It is commonly used in asynchronous operations. For example:
     ```swift
     enum Result<Success, Failure: Error> {
         case success(Success)
         case failure(Failure)
     }
     ```

---

## 25. **What is the purpose of the `Optional` type in enumerations?**
   - **Answer:**  
     The `Optional` type is an enumeration that represents either a value (`some`) or the absence of a value (`none`). It is used to handle optional values in Swift. For example:
     ```swift
     enum Optional<Wrapped> {
         case some(Wrapped)
         case none
     }
     ```

---

This concludes the interview questions and answers for the "Enumerations" section of Swift.

# Swift Classes and Structures - Interview Questions and Answers

This document contains interview questions and answers based on the "Classes and Structures" section of the Swift documentation.

---

## 1. **What is a class in Swift?**
   - **Answer:**  
     A class is a reference type that defines a blueprint for creating objects. It can have properties, methods, initializers, and can inherit from other classes. For example:
     ```swift
     class Person {
         var name: String
         init(name: String) {
             self.name = name
         }
     }
     ```

---

## 2. **What is a structure in Swift?**
   - **Answer:**  
     A structure is a value type that defines a blueprint for creating objects. It can have properties, methods, and initializers, but it cannot inherit from other structures or classes. For example:
     ```swift
     struct Point {
         var x: Int
         var y: Int
     }
     ```

---

## 3. **What is the difference between a class and a structure in Swift?**
   - **Answer:**  
     - **Class:** Reference type, supports inheritance, can have deinitializers, and uses reference counting.
     - **Structure:** Value type, does not support inheritance, and is copied when assigned or passed.

---

## 4. **What is the difference between value types and reference types?**
   - **Answer:**  
     - **Value Types:** Copied when assigned or passed (e.g., structures, enumerations, tuples).
     - **Reference Types:** Share a single instance when assigned or passed (e.g., classes).

---

## 5. **What is the purpose of the `init` method in classes and structures?**
   - **Answer:**  
     The `init` method is used to initialize an instance of a class or structure. It sets up the initial state of the object. For example:
     ```swift
     class Person {
         var name: String
         init(name: String) {
             self.name = name
         }
     }
     ```

---

## 6. **What is the purpose of the `deinit` method in classes?**
   - **Answer:**  
     The `deinit` method is used to perform cleanup tasks before an instance of a class is deallocated. It is only available in classes. For example:
     ```swift
     class Person {
         var name: String
         init(name: String) {
             self.name = name
         }
         deinit {
             print("\(name) is being deallocated")
         }
     }
     ```

---

## 7. **What is the difference between stored properties and computed properties?**
   - **Answer:**  
     - **Stored Properties:** Store values directly (e.g., `var x: Int`).
     - **Computed Properties:** Calculate values on the fly using a getter and optionally a setter (e.g., `var area: Double { return width * height }`).

---

## 8. **What is the purpose of the `lazy` keyword in properties?**
   - **Answer:**  
     The `lazy` keyword delays the initialization of a property until it is first accessed. It is useful for properties that require expensive computation. For example:
     ```swift
     class DataImporter {
         var filename = "data.txt"
     }
     class DataManager {
         lazy var importer = DataImporter()
     }
     ```

---

## 9. **What is the purpose of the `static` keyword in classes and structures?**
   - **Answer:**  
     The `static` keyword is used to define type-level properties and methods that belong to the type itself rather than an instance of the type. For example:
     ```swift
     struct Math {
         static let pi = 3.14159
     }
     print(Math.pi) // Output: 3.14159
     ```

---

## 10. **What is the purpose of the `mutating` keyword in structures?**
   - **Answer:**  
     The `mutating` keyword is used in methods of structures to indicate that the method modifies the instance's properties. For example:
     ```swift
     struct Point {
         var x: Int
         var y: Int
         mutating func moveBy(x deltaX: Int, y deltaY: Int) {
             x += deltaX
             y += deltaY
         }
     }
     ```

---

## 11. **What is the purpose of the `self` keyword in classes and structures?**
   - **Answer:**  
     The `self` keyword refers to the current instance of a class or structure. It is used to distinguish between instance properties and parameters with the same name. For example:
     ```swift
     class Person {
         var name: String
         init(name: String) {
             self.name = name
         }
     }
     ```

---

## 12. **What is the purpose of the `super` keyword in classes?**
   - **Answer:**  
     The `super` keyword is used in a subclass to refer to the superclass's properties, methods, or initializers. For example:
     ```swift
     class Vehicle {
         var speed: Int = 0
     }
     class Car: Vehicle {
         func accelerate() {
             super.speed += 10
         }
     }
     ```

---

## 13. **What is inheritance in Swift?**
   - **Answer:**  
     Inheritance allows a class to inherit properties, methods, and other characteristics from another class. The subclass can override or extend the behavior of the superclass. For example:
     ```swift
     class Vehicle {
         var speed: Int = 0
     }
     class Car: Vehicle {
         var gear: Int = 1
     }
     ```

---

## 14. **What is method overriding in Swift?**
   - **Answer:**  
     Method overriding allows a subclass to provide a custom implementation of a method that is already defined in its superclass. The `override` keyword is used to indicate overriding. For example:
     ```swift
     class Vehicle {
         func makeSound() {
             print("Vroom")
         }
     }
     class Car: Vehicle {
         override func makeSound() {
             print("Beep Beep")
         }
     }
     ```

---

## 15. **What is the purpose of the `final` keyword in classes?**
   - **Answer:**  
     The `final` keyword prevents a class, method, or property from being overridden or subclassed. For example:
     ```swift
     final class Vehicle {
         var speed: Int = 0
     }
     // class Car: Vehicle {} // Error: Cannot inherit from final class
     ```

---

## 16. **What is the purpose of the `required` keyword in initializers?**
   - **Answer:**  
     The `required` keyword indicates that every subclass must implement the designated initializer. For example:
     ```swift
     class Vehicle {
         var speed: Int
         required init(speed: Int) {
             self.speed = speed
         }
     }
     class Car: Vehicle {
         required init(speed: Int) {
             super.init(speed: speed)
         }
     }
     ```

---

## 17. **What is the purpose of the `convenience` keyword in initializers?**
   - **Answer:**  
     The `convenience` keyword is used to define a secondary initializer that calls a designated initializer. It provides additional ways to initialize an instance. For example:
     ```swift
     class Person {
         var name: String
         init(name: String) {
             self.name = name
         }
         convenience init() {
             self.init(name: "Unknown")
         }
     }
     ```

---

## 18. **What is the purpose of the `defer` statement in classes?**
   - **Answer:**  
     The `defer` statement is used to execute a block of code just before the current scope exits. It is often used for cleanup tasks. For example:
     ```swift
     class FileHandler {
         func processFile() {
             print("Step 1")
             defer {
                 print("Cleanup")
             }
             print("Step 2")
         }
     }
     ```

---

## 19. **What is the purpose of the `Equatable` protocol in classes and structures?**
   - **Answer:**  
     The `Equatable` protocol allows instances of a class or structure to be compared for equality using the `==` operator. For example:
     ```swift
     struct Point: Equatable {
         var x: Int
         var y: Int
     }
     let p1 = Point(x: 1, y: 2)
     let p2 = Point(x: 1, y: 2)
     print(p1 == p2) // Output: true
     ```

---

## 20. **What is the purpose of the `Hashable` protocol in classes and structures?**
   - **Answer:**  
     The `Hashable` protocol allows instances of a class or structure to be used as keys in dictionaries or elements in sets. For example:
     ```swift
     struct Point: Hashable {
         var x: Int
         var y: Int
     }
     let points: Set<Point> = [Point(x: 1, y: 2)]
     ```

---

## 21. **What is the purpose of the `Codable` protocol in classes and structures?**
   - **Answer:**  
     The `Codable` protocol allows instances of a class or structure to be encoded and decoded to/from external representations like JSON. For example:
     ```swift
     struct Person: Codable {
         var name: String
         var age: Int
     }
     let jsonData = try JSONEncoder().encode(Person(name: "John", age: 30))
     let decodedPerson = try JSONDecoder().decode(Person.self, from: jsonData)
     ```

---

## 22. **What is the purpose of the `CustomStringConvertible` protocol in classes and structures?**
   - **Answer:**  
     The `CustomStringConvertible` protocol allows you to provide a custom string representation for instances of a class or structure. For example:
     ```swift
     struct Point: CustomStringConvertible {
         var x: Int
         var y: Int
         var description: String {
             return "(x: \(x), y: \(y))"
         }
     }
     print(Point(x: 1, y: 2)) // Output: "(x: 1, y: 2)"
     ```

---

## 23. **What is the purpose of the `CustomDebugStringConvertible` protocol in classes and structures?**
   - **Answer:**  
     The `CustomDebugStringConvertible` protocol allows you to provide a custom debug description for instances of a class or structure. For example:
     ```swift
     struct Point: CustomDebugStringConvertible {
         var x: Int
         var y: Int
         var debugDescription: String {
             return "Debug: (x: \(x), y: \(y))"
         }
     }
     print(Point(x: 1, y: 2)) // Output: "Debug: (x: 1, y: 2)"
     ```

---

## 24. **What is the purpose of the `NSCopying` protocol in classes?**
   - **Answer:**  
     The `NSCopying` protocol allows instances of a class to be copied. It is often used in Objective-C interoperability. For example:
     ```swift
     class Person: NSCopying {
         var name: String
         init(name: String) {
             self.name = name
         }
         func copy(with zone: NSZone? = nil) -> Any {
             return Person(name: name)
         }
     }
     ```

---

## 25. **What is the purpose of the `NSObject` class in Swift?**
   - **Answer:**  
     The `NSObject` class is the root class for most Objective-C classes. It provides basic functionality like memory management and key-value coding. It is often used in Objective-C interoperability. For example:
     ```swift
     class Person: NSObject {
         var name: String
         init(name: String) {
             self.name = name
         }
     }
     ```

---

This concludes the interview questions and answers for the "Classes and Structures" section of Swift.

# Swift Properties - Interview Questions and Answers

This document contains interview questions and answers based on the "Properties" section of the Swift documentation.

---

## 1. **What is a property in Swift?**
   - **Answer:**  
     A property is a value associated with a class, structure, or enumeration. It can be a **stored property** (stores a value) or a **computed property** (calculates a value). For example:
     ```swift
     struct Person {
         var name: String // Stored property
         var age: Int // Stored property
     }
     ```

---

## 2. **What is the difference between stored properties and computed properties?**
   - **Answer:**  
     - **Stored Properties:** Store values directly (e.g., `var x: Int`).
     - **Computed Properties:** Calculate values on the fly using a getter and optionally a setter (e.g., `var area: Double { return width * height }`).

---

## 3. **What is a lazy stored property?**
   - **Answer:**  
     A lazy stored property is a property whose initial value is not calculated until it is first accessed. It is useful for properties that require expensive computation. For example:
     ```swift
     class DataImporter {
         var filename = "data.txt"
     }
     class DataManager {
         lazy var importer = DataImporter()
     }
     ```

---

## 4. **What is the purpose of the `lazy` keyword in properties?**
   - **Answer:**  
     The `lazy` keyword delays the initialization of a property until it is first accessed. It is useful for properties that require expensive computation or depend on external resources.

---

## 5. **What is a computed property in Swift?**
   - **Answer:**  
     A computed property does not store a value directly but provides a getter and optionally a setter to compute a value based on other properties. For example:
     ```swift
     struct Rectangle {
         var width: Double
         var height: Double
         var area: Double {
             return width * height
         }
     }
     ```

---

## 6. **What is the difference between a getter and a setter in computed properties?**
   - **Answer:**  
     - **Getter:** Computes and returns the value of the property.
     - **Setter:** Updates the value of the property or related properties.
     Example:
     ```swift
     struct Square {
         var sideLength: Double
         var area: Double {
             get {
                 return sideLength * sideLength
             }
             set {
                 sideLength = sqrt(newValue)
             }
         }
     }
     ```

---

## 7. **What is a read-only computed property?**
   - **Answer:**  
     A read-only computed property has a getter but no setter. It can only be accessed, not modified. For example:
     ```swift
     struct Circle {
         var radius: Double
         var area: Double {
             return Double.pi * radius * radius
         }
     }
     ```

---

## 8. **What is a property observer?**
   - **Answer:**  
     A property observer observes and responds to changes in a property's value. It can be `willSet` (called before the value is set) or `didSet` (called after the value is set). For example:
     ```swift
     class StepCounter {
         var totalSteps: Int = 0 {
             willSet(newTotalSteps) {
                 print("About to set totalSteps to \(newTotalSteps)")
             }
             didSet {
                 if totalSteps > oldValue {
                     print("Added \(totalSteps - oldValue) steps")
                 }
             }
         }
     }
     ```

---

## 9. **What is the difference between `willSet` and `didSet`?**
   - **Answer:**  
     - **`willSet`:** Called before the property's value is set. It provides the new value.
     - **`didSet`:** Called after the property's value is set. It provides the old value.

---

## 10. **What is a type property in Swift?**
   - **Answer:**  
     A type property is a property that belongs to the type itself rather than an instance of the type. It is declared using the `static` keyword (or `class` for classes). For example:
     ```swift
     struct Math {
         static let pi = 3.14159
     }
     print(Math.pi) // Output: 3.14159
     ```

---

## 11. **What is the difference between `static` and `class` properties?**
   - **Answer:**  
     - **`static`:** Used for type properties in structures and enumerations, or for non-overridable type properties in classes.
     - **`class`:** Used for overridable type properties in classes.

---

## 12. **What is a property wrapper in Swift?**
   - **Answer:**  
     A property wrapper is a feature that allows you to define reusable logic for property access and storage. It is declared using the `@propertyWrapper` attribute. For example:
     ```swift
     @propertyWrapper
     struct Capitalized {
         private var value: String = ""
         var wrappedValue: String {
             get { value }
             set { value = newValue.capitalized }
         }
         init(wrappedValue: String) {
             self.wrappedValue = wrappedValue
         }
     }
     struct Person {
         @Capitalized var name: String
     }
     ```

---

## 13. **What is the purpose of the `wrappedValue` in property wrappers?**
   - **Answer:**  
     The `wrappedValue` is the actual value being managed by the property wrapper. It is accessed and modified through the property wrapper.

---

## 14. **What is the purpose of the `projectedValue` in property wrappers?**
   - **Answer:**  
     The `projectedValue` provides additional functionality or metadata about the wrapped value. It is accessed using the `$` prefix. For example:
     ```swift
     @propertyWrapper
     struct Capitalized {
         private var value: String = ""
         var wrappedValue: String {
             get { value }
             set { value = newValue.capitalized }
         }
         var projectedValue: String {
             return "Projected: \(value)"
         }
     }
     struct Person {
         @Capitalized var name: String
     }
     let person = Person(name: "john")
     print(person.$name) // Output: "Projected: John"
     ```

---

## 15. **What is the purpose of the `@ObservedObject` property wrapper?**
   - **Answer:**  
     The `@ObservedObject` property wrapper is used in SwiftUI to bind a property to an observable object. It automatically updates the view when the observed object changes. For example:
     ```swift
     class UserSettings: ObservableObject {
         @Published var username = "John"
     }
     struct ContentView: View {
         @ObservedObject var settings = UserSettings()
         var body: some View {
             Text("Hello, \(settings.username)!")
         }
     }
     ```

---

## 16. **What is the purpose of the `@State` property wrapper?**
   - **Answer:**  
     The `@State` property wrapper is used in SwiftUI to manage the state of a view. It automatically updates the view when the state changes. For example:
     ```swift
     struct ContentView: View {
         @State private var isOn = false
         var body: some View {
             Toggle("Toggle", isOn: $isOn)
         }
     }
     ```

---

## 17. **What is the purpose of the `@Binding` property wrapper?**
   - **Answer:**  
     The `@Binding` property wrapper is used in SwiftUI to bind a property to a state variable in a parent view. It allows child views to modify the state of the parent view. For example:
     ```swift
     struct ChildView: View {
         @Binding var isOn: Bool
         var body: some View {
             Toggle("Toggle", isOn: $isOn)
         }
     }
     ```

---

## 18. **What is the purpose of the `@EnvironmentObject` property wrapper?**
   - **Answer:**  
     The `@EnvironmentObject` property wrapper is used in SwiftUI to access shared data across multiple views. It automatically updates the view when the environment object changes. For example:
     ```swift
     class UserSettings: ObservableObject {
         @Published var username = "John"
     }
     struct ContentView: View {
         @EnvironmentObject var settings: UserSettings
         var body: some View {
             Text("Hello, \(settings.username)!")
         }
     }
     ```

---

## 19. **What is the purpose of the `@Published` property wrapper?**
   - **Answer:**  
     The `@Published` property wrapper is used in observable objects to automatically notify subscribers when the property changes. It is commonly used in SwiftUI. For example:
     ```swift
     class UserSettings: ObservableObject {
         @Published var username = "John"
     }
     ```

---

## 20. **What is the purpose of the `@AppStorage` property wrapper?**
   - **Answer:**  
     The `@AppStorage` property wrapper is used in SwiftUI to store and retrieve values from `UserDefaults`. It automatically updates the view when the value changes. For example:
     ```swift
     struct ContentView: View {
         @AppStorage("username") var username = "John"
         var body: some View {
             Text("Hello, \(username)!")
         }
     }
     ```

---

## 21. **What is the purpose of the `@SceneStorage` property wrapper?**
   - **Answer:**  
     The `@SceneStorage` property wrapper is used in SwiftUI to store and retrieve scene-specific state. It automatically updates the view when the value changes. For example:
     ```swift
     struct ContentView: View {
         @SceneStorage("selectedTab") var selectedTab = 0
         var body: some View {
             Text("Selected Tab: \(selectedTab)")
         }
     }
     ```

---

## 22. **What is the purpose of the `@FocusState` property wrapper?**
   - **Answer:**  
     The `@FocusState` property wrapper is used in SwiftUI to manage focus state in text fields and other focusable views. For example:
     ```swift
     struct ContentView: View {
         @FocusState private var isFocused: Bool
         var body: some View {
             TextField("Enter text", text: .constant(""))
                 .focused($isFocused)
         }
     }
     ```

---

## 23. **What is the purpose of the `@GestureState` property wrapper?**
   - **Answer:**  
     The `@GestureState` property wrapper is used in SwiftUI to manage temporary state during a gesture. It resets to its initial value when the gesture ends. For example:
     ```swift
     struct ContentView: View {
         @GestureState private var isPressed = false
         var body: some View {
             Rectangle()
                 .fill(isPressed ? Color.red : Color.blue)
                 .gesture(
                     LongPressGesture(minimumDuration: 1)
                         .updating($isPressed) { value, state, _ in
                             state = value
                         }
                 )
         }
     }
     ```

---

## 24. **What is the purpose of the `@Namespace` property wrapper?**
   - **Answer:**  
     The `@Namespace` property wrapper is used in SwiftUI to create a namespace for matched geometry effects. It allows smooth transitions between views. For example:
     ```swift
     struct ContentView: View {
         @Namespace private var animation
         @State private var isFlipped = false
         var body: some View {
             VStack {
                 if isFlipped {
                     Rectangle()
                         .matchedGeometryEffect(id: "shape", in: animation)
                         .frame(width: 100, height: 100)
                 } else {
                     Circle()
                         .matchedGeometryEffect(id: "shape", in: animation)
                         .frame(width: 100, height: 100)
                 }
                 Button("Flip") {
                     isFlipped.toggle()
                 }
             }
         }
     }
     ```

---

## 25. **What is the purpose of the `@FetchRequest` property wrapper?**
   - **Answer:**  
     The `@FetchRequest` property wrapper is used in SwiftUI to fetch data from Core Data. It automatically updates the view when the data changes. For example:
     ```swift
     struct ContentView: View {
         @FetchRequest(
             entity: Task.entity(),
             sortDescriptors: [NSSortDescriptor(keyPath: \Task.name, ascending: true)]
         ) var tasks: FetchedResults<Task>
         var body: some View {
             List(tasks, id: \.self) { task in
                 Text(task.name ?? "Unknown")
             }
         }
     }
     ```

---

This concludes the interview questions and answers for the "Properties" section of Swift.


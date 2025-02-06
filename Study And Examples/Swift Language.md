# Swift

## Language Guide

### The Basics
Swift is a type-safe language, which means the language helps you to be clear about the types of values your code can work with.

#### Declaring Constants and Variables
```swift
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
```

You can declare multiple constants or multiple variables on a single line, separated by commas.

```swift
var x = 0.0, y = 0.0, z = 0.0
```
#### Type Annotations

You can provide a type annotation when you declare a constant or variable, to be clear about the kind of values the constant or variable can store.

```swift
var welcomeMessage: String
```

You can define multiple related variables of the same type on a single line, separated by commas, with a single type annotation after the final variable name.

```swift
var red, green, blue: Double
```

#### Naming Constatns And Variables

Constant and variable names can contain almost any character, including Unicode characters.

```swift
var π = 3.14159
var 你好 = "你好世界"
var 🐶🐮 = "dogcow"

let crazyStringCount: Int = String(["\(π)", 你好, 🐶🐮].joined(separator: " ")).count
```

#### Semicolons

Unlike many other languages, Swift doesn’t require you to write a semicolon (;) after each statement in your code, although you can do so if you wish. However, semicolons are required if you want to write multiple separate statements on a single line.

```swift
let cat = "🐱"; print(cat)
```

#### Integers

Swift provides signed and unsigned integers in 8, 16, 32, and 64 bit forms. These integers follow a naming convention similar to C, in that an 8-bit unsigned integer is of type UInt8, and a 32-bit signed integer is of type Int32. Like all types in Swift, these integer types have capitalized names.

#### Integer Bounds

You can access the minimum and maximum values of each integer type with its min and max properties.

```swift
let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8
```

#### Type Safety and Type Inference

Swift is a type-safe language. A type safe language encourages you to be clear about the types of values your code can work with. If part of your code requires a String, you can’t pass it an Int by mistake.

Because Swift is type safe, it performs type checks when compiling your code and flags any mismatched types as errors. This enables you to catch and fix errors as early as possible in the development process.

If you don’t specify the type of value you need, Swift uses type inference to work out the appropriate type. Type inference enables a compiler to deduce the type of a particular expression automatically when it compiles your code, simply by examining the values you provide.

If you assign a literal value of 42 to a new constant without saying what type it is, Swift infers that you want the constant to be an Int, because you have initialized it with a number that looks like an intege.

```swift
let meaningOfLife = 42 // meaningOfLife is inferred to be of type Int
```

If you don’t specify a type for a floating-point literal, Swift infers that you want to create a Double.

```swift
let pi = 3.14159 // pi is inferred to be of type Double
```

If you combine integer and floating-point literals in an expression, a type of Double will be inferred from the context.

```swift
let anotherPi = 3 + 0.14159 // anotherPi is also inferred to be of type Double
```

#### Numeric Literals

Integer literals can be written as:
- A decimal number, with no prefix
- A binary number, with a `0b` prefix
- An octal number, with a `0o` prefix
- A hexadecimal number, with a `0x` prefix

```swift
let decimalInteger = 17 // 17 in decimal notation
let binaryInteger = 0b10001 // 17 in binary notation
let octalInteger = 0o21 // 17 in octal notation
let hexadecimalInteger = 0x11 // 17 in hexadecimal notation
```

Floating-point literals can be decimal (with no prefix), or hexadecimal (with a 0x prefix). They must always have a number (or hexadecimal number) on both sides of the decimal point. Decimal floats can also have an optional exponent, indicated by an uppercase or lowercase e; hexadecimal floats must have an exponent, indicated by an uppercase or lowercase p

```swift
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
```

Numeric literals can contain extra formatting to make them easier to read. Both integers and floats can be padded with extra zeros and can contain underscores to help with readability. Neither type of formatting affects the underlying value of the literal.

```swift
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
```

#### Type Aliases

Type aliases define an alternative name for an existing type. You define type aliases with the typealias keyword.
Type aliases are useful when you want to refer to an existing type by a name that’s contextually more appropriate, such as when working with data of a specific size from an external source.

```swift
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min // maxAmplitudeFound is now 0
```

#### Booleans

Swift has a basic Boolean type, called Bool. Boolean values are referred to as logical, because they can only ever be true or false. Swift provides two Boolean constant values, true and false

```swift
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
  print("Mmm, tasty turnips!")
} else {
  print("Eww, turnips are horrible.")
}
```

#### Tuples

Tuples group multiple values into a single compound value. The values within a tuple can be of any type and don’t have to be of the same type as each other.

```swift
let http404Error = (404, "Not Found")
```

You can decompose a tuple’s contents into separate constants or variables, which you then access as usual

```swift
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"
```

If you only need some of the tuple’s values, ignore parts of the tuple with an underscore (_) when you decompose the tuple

```swift
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// Prints "The status code is 404"
```

Alternatively, access the individual element values in a tuple using index numbers starting at zero

```swift
print("The status code is \(http404Error.0)")
// Prints "The status code is 404"
print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found"
```

You can name the individual elements in a tuple when the tuple is defined

```swift
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
// Prints "The status code is 200"
print("The status message is \(http200Status.description)")
// Prints "The status message is OK"
```

#### Optionals

You use optionals in situations where a value may be absent. An optional represents two possibilities: Either there is a value, and you can unwrap the optional to access that value, or there isn’t a value at all

The concept of optionals doesn’t exist in C or Objective-C. For these types, Objective-C methods typically return a special value (such as NSNotFound) to indicate the absence of a value. Swift’s optionals let you indicate the absence of a value for any type at all, without the need for special constants.

The example below uses the initializer to try to convert a String into an Int
Because the initializer might fail, it returns an optional Int, rather than an Int. An optional Int is written as Int?, not Int. The question mark indicates that the value it contains is optional, meaning that it might contain some Int value, or it might contain no value at all.

```swift
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int"
```

#### Nil

You set an optional variable to a valueless state by assigning it the special value ni.

```swift
var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value
```

#### If Statements and Forced Unwrapping

You can use an if statement to find out whether an optional contains a value by comparing the optional against nil. You perform this comparison with the “equal to” operator (==) or the “not equal to” operator (!=).
If an optional has a value, it’s considered to be “not equal to” nil

```swift
if convertedNumber != nil {
  print("convertedNumber contains some integer value.")
}
// Prints "convertedNumber contains some integer value."

if convertedNumber != nil {
  // The exclamation point effectively says, “I know that this optional definitely has a value; please use it.” This is known as forced unwrapping of the optional’s value
  print("convertedNumber has an integer value of \(convertedNumber!).")
}
// Prints "convertedNumber has an integer value of 123."
```

#### Optional Binding

You use optional binding to find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable.

```swift
if let actualNumber = Int(possibleNumber) {
  print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
  print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"
```

If you don’t need to refer to the original, optional constant or variable after accessing the value it contains, you can use the same name for the new constant or variable

### Basic Operators

#### Assignment Operator

```swift
let b = 10
var a = 5
a = b

let (x,y) = (1,2)
```

#### Arithmetic Operatos

```swift
1 + 2   // Equals 3
5 - 3   // Equals 2
2 * 3   // Equals 6
10.0 / 2.5  //Equals 4
"Hello, " + "World" // Equals "Hello, World"
```

#### Remainder operator (a % b)

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

#### Compound Assignment Operators

```swift
a = 1
a += 2  // a is now equal to 3 (a = a + 2)
```

#### Comparison Operatos

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

#### Ternary Conditional Operator (question ? answer1 : answer2)

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

#### Nil-CoalescingOperator (a ?? b)

```swift
//a != nil ? a! : b

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
```

#### Range Operators

##### Closed Range Operator (a...b)
Defines a range that runs from a to b, and include the values a and b.

```swift
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

 #### Half-Open Range Operator (a..<b)
// Defines a range that runs from a to b, but doesn't include b.

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

##### One-Sided Ranges

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

#### Logical Operators

##### Logical NOT Operator (!a)

```swift
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"
```

##### Logical AND Operator (a && b)

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

##### Logical OR Operator (a || b)

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

### Strings And Characters

#### String Literal

You can include predefined String values within your code as string literals. A string literal is a sequence of characters surrounded by double quotation marks (")
 
```swift
let someString = "Some string literal value"
print("==== SomeString ====")
print(someString)
```

#### Multiline String Literals

A sequence of characters surrounded by three double quotation marks
 
```swift
var quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print("==== Quotation ====")
print(quotation)

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
print("==== SingleLineString & MultilineString ====")
print(singleLineString)
print(multilineString)

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print("==== Soft Wrapped Quotation ====")
print(softWrappedQuotation)

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
print("==== Line Breaks ====")
print(lineBreaks)
```

#### Special Characters in String Literal

String literals can include the following special characters:
The escaped special characters \0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quotation mark) and \' (single quotation mark)
An arbitrary Unicode scalar value, written as \\u{n}, where n is a 1–8 digit hexadecimal number (Unicode is discussed in Unicode below)
 
```swift
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496
```

Because multiline string literals use three double quotation marks instead of just one, you can include a double quotation mark (") inside of a multiline string literal without escaping it. To include the text """ in a multiline string, escape at least one of the quotation marks.
 
```swift
//let threeDoubleQuotationMarks = """
//Escaping the first quotation mark \"""
//Escaping all three quotation marks \"\"\"
//"""
```

#### Extended String Delimiters
 
You can place a string literal within extended delimiters to include special characters in a string without invoking their effect. You place your string within quotation marks (") and surround that with number signs (#). For example, printing the string literal #"Line 1\nLine 2"# prints the line feed escape sequence (\n) rather than printing the string across two lines.

If you need the special effects of a character in a string literal, match the number of number signs within the string following the escape character (\). For example, if your string is #"Line 1\nLine 2"# and you want to break the line, you can use #"Line 1\#nLine 2"# instead. Similarly, ###"Line1\###nLine2"### also breaks the line.

String literals created using extended delimiters can also be multiline string literals. You can use extended delimiters to include the text """ in a multiline string, overriding the default behavior that ends the literal.
 
```swift
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
```

#### Initializing an Empty String

To create an empty String value as the starting point for building a longer string, either assign an empty string literal to a variable or initialize a new String instance with initializer syntax.
 
```swift
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other
```

#### String Mutability

You indicate whether a particular String can be modified (or mutated) by assigning it to a variable (in which case it can be modified), or to a constant (in which case it can’t be modified).
 
```swift
var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified
```

#### String are Value Types

Swift’s String type is a value type. If you create a new String value, that String value is copied when it’s passed to a function or method, or when it’s assigned to a constant or variable. In each case, a new copy of the existing String value is created, and the new copy is passed or assigned, not the original version.
 
```swift
let stringOne = "Test"
var stringTwo = stringOne
print("\(stringOne) is equal to \(stringTwo)")
stringTwo = "Test Two"
print("\(stringOne) now is diferent to \(stringTwo)")
```

#### Working With Characters

You can access the individual Character values for a String by iterating over the string with a for-in loop.
 
```swift
for character in "Dog!🐶" {
  print(character)
}
```

Alternatively, you can create a stand-alone Character constant or variable from a single-character string literal by providing a Character type annotation.
 
```swift
let exclamationMark: Character = "!"
```
 
`String` values can be constructed by passing an array of `Character` values as an argument to its initializer.
 
```swift
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"
```

#### Concatenating Strings and Characters

`String` values can be added together (or concatenated) with the addition operator (+) to create a new `String` value.
 
```swift
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome now equals "hello there"
```

You can also append a String value to an existing String variable with the addition assignment operator (`+=`).
 
```swift
var instruction = "look over"
instruction += string2
// instruction now equals "look over there"
```

You can append a Character value to a String variable with the String type’s append() method.
 
```swift
welcome.append(exclamationMark)
```

#### String Interpolation
 
String interpolation is a way to construct a new String value from a mix of constants, variables, literals, and expressions by including their values inside a string literal. You can use string interpolation in both single-line and multiline string literals.
 
```swift
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"
```

To use string interpolation inside a string that uses extended delimiters, match the number of number signs after the backslash to the number of number signs at the beginning and end of the string.
 
```swift
print(#"6 times 7 is \#(6 * 7)."#)
// Prints "6 times 7 is 42."
```

#### Unicode
 
Unicode is an international standard for encoding, representing, and processing text in different writing systems. It enables you to represent almost any character from any language in a standardized form, and to read and write those characters to and from an external source such as a text file or web page.
 
```swift
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by
// eAcute is é, combinedEAcute is é

let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한

let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute is é⃝

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS is 🇺🇸
```

#### Counting Characters
 
To retrieve a count of the Character values in a string, use the count property of the string
 
```swift
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// Prints "unusualMenagerie has 40 characters"
```
 
Note that Swift’s use of extended grapheme clusters for Character values means that string concatenation and modification may not always affect a string’s character count.
 
```swift
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"
```

#### Accessing and Modifying a String

You access and modify a string through its methods and properties, or by using subscript syntax. 

##### String Indices

Each String value has an associated index type, String.Index, which corresponds to the position of each Character in the string.
 
```swift
var greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a
```

Use the indices property to access all of the indices of individual characters in a string.
 
```swift
for index in greeting.indices {
  print("\(greeting[index]) ", terminator: "")
}
```

##### Inserting and Removing

To insert a single character into a string at a specified index, use the insert(_:at:) method, and to insert the contents of another string at a specified index, use the insert(contentsOf:at:) method.
 
```swift
welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome now equals "hello"
```

##### Substrings

When you get a substring from a string — for example, using a subscript or a method like prefix(_:) — the result is an instance of Substring, not another string. Substrings in Swift have most of the same methods as strings, which means you can work with substrings the same way you work with strings. However, unlike strings, you use substrings for only a short amount of time while performing actions on a string. When you’re ready to store the result for a longer time, you convert the substring to an instance of String.
 
```swift
greeting = "Hello, world!"
let englishGreetingIndex = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<englishGreetingIndex]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)
```

##### Comparing Strings

Swift provides three ways to compare textual values: string and character equality, prefix equality, and suffix equality.
 
##### String and Character Equality

String and character equality is checked with the “equal to” operator (==) and the “not equal to” operator (!=).
 
```swift
quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
  print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"
```
 
Two String values (or two Character values) are considered equal if their extended grapheme clusters are canonically equivalent. Extended grapheme clusters are canonically equivalent if they have the same linguistic meaning and appearance, even if they’re composed from different Unicode scalars behind the scenes.
 
```swift
// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
  print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"
```
 
Conversely, LATIN CAPITAL LETTER A (U+0041, or "A"), as used in English, is not equivalent to CYRILLIC CAPITAL LETTER A (U+0410, or "А"), as used in Russian. The characters are visually similar, but don’t have the same linguistic meaning.
 
```swift
let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
  print("These two characters aren't equivalent.")
}
// Prints "These two characters aren't equivalent."
```

##### Prefix and Suffix Equality

To check whether a string has a particular string prefix or suffix, call the string’s hasPrefix(_:) and hasSuffix(_:) methods, both of which take a single argument of type String and return a Boolean value.
 
```swift
let romeoAndJuliet = [
  "Act 1 Scene 1: Verona, A public place",
  "Act 1 Scene 2: Capulet's mansion",
  "Act 1 Scene 3: A room in Capulet's mansion",
  "Act 1 Scene 4: A street outside Capulet's mansion",
  "Act 1 Scene 5: The Great Hall in Capulet's mansion",
  "Act 2 Scene 1: Outside Capulet's mansion",
  "Act 2 Scene 2: Capulet's orchard",
  "Act 2 Scene 3: Outside Friar Lawrence's cell",
  "Act 2 Scene 4: A street in Verona",
  "Act 2 Scene 5: Capulet's mansion",
  "Act 2 Scene 6: Friar Lawrence's cell"
]
```
 
You can use the hasPrefix(_:) method with the romeoAndJuliet array to count the number of scenes in Act 1 of the play
 
```swift
var act1SceneCount = 0
for scene in romeoAndJuliet {
  if scene.hasPrefix("Act 1 ") {
      act1SceneCount += 1
  }
}
print("There are \(act1SceneCount) scenes in Act 1")
// Prints "There are 5 scenes in Act 1"
```

Similarly, use the hasSuffix(_:) method to count the number of scenes that take place in or around Capulet’s mansion and Friar Lawrence’s cell
 
```swift
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
  if scene.hasSuffix("Capulet's mansion") {
      mansionCount += 1
  } else if scene.hasSuffix("Friar Lawrence's cell") {
      cellCount += 1
  }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Prints "6 mansion scenes; 2 cell scenes"
```

#### UTF-8 Representation
 
You can access a UTF-8 representation of a String by iterating over its utf8 property. This property is of type String.UTF8View, which is a collection of unsigned 8-bit (UInt8) values, one for each byte in the string’s UTF-8 representation
 
```swift
let dogString = "Dog‼🐶"
for codeUnit in dogString.utf8 {
  print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 226 128 188 240 159 144 182 "
```

#### UTF-16 Representation

You can access a UTF-16 representation of a String by iterating over its utf16 property. This property is of type String.UTF16View, which is a collection of unsigned 16-bit (UInt16) values, one for each 16-bit code unit in the string’s UTF-16 representation.
 
```swift
for codeUnit in dogString.utf16 {
  print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 55357 56374 "
```

#### Unicode Scalar Representation

You can access a Unicode scalar representation of a String value by iterating over its unicodeScalars property. This property is of type UnicodeScalarView, which is a collection of values of type UnicodeScalar.
Each UnicodeScalar has a value property that returns the scalar’s 21-bit value, represented within a UInt32 value.
 
```swift
for scalar in dogString.unicodeScalars {
  print("\(scalar.value) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 128054 "

for scalar in dogString.unicodeScalars {
  print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶
```

### Collection Types

Swift provides three primary collection types, known as arrays, sets, and dictionaries, for storing collections of values.
- Arrays are ordered collections of values.
- Sets are unordered collections of unique values.
- Dictionaries are unordered collections of key-value associations.

#### Mutability of Collections

It's good practice to create immutable collections in all cases where the collection doesn't neet to chenge becaouse it enables the Swift compiler to optimize the performance of the collections you create

```swift
print("\n=====")
print("Array")
print("=====\n")
```

#### Arrays

An array soteres values of the same type in an ordered list. The same value can appear ina an array multiple times at different positions

#### Creating an Empty Array

```swift
var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)
print("someInts is of type [Int] with \(someInts.count) items.")
someInts = []
print("someInts is of type [Int] with \(someInts.count) items.")
```

#### Creating an Array with a Default Value

```swift
var threeDoubles = Array(repeating: 0.0, count: 3)
print("threeDoubles is of type [Double] with \(threeDoubles.count) items.")
```

#### Creating an Array by Adding Two Arrays Together

```swift
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
print("anotherThreeDoubles is of type [Double] with \(anotherThreeDoubles.count) items.")

var sixDoubles = threeDoubles + anotherThreeDoubles
print("sixDoubles is of type [Double] with \(sixDoubles.count) items.")
```

#### Creating an Array with an Array Literal

```swift
var shoppingList: [String] = ["Eggs", "Milk"]
```

#### Accessing and Modifying an Array

##### Find the number of items

```swift
print("The shopping list contains \(shoppingList.count) items.")
```

Use the Bool isEmpty as a shortcut for checking whether the count property is equal to 0

```swift
if shoppingList.isEmpty {
  print("The shopping list is empty.")
} else {
  print("The shopping list is't empty.")
}
```

##### Adding new items

```swift
shoppingList.append("Flour")
shoppingList += ["Banking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
```

##### Retrieving values

```swift
var firstItem = shoppingList[0] // shoppingList.first
shoppingList[0] = "Six eggs"

print(shoppingList)
shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList)

shoppingList.insert("Maple Syrup", at: 0)
print(shoppingList)
```

##### Removing Items

```swift
let mapleSyrup = shoppingList.remove(at: 0)
print(shoppingList)

let apples = shoppingList.removeLast()
print(shoppingList)
```

#### Iterating Over an Array

```swift
for item in shoppingList {
  print(item)
}

for (index, value) in shoppingList.enumerated() {
  print("Item \(index + 1): \(value)")
}

print("\n====")
print("Sets")
print("====\n")
```

#### Sets

A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items isn't important, or when you need to ensure that an item only appears once

#### Hash Values for Set Types

All of Swift's basic types (such as String, Int, Double and Bool) are hashable by default, you can use your custom types as set value types or dictionary key types by making them conform the Hashable protocol

#### Creating and Initializing an Empty Set

The type of the letters variable is inferred to be Set<Character>, from the type of the initizlizer

```swift
var letters: Set<Character> = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
```

##### Insertgin new values

```swift
letters.insert("a")
print("letters is of type Set<Character> with \(letters.count) items.")
letters = []
print("letters is of type Set<Character> with \(letters.count) items.")
```

#### Creating a Set with an Array Literal

Because of Swit's type inference, you don't have to write the type of the Set's elements if you're initializing it with an array literal that contains values of just one type.

```swift
var favoriteGenres: Set = ["Rock", "Classical", "Hip Hop"]
print(favoriteGenres)
```

#### Accessing and Modifying a Set

##### The Count property

```swift
print("I have \(favoriteGenres.count) favorite music genres.")
```

##### The empty shortcut

```swift
if favoriteGenres.isEmpty {
  print("As far as music goes, I'm not picky.")
} else {
  print("I have particular music preferences.")
}
```

##### Adding elements

```swift
favoriteGenres.insert("Jazz")
print(favoriteGenres)
```

##### Removing elements

```swift
if let removedGenre = favoriteGenres.remove("Rock") {
  print("\(removedGenre)? I'm over it.")
} else {
  print("I never much cared for that.")
}
```

##### Looking for elements

```swift
if favoriteGenres.contains("Funk") {
  print("I get up on the good foot.")
} else {
  print("It's too funky in here.")
}
```

##### - Iterating Over a Set
for genre in favoriteGenres {
  print(genre)
}

Swift's Set type doesn't have a defined ordering. To iterate over the values of a set in an specific order, use the sorted() method, wich returns the set's elements as an array sorted using the < operator.

```swift
for genre in favoriteGenres.sorted() {
  print(genre)
}
```

#### Performing Set Operations

```swift
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
```

Union method creates a new set with all of the values in both sets

```swift
let union = oddDigits.union(evenDigits).sorted()
```

Intersection method creates a new set with only the values common to both sets

```swift
let intersection = oddDigits.intersection(evenDigits).sorted()
```

Subtracting method creates a new set with values not in the specified set

```swift
let subtracting = oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
```

SymmetricDifference method creates a new sit with values in either set, but not both

```swift
let symmetricDifference = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
```

#### Set Membership and Equality

```swift
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
```

Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set.

```swift
houseAnimals.isSubset(of: farmAnimals)
```

Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set.

```swift
farmAnimals.isSuperset(of: houseAnimals)
```

Use the isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.

Use the isDisjoint(with:) method to determine whether tow sets have no values in common

```swift
farmAnimals.isDisjoint(with: cityAnimals)
```

#### Dictionaries

A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering. Each value is associated with a unique key, wich acts as an identifier for that value withing the dictionary.

The type of a Swift dictionary is written in full as Dictionary<Key, Value> where Key is the type of value that can be used as a dictionary key and must conform to the Hashable protocol, and Value is the type of  value that the dictionary sotres for those keys.

#### Creating an Empty Dictionary

Creating an empty Dictionary

```swift
var namesOfIntegers: [Int: String] = [:]

namesOfIntegers[16] = "sixteen"
print(namesOfIntegers)
namesOfIntegers = [:]
print(namesOfIntegers)
```

#### Accessing and Modifying a Dictionary

##### Creating a Dictionary with a Dictionary Literal

```swift
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print("The airports dictionary contains \(airports.count) items.")
```

##### The isEmpty shortcut

```swift
if airports.isEmpty {
  print("The airports dictionary is empty.")
} else {
  print("The airports dictionary isn't empty.")
}
```

##### Adding values

```swift
airports["LHR"] = "London"
print(airports)

airports["LHR"] = "London Heathrow"
print(airports)
```

##### Updating values

```swift
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
  print("The old value for DUB was \(oldValue).")
}
```

##### Checking for a key

```swift
if let airportName = airports["DUB"] {
  print("The name of the airport is \(airportName).")
} else {
  print("The aiport isn't in the airports dictionary.")
}

airports["APL"] = "Apple International"
print(airports)
```

##### Removing a Key-Value

```swift
airports["APL"] = nil

if let removedValue = airports.removeValue(forKey: "DUB") {
  print("The removed airport's name is \(removedValue).")
} else {
  print("The airports dictionary doesn't contain a value for DUB.")
}
```

#### Iterating Over a Dictionary

```swift
for (airportCode, airportName) in airports {
  print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
  print("Airport code: \(airportCode)")
}

for airportName in airports.values {
  print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
print(airportCodes)

let airportNames = [String](airports.values)
print(airportNames)
```
### Control Flow

### Functions

Functions are self-contained chunks of code that perform a specific task.

#### Defining and Calling Functions

When you define a function, you can optionally define one or more named, typed values that the function takes as input, known as parameters. You can also optionally define a type of value that the function will pass back as output when it’s done, known as its return type.

```swift
func greet(person: String) -> String {
  let greeting = "Hello, " + person + "!"
  return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))

func greetAgain(person: String) -> String {
  return "Hello again, " + person + "!"
}

print(greetAgain(person: "Anna"))
```

#### Function Parameters and Return Values

Function parameters and return values are extremely flexible in Swift. You cand define anything from a simple utility function with a single unnamed parameter to a complex function with expressive parameter names and different parameter options.

##### Functions Without Parameters

Functions aren’t required to define input parameters. Here’s a function with no input parameters, which always returns the same String message whenever it’s called

```swift
func sayHelloWorld() -> String {
  return "Hello, world"
}

print(sayHelloWorld())
```

##### Functions With Multiple Parameters

Functions can have multiple input parameters, which are written within the function’s parentheses, separated by commas.

```swift
func greet(person: String, alreadyGreeted: Bool) -> String {
  if alreadyGreeted {
      return greetAgain(person: person)
  } else {
      return greet(person: person)
  }
}

print(greet(person: "Tim", alreadyGreeted: true))
```

##### Functions Without Return Values

Functions aren’t required to define a return type.

```swift
func greetWithoutReturnAValue(person: String) {
  print("Hello, \(person)")
}

greetWithoutReturnAValue(person: "Dave")

func printAndCount(string: String) -> Int {
  print(string)
  return string.count
}

func printWithoutCounting(string: String) {
  let _ = printAndCount(string: string)
}

printAndCount(string: "Hello, world")
printWithoutCounting(string: "Hello, world")
```

##### Functions with Multiple Return Values

You can use a tuple type as the return type for a function to return multiple values as part of one compound return value.

```swift
func minMax(array: [Int]) -> (min: Int, max: Int) {
  var currentMin = array[0]
  var currentMax = array[0]
  for value in array[1..<array.count] {
      if value < currentMin {
          currentMin = value
      } else if value > currentMax {
          currentMax = value
      }
  }
  return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 109, 3 ,71])
print("min is \(bounds.min) and max is \(bounds.max)")
```

##### Optional Tuple Return Types

If the tuple type to be returned from a function has the potential to have “no value” for the entire tuple, you can use an optional tuple return type to reflect the fact that the entire tuple can be nil. You write an optional tuple return type by placing a question mark after the tuple type’s closing parenthesis, such as (Int, Int)? or (String, Int, Bool)?.

```swift
func optionalMinMax(array: [Int]) -> (min: Int, max: Int)? {
  if array.isEmpty { return nil }
  var currentMin = array[0]
  var currentMax = array[0]
  for value in array[1..<array.count] {
      if value < currentMin {
          currentMin = value
      } else if value > currentMax {
          currentMax = value
      }
  }
  return (currentMin, currentMax)
}

if let optionalBounds = optionalMinMax(array: [8, -6, 2, 109, 3, 71]) {
  print("min is \(optionalBounds.min) and max is \(optionalBounds.max)")
}
```

##### Functions With an Implicit Return

If the entire body of the function is a single expression, the function implicitly returns that expression.

```swift
func implicitGreeting(for person: String) -> String {
  "Hello, " + person + "!"
}

print(implicitGreeting(for: "Dave"))

print("\n============================================")
print("Function Argument Labels and Parameter Names")
print("============================================\n")
```

#### Function Argument Labels and Parameter Names

By default, parameters use ther parameter name as ther argument label

```swift
func someFunction(firstParameterName: Int, secondParameterName: Int) {
  // In The function body, firstParameterName and secondParameterName refer to the argument values for the first and second parameters.
}
someFunction(firstParameterName: 1, secondParameterName: 2)
```

##### Specifying Argument Labels

You write an argument label before the parameter name, separated by a space

```swift
func someFunction(argumentLabel parameterName: Int) {
  // In the functionbody, parameterName refers to the argument value for that parameter.
}
someFunction(argumentLabel: 1)

func greet(person: String, from hometown: String) -> String {
  return "Hello \(person)! Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
```

##### Omitting Argument Labels

If you don’t want an argument label for a parameter, write an underscore (_) instead of an explicit argument label for that parameter.

```swift
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
  // In the function body, firstParameterName and secondParameterName refer to the argument values for the first and second parameters
}
someFunction(1, secondParameterName: 2)
```

##### Default Parameter Values

You can define a default value for any parameter in a function by assigning a value to the parameter after that parameter’s type. If a default value is defined, you can omit that parameter when calling the function.

```swift
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
  // If you omit the second argument when calling this function, then the value of parameterWithDefault is 12 insed the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12
```

##### Variadic Parameters

A variadic parameter accepts zero or more values of a specified type. You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called.

```swift
func arithmeticMean(_ numbers: Double...) -> Double {
  var total: Double = 0
  for number in numbers {
      total += number
  }
  return total / Double(numbers.count)
}
print(arithmeticMean(1, 2, 3, 4, 5))
print(arithmeticMean(3, 8.25, 18.75))
```

##### In-Out Parameters

Function parameters are constants by default. Trying to change the value of a function parameter from within the body of that function result in a compile-time error. So you can define that parameter as an in-out parameter.

```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
  let temporaryA = a
  a = b
  b = temporaryA
}

var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
```

#### Function Types

Every function has a specific function type, made up of the parameter types and the return type of the function

```swift
///  It's func has the function type (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
  return a + b
}

/// It's function also has the function type (Int, Int) -> Int
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
  return a * b
}

/// This var also has the function type (Int, Int) -> Int
var mathFunction: (Int, Int) -> Int

mathFunction = addTwoInts(_:_:)
var result = mathFunction(2,3)
print("The result value is \(result) because mathFunction is equal to addTwoInts(_:_:)")

mathFunction = multiplyTwoInts(_:_:)
result = mathFunction(2,3)
print("The result value is \(result) because mathFunction is equal to multiplyTwoInts(_:_:)")
```

##### Function types as Parameter Types

You can use a function type such as (Int, Int) -> Int as a parameter type for another function. This enables you to leave some aspects of a function’s implementation for the function’s caller to provide when the function is called.

```swift
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
  print("Result: \(mathFunction(a, b))")
}
printMathResult(mathFunction, 3, 5)
```

##### Function Types as Return Types

You can use a function type as the return type of another function. You do this by writing a complete function type immediately after the return arrow (->) of the returning function.

```swift
func stepForward(_ input: Int) -> Int {
  return input + 1
}
func stepBackward(_ input: Int) -> Int {
  return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
  return backward ? stepBackward : stepForward
}
var currentValue = 3
var moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
print("Counting to zero:")
while currentValue != 0 {
  print("\(currentValue)... ")
  currentValue = moveNearerToZero(currentValue)
}
print("zero!")
```

#### Nested Functions

All of the functions you have encountered so far in this chapter have been examples of global functions, which are defined at a global scope. You can also define functions inside the bodies of other functions, known as nested functions.

```swift
func chooseNestedStepFunction(backward: Bool) -> (Int) -> Int {
  func stepForward(input: Int) -> Int { return input + 1 }
  func stepBackward(input: Int) -> Int { return input - 1 }
  return backward ? stepBackward : stepForward
}

currentValue = -4
moveNearerToZero = chooseNestedStepFunction(backward: currentValue > 0)

while currentValue != 0 {
  print("\(currentValue)... ")
  currentValue = moveNearerToZero(currentValue)
}
print("zero!")
```

### Closures

### Enumerations

### Structures and Classes

### Properties

Properties associate values with a particular class, structure or enumeration

#### Stored Properties

In it's simple form, a stored property is a constant or variable that's stored as part of an instance of a particular class or structure, you can provide default value for a Stored Property, you can also set or modify the initial value of a stored property during initialization

```swift
struct FixedLengthRange {
  var firstValue: Int
  let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
```

#### Stored Properties of Constant Structure Instances

Because rangeOfFourItems is declared as a constant, it isn't possible to change its firstValue property, even though it's a variable property

This behavior is due to structures being value types. When an instance of a value type is marked as a constant, so are all of its properties
The same isn't  true for classes, wich are reference types. If you assing an instance of a reference type, you can still change that instance's variable properties.

```swift
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6
```

#### Lazy Stored Properties

Is a property whose initial value isn´t calculated until the first time it´s used. Lazy properties are useful when the initial value of a property is depent on outside factors whose values aren´t known until after an instance's initiation is complete.

Lazy Properties are also useful when the initial value of a property requires complex or computationally expensive setup that shound't be performed unless ot until it's needed.

```swift
class DataImporter {
  /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a nontrivial amount of time to initialize.
    */
    
  var fileName = "data.txt"
  // the DataImporter class would provide data importing functionality here
}

class DataManager {
  lazy var importer = DataImporter()
  var data: [String] = []
  // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance of the importer property hasn't yet been created
print(manager.importer.fileName)
// the DataImporter instance of the importer property has now been created
```

#### Stored Properties and Instance Variables

In addition to properties, you can use instance variables as backing store for the values stored in a property.

#### Computed Properties

In additional to stored properties, classes, structures and enumerations can define computed properties, which don't acctually store a value, they provide a getter and an optional setter to retrive and set other properties and values directly.

```swift
struct Point {
  var x = 0.0
  var y = 0.0
}

struct Size {
  var width = 0.0
  var height = 0.0
}

struct Rect {
  var origin = Point()
  var size = Size()
  var center: Point {
      get {
          let centerX = origin.x + (size.width / 2)
          let centerY = origin.y + (size.height / 2)
          return Point(x: centerX, y: centerY)
      }
      set(newCenter) {
          origin.x = newCenter.x - (size.width / 2)
          origin.y = newCenter.y - (size.height / 2)
      }
  }
}

var square = Rect(
  origin: Point(),
  size: Size(width: 10.0, height: 10.0)
)
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("Square origin is now at (\(square.origin.x), \(square.origin.y))")
```

#### Shorthand Setter Declaration

If a computed property's setter doesn't define a name for the new value to be set, a default name of 'newValue' is used

```swift
struct AlternativeRect {
  var origin = Point()
  var size = Size()
  var center: Point {
      get {
          let centerX = origin.x + (size.width / 2)
          let centerY = origin.y + (size.height / 2)
          return Point(x: centerX, y: centerY)
      }
      set {
          origin.x = newValue.x - (size.width / 2)
          origin.y = newValue.y - (size.height / 2)
      }
  }
}
```

#### Shorthand Getter Declaration

If the entire body of a getter is a single expression, the gettet implicitly returns that expression.

```swift
struct CompactRect {
  var origin = Point()
  var size = Size()
  var center: Point {
      get {
          Point(x: origin.x + (size.width / 2),
                y: origin.y + (size.height / 2))
      }
      set {
          origin.x = newValue.x - (size.width / 2)
          origin.y = newValue.y - (size.height / 2)
      }
  }
}
```

#### Read-Only Computed Properties

A computed property with a getter and no setter is known as read-only computed property. A read-only computed property always returns a value, and can be accessed thought dot syntax, but can´t be set to a different value.

```swift
struct Cuboid {
  var width = 0.0
  var height = 0.0
  var depth = 0.0
  
  var volume: Double {
      return width * height * depth
  }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("The volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
```

#### Property Observers

Property observers observe and respond to changes in a property's value. Property observers are called everytime a property's value si set, even if the new value is the same as the property's current value

You can add property observers in:
- Stored properties that you define
- Stored properties that you inherit
- Computed propertis that you inherit

You have the option to define either or both of these observers on a property
- willSet: is called just before the value is stored
- didSet: is called immediatly afther the new value is stored

```swift
class StepCounter {
  var totalSteps: Int = 0 {
      willSet (newTotalSteps) {
          print("About to set totalSteps to \(newTotalSteps)")
      }
      didSet {
          guard totalSteps > oldValue else { return }
          print("Added \(totalSteps - oldValue) steps")
      }
  }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896
```

#### Property Wrapper

A property wrapper adds a layer of separation between code that manages how a property is stored and the code that defines a property

```swift
@propertyWrapper
struct TwelveOrLess {
  private var number = 0
  var wrappedValue: Int {
      get { return number }
      set { number = min(newValue, 12) }
  }
}

struct SmallRectangle {
  @TwelveOrLess var height: Int
  @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)

rectangle.height = 10
print(rectangle.height)

rectangle.height = 24
print(rectangle.height)

struct SmallRectangleTwo {
  private var _height = TwelveOrLess()
  private var _width = TwelveOrLess()
  var height: Int {
      get { return _height.wrappedValue }
      set { _height.wrappedValue = newValue }
  }
  var width: Int {
      get { return _width.wrappedValue }
      set { _width.wrappedValue = newValue }
  }
}
```

#### Setting Initial Values for Wrapped Properties

```swift
@propertyWrapper
struct SmallNumber {
  private var maximum: Int
  private var number: Int
  
  var wrappedValue: Int {
      get { return number }
      set { number = min(newValue, maximum) }
  }
  
  init() {
      maximum = 12
      number = 0
  }
  
  init(wrappedValue: Int) {
      maximum = 12
      number = min(wrappedValue, maximum)
  }
  
  init(wrappedValue: Int, maximum: Int) {
      self.maximum = maximum
      number = min(wrappedValue, maximum)
  }
}

struct ZeroRectangle {
  @SmallNumber var height: Int
  @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)

struct UnitRectangle {
  @SmallNumber var height: Int = 1
  @SmallNumber var width: Int = 1
}

var unitRetangle = UnitRectangle()
print(unitRetangle.height, unitRetangle.width)

struct NarrowRectangle {
  @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
  @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)

struct MixedRectangle {
  @SmallNumber var height: Int = 1
  @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)

mixedRectangle.height = 20
print(mixedRectangle.height)
```

#### Project a Value From a Property Wrapper

In Addition to the wrapped value, an Property Wrapper can expose aditional functionality by defining a projected value

```swift
@propertyWrapper
struct VerySmallNumber {
  private var number: Int
  private(set) var projectedValue: Bool
  
  var wrappedValue: Int {
      get { return number }
      set {
          if newValue > 12 {
              number = 12
              projectedValue = true
          } else {
              number = newValue
              projectedValue = false
          }
      }
  }
  
  init() {
      number = 0
      projectedValue = false
  }
}

struct SomeStructure {
  @VerySmallNumber var someNumber: Int
}

var someStructure = SomeStructure()
someStructure.someNumber = 4
print(someStructure.$someNumber)
someStructure.someNumber = 55
print(someStructure.$someNumber)
```

When you access a projected value from code that’s part of the type, like a property getter or an instance method, you can omit self. before the property name, just like accessing other properties.

```swift
enum SizeEnum {
  case small
  case large
}

struct SizedRectangle {
  @VerySmallNumber var height: Int
  @VerySmallNumber var width: Int
  
  mutating func resize(to size: SizeEnum) -> Bool {
      switch size {
      case .small:
          height = 10
          width = 20
      case .large:
          height = 100
          width = 100
      }
      return $height && $width
  }
}

var sizedRectangle = SizedRectangle()
print(sizedRectangle.resize(to: .large), sizedRectangle.resize(to: .small))
```

#### Global and Local Variables

The capabilities described above about computing and observing properties are also available for global variables and local variables.

Global constants and variables are always computed lazily, unlike lazy stored properties, global constants and variables  don't need to be marked  with the lazy modifier

#### Type Properties

You can also define properties that belong to the type itself, not to any instance of that type. There will no ever be one copy of these properties, no matter how many instances of that type you create. These kind of properties are called type properties

```swift
struct SomeStructureTwo {
  static var storedTypeProperty = "Some value."
  static var computedTypeProperty: Int {
      return 1
  }
}

enum SomeEnumeration {
  static var storedTypeProperty = "Some value."
  static var computedTypeProperty: Int {
      return 6
  }
}

class SomeClass {
  static var storedTypeProperty = "Some value."
  static var computedTypeProperty: Int {
      return 27
  }
  class var overrideableComputedTypeProperty: Int {
      return 107
  }
}

print(SomeStructureTwo.storedTypeProperty)
SomeStructureTwo.storedTypeProperty = "Another value."
print(SomeStructureTwo.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)
```

### Methods

### Subscripts

### Inheritance

### Initialization

### Deinitialization

### Optional Chaining

### Error Handling

### Concurrency

#### Defining and Calling Asynchronous Functions

To indicate that a function or method is asynchronous, you write the `async` keyword in its declaration after its parameters.

``````swift
func listPhotos(inGallery name: String) async -> [String] {
let result = // ... some asynchronous networking code ...
return result
}
``````

- Note: For a function or method that's both asynchronous and throwing, you write `async` before `throws`.

When calling an asyncrhonous method, execution suspends until that method returns. You write `await` in front of the call to mark the possible suspension point.

``````swift
let photoNames = await listPhotos(inGallery: "Summer Vacation")
let sortedNames = photoNames.sorted()
let name = sortedNames[0]
let photo = await downloadPhoto(named: name)
show(photo)
``````

- Important: Because code with `await` needs to be able to suspend execution, only certain places in your program can call asynchronous functions of methods:
- Code in the body of an asynchronous function, method, or property.
- Code in the `static main()` method of a structure, class or enumeration that's marked with `@main`
- Code in an unstructured child task.

Also you can insert a suspension by calling the `Task.yield()` method.

``````swift
func generateSlideshow(forGallery gallery: String) async {
  let photos = await listPhotos(inGallery: gallery)
  for photo in photos {
      // ... render a few seconds of video for this photo ...
      await Task.yield()
  }
}
``````

Assuming the code that renders video is synchronous, it doesn't contain any suspension points. The work to render video could also take a long time. However, you can periodically call `Task.yield()`. Structuring long-running code this way lets Swift balance between making progress on this task and letting other tasks ins your program make progress on their work.

#### Asynchronous Sequences

#### Calling asynchronous Functions in Parallel

### Macros

### Type Casting

### Nested Types

### Extensions

### Protocols

### Generics

### Opaque and Boxed Protocol Types

### Automatic Reference Counting

### Memory Safety

### Access Control

### Advanced Operators

## Language Reference
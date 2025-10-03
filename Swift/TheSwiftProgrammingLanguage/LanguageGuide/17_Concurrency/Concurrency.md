# The Swift Programming Language



## Concurrency

Swift has built-in support for writing asynchronous and parallel code in a structured way. 

*Asynchronous code* can be suspended an resumed later, although only one piece of the program executes at a time. Suspending and resuming code in yout program lets it continue to make progress on short-term operations like updating its UI while continuing to work on long-running operations like fetching data over the network or parsing files.

*Parallel code* means multiple pieces of code run simultaneously - for example, a computer with a four-core processor can run four pieces of code at the same time, with each core carrying out one of the tasks.

A program that uses parrallel and asynchronous code carries out multiple operations at time, and it suspends operations that are waiting for an external system.



### Defining and Calling Asynchronous Functions

To indicate that a function or method is asynchronous, you write the `async` keyword in its declaration after its parameters.

```swift
func listPhotos(inGallery name: String) async -> [String] {
  let result = // ... some asynchronous networking code ...
  return result
}
```

> :bulb: **Note** 
> For a function or method that's both asynchronous and throwing, you write `async` before `throws`.

When calling an asyncrhonous method, execution suspends until that method returns. You write `await` in front of the call to mark the possible suspension point. That supension is never implicit or preemptive which means every possible suspension point must be marked with `await.`

```swift
let photoNames = await listPhotos(inGallery: "Summer Vacation")
let sortedNames = photoNames.sorted()
let name = sortedNames[0]
let photo = await downloadPhoto(named: name)
show(photo)
```

> :warning: **Important**
> Because code with `await` needs to be able to suspend execution, only certain places in your program can call asynchronous functions of methods:
> - Code in the body of an asynchronous function, method, or property.
> - Code in the `static main()` method of a structure, class or enumeration that's marked with `@main`
> - Code in an unstructured child task.

Also you can insert a suspension by calling the `Task.yield()` method.

```swift
func generateSlideshow(forGallery gallery: String) async {
  let photos = await listPhotos(inGallery: gallery)
  for photo in photos {
      // ... render a few seconds of video for this photo ...
      await Task.yield()
  }
}
```

Assuming the code that renders video is synchronous, it doesn't contain any suspension points. The work to render video could also take a long time. However, you can periodically call `Task.yield()`. Structuring long-running code this way lets Swift balance between making progress on this task and letting other tasks ins your program make progress on their work.

The `Task.sleep(for:tolerance:clock:)` method is useful when writing simple code to learn how concurrency works. This methods suspends the current task for at least the given amount of time.

```swift
func listPhotos(inGallery name: String) async throws -> [String] {
  try await Task.sleep(for: .seconds(2))
  return ["IMG001", "IMG99", "IMG0404"]
}
```

> :bulb: **Note**
> 
> This version of `listPhotos(inGallery:)`
 is markew with `throws` because the call to `Task.sleep(until:tolerance:clock:)` can throw an error so when you call this function you must use `try`
> ```swift
> let photos = try await listPhotos(inGallery: "A Rainy Weekend")
> ```



### Defining Async Properties

As functions, you can define async properties.

```swift
extension UIImage {
  var thumbnail: UIImage? {
    get async throws {
      let size = GCSize(width: 40, height: 40)
      return await self.byPreparingThumbnail(ofSize: size)
    }
  }
}
```

> :warning: **Warning**
>
> You must use an explicit getter to make a property marked as `async`.
>
> Only read-only properties can be `async` .



### Asynchronous Sequences

Instead of using an ordinary `for-in` loop, you car write `for` with `await` after it. Like when you call an asynchonous function or method. A `for-await-in` loop potentially sispends execution at the beginning of each iteration, when it´s wating for the next element to ba vailable.

```swift
import Foundation

let handle = FileHandle.standarInput
for try await line in handle.bytes.lines {
  print(line)
}
```

> :bulb: **Note**
> In the same way that you can use your own types in a `for-in` loop by adding conformance to the `Sequence` protocol, you can use your won tipes in a `for-await-in` loop by adding conformance to the `AsyncSequence` protocol.

[WWDC21 - Meet AsyncSequence](https://developer.apple.com/videos/play/wwdc2021/10058)



### Calling asynchronous Functions in Parallel

Calling an asynchronous function with `await` runs only one piece of code at a time. While asynchronous code is running, the caller waits for that code to finish before moving on to run the next line of code.

```swift
let firstPhoto = await downloadPhoto(named: photoNames[0])
let secondPhoto = await downloadPhoto(named: photoNames[1])
let thirdPhoto = await downloadPhoto(named: photoNames[2])

// Although the download is asynchronous and lets other work happen while it progresses, only one call to `downloadPhoto(named:)` runs at a time. Each photo downloads completely before the nextone starts downloading. 

let photos = [firstPhoto, secondPhoto, thirdPhoto]
show(photos)
```

To call an asynchornos function and let it run in parallel with code around it, write `async` in front of `let` (async let binding ) when you define a constant, an then write `await` each time you use the constant.

```swift
async let firstPhoto = downloadPhoto(named: photoNames[0])
async let secondPhoto = downloadPhoto(named: photoNames[1])
async let thirdPhoto = downloadPhoto(named: photoNames[2])

// All three calls to `downloadPhoto(named:)` start without waiting for the previous one to complete. If there are enought system resources available, they can run at the same time.

let photos = await [firstPhoto, secondPhoto, thirdPhoto]
show(photos)
```

> :warning: **Important**
> 
> None of these function calls are marked with `await` because the code doesn't suspend to wait for the function's result. Instead, execution continues until the line where `photos` is defined. At that point, the program nneds the result from these asynchronous calls, so you write `await` to pause execution until all three photos finish downloading.



### Task and Task Groups

A *task* is a unit for work that can be run asynchronously as part of your program. A task itself does only one thing at a time, but when you create multiple tasks, Swift can schedule them to run simultaneously.

The `async-let` syntas described in the previous section implicitly creates a child task but you can also create a task group (an instance of `TaskGroup`) and explicitly add child tasks to that group, which gives you more control over priority and cancellation, and lets you create a dynamic number of tasks.

> :bulb: **Note**
> Swift runs as many tasks concurrently as conditions allow.

Here's another version of the code to download photos that handles any number of photos:

```swift
await withTaskGroup(of: Data.self) { group in
  let photoNames = await listPhotos(inGallery: "Summer Vacation")
  for name in photoNames {
    group.addTask {
      return await downloadPhoto(named: name)
    }
  }

  for await photo in group {
    show(photo)
  }
}

//  MARK: - Returning implementation
let photos = await withTaskGroup(of: Data.self) { group in
  let photoNames = await listPhotos(inGallery: "Summer Vacation")
  for name in photoNames {
    group.addTask {
      return await downloadPhoto(named: name)
    }
  }

  var results: [Data] = []
  for await photo in group {
    results.append(photo)
  }
  return results
}
```

> :bulb: **Note**
> 
> The explicit parent-child relationships between tasks has several advantages:
> * In a parent task, you can't forget to wait for its childs tasks to complete.
> *  When setting a higher priority on a child task, the parent task's priority is atumatically escalated.
> * When parent task is canceled, each of its child tasks is also automatically canceled.
> * Tas-local values propagate to child tasks efficiently and automatically 



### Task Cancellation

Swift concurrency uses a cooperative cancellation model. Each task checks whether it has been canceled at the appropriate points in its execution, and responds to cancellation appropriately. 

> :bulb: **Note**
> 
> There are two ways a task can check if it's cancelled:
> * Calling the `Task.checkCancellation()` type method
> * Reading the `Task.isCancelled` type property
> 
> Dependeing on what work the task is doing, responding to cancellation usually means one of the following:
> * Throwing an error like `CancellationError`
> * Returning `nil or an empty collection`
> * Returning the partially completed work

```swift
let photos = await withTaskGroup(of: Optional<Data>.self) { group in
  let photoNames = await listPhotos(inGallery: "Summer Vacation") 
  for name in photoNames {
    let added = group.addTaskUnlessCancelled { // Added to avoid starting new work after cancellation
      guard !Task.isCancelled else { return nil } // Each task checks for cancellation before starting to download the photo
      return await downloadPhoto(named: name)
    }
    guard added else { break } // Confirms that the new child tas was added, If the group is canceled, the value of added is `false` - in that case, the code stops trying to download additional photos.
  }

  var results: [Data] = []
  for await photo in group {
    if let photo { results.append(photo) } // Skips `nil` values when collecting the results. Handling cancellation by returning `nil` means the task group can return a partial result
  }
  return result
}
```

> :warning: **Important**
> 
> Calling `checkCancellation()` throws an error if the task is canceled; a throwing task can propagate the error out of the task, stopping all of the task's work. For more flexibility uste the `isCancelled` property, which lets you perform clean-up work as part of stopping the task.
> 
> To check whether a task has been canceled from outside that task, use the `Task.isCancelled` instance property instead of the type property.

For work that needs immediate notification of cancellation, use the `Task.withTaskCancellationHandler(operation:onCancel:isolation:)` method.

```swift
let task = await Task.withTaskCancellationHandler {
  // ...
} onCancel: {
  print("canceled!")
}

// ... some time later...
task.cancel() // Prints "Canceled!"
```

> :warning: **Warning**
> Avoid sharing state between the task and its cancellation handler. Which could create a race condition.



### Unstructured Concurrency

Swift also supports unstructured concurrency. Unlike tasks that are part of a task group, an *unstructured task* doesn't have a parent task. You have complete flexibility to manage unstructured tasks in whatever way your program needs, but you're also completely responsible for ther correctness.

```swift
let newPhoto = // ... some photo data ...
let handle = Task {
  return await add(newPhoto, toGalleryNamed: "Spring Adventures")
}
let result = await handle.value
```

> :bulb: **Note**
> 
> To create an unstructured task that runs on the current actor, call the `Task.init(priority:operation:)` initializaer
>
> To create aun unstructured task that's not part of the current actor, known more specifically as ***detached task***, call the `Task.detached(priority:operation:)` class method.
>
> Both of these operations return a task that you can interact with.

For mor information about managing detached tasks, see [Tasks](https://developer.apple.com/documentation/swift/task).



### Actors

Actors are reference types that let you safely share information between concurrent code.

> :warning: **Important**
> 
> Unlike classes, actors allow only one task to access their mutable state at a time, wich makes it safe for code in multiple tasks to interact with the same instance of an actor.

```swift
actor TemperatureLogger { // You introduce an actor with the `actor` keywork
  let label: String
  var measurements: [Int]
  private(set) var max: Int

  init(label: String, measurement: Int) {
    self.label = label
    self.measurements = [measurement]
    self.max = measurement
  }
}
```

When you create an instance of an actor, you must use `await` to mark the potential suspension point when you acces a property or method of that actor.

```swift
let logger = TemperatureLogger(label: "Outdoors", measurement: 25)
print(await logger.max) // Prints "25"
```

In contrast, code that's part of the actor doesn't write `await` when accessing the actor's properties.

```swift
extension TemperatureLogger {
  func update(with measurement: Int) {
    measurements.append(measurement)
    if measurement > max {
      max = measurement
    }
  }
}
```

> :warning: **Warning**
> 
> If code outside the actor tries to access those properties directly, like accessing a structure or class's properties, you'll get a compile-time error.
> 
> Example:
> ```swift
> print(logger.max)
> ```
> Accessing `logger.max` without `await` fails because the properties of an actor are part of the actor's insolated local state. The code to access this property needs to run as part of the actor, which is an asynchronous operation and requires writing `await`.

Swift guarantees that only code running on an actor can access the actor's local state. This guarantee is known as ***actor isolation***.

The following aspects of the Swift concurrency model work together to make it easier to reason about shared mutable state:

* Code in between possible suspension points runs sequentially, without the possibility of interruption from other concurrent code.
* Code that interacts with and actor's local state runs only on that actor.
* An actor runs only one piece of code at a time.

Because of these guarantees, code that doesn't include `await` and that's inside an actor can make updates without a risk of other places in your program observing the memporarily invalid state.

```swift 
extension TemperatureLogger {
  func convertFahrenheitToCelsius() {
    measurements = measurements.map { measurement in // While the map operation is in progress, some temperatures are in Rahrenheit an others are in Celsius. However, because none of the code includes `await`, there are no potential suspension points in this method. The state that this method modifies belongs to the actor, which protects it agains code reading or modifying it except when tat code runs on the actor. This means there's no way for other code to read a list of partially converted temperatures while unit conversion is in progress.
      (measurement - 32) * 5 / 9
    }
  }
}
```

> :warning: **Warning**
> In the futire, if you try to add concurrent code to a *synchronous* method inside an actor like the `convertFahrenheitToCelsius()`, you'll get compile-time error instead of introducing a bug.



### Sendable Types

Inside of a task or an instance of an actor, the part of a program that contains mutable state, like variables and properties, si called a ***concurrency domain***, and some kinds of data can't be shared between concurreency domains, because the data constains mutable state, but it doesn't protect against overlapping access.

A type that can be shared from one concurrency tomain to another is known as a ***sendable type***. For example, it can be passed as an argument when calling an actor method or be returned as the result of a task.

You mark a type as being sendable by declaring conformance to the `Sendable` protocol. That protocol doesn't have any code requirements, but it does have semantic requiments that Swift enforces.

In general, there are three ways for a type to be sendable:

1. The type is a ***value type***, and its mutable state is made up of other sendable data - for example, a structure with stored properties that are sendable or an enumeration with associated values that are sendable.
2. The type doesn't have any mutable state, and its immutable state is made up of other sendable data - for example, a structure or class that has only read-only properties.
3. The type has code that ensures the safety of its mutable state, like a class that's marked `@MainActor` or a class that serializes access to its properties on a particular thread or queue.

For a detailed list of semantic requirements, see the [`Sendable`](https://developer.apple.com/documentation/swift/sendable) protocol reference.

```swift
struct TemperatureReading: Sendable { 
  var measurement: Int
}

extension TemperatureLogger {
  func addReading(from reading: TemperatureReading) {
    measuremenst.append(reading.measurement)
  }
}

let logger = TemperatureLogger(label: "Tea kettle", measurement: 85)
let reading = TemperatureReading(measurement: 45)
await logger.addReading(from: reading)
```

Because `TemperatureReading` is a structure (value-type) that has only sendable properties, and the structure isn't marked `public` or `@usableFromInline`, its implicitly sendable.

```swift
struct TemperatureReading {
  var measurement: Int
}
```

To explicitly mark a type as not being sendable, overriding an implic conformance to `Sendable` protocol, use an extension:

```swift
struct FileDescriptor {
  let rawValue: CInt
}

@available(*, unavailable)
extension FileDescriptor: Sendable {}
```

In the code above, the `FileDescriptor` is a structure that meets the criteria to be implicitly sendable. However, the extension makes its conformance to `Sendable` unavailable, preventing the type from being sendable. 
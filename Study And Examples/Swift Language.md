# Swift



## Concurrency



### Defining and Calling Asynchronous Functions

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

### Asynchronous Sequences

### Calling asynchronous Functions in Parallel

 


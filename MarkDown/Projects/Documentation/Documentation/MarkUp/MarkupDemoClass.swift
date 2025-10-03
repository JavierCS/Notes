import Foundation

class MarkupDemoClass {
    
    // MARK: - Comment Markers for Markup
    
    /**
     Little description for the function
     
     Add a block of markup using these special opening and closing comment markers.
     
     - Parameters:
         - parameterOne: First Parameter
         - parameterTwo: Second Parameter
     - Returns: Return Value
     - Throws: `Error.Type`
     */
    func blockComent() throws {}
    
    // MARK: - Formatting a Line of Text
    
    /**
     Little description for the function
     
     Display a line of text formatted as a heading.
     
     # This is a Heading 1
     ===================
     ## This is a Heading 2
     */
    func headings() {}
    
    /**
     Little description for the function
     
     Display a horizontal rule on the page.
     
     An example of using a *horizontal rule*
     
     This text is above the horizontal rule
     
     *  *  *  *  *
     
     And this is below
     */
    func horizontalRules() {}
    
    // MARK: - Formatting Multiple Lines of Text
    
    /**
     Little description for the function
     
     Display text as a bulleted list.
     
     An example of using a *bulleted list*
     
     * item 1
     * item 2
     * item 2.1
     * item 3
     */
    func bulletedLists() {}
    
    /**
     Little description for the function
     
     Display text in a numbered list.
     
     An example of using a *numbered list*
     
     1. Cat
     2. Dog
     1. Golden Retriever
     3. Llama
     */
    func numberedLists() {}
    
    /**
     Little description for the function
     
     Display the text as a block of code.
     
     An example of using a *code block*
     
     A loop to print each character on a seperate line
     ````
     for character in "Aesop" {
     print(character)}
     }
     ````
     */
    func codeBlock() {}
    
    // MARK: - Formatting a Span of Characters
    
    /**
     Little description for the function
     
     Render a span of text using the font for code voice.
     
     An example of using a *code voice*
     
     Show Swift elements such as `for` and `let` as monspaced code font
     */
    func codeVoice() {}
    
    /**
     Little description for the function
     
     Render a span of text using the font face for emphasis.
     
     This line has a word with *emphasis*.
     
     This line uses _emphasis for the last six words_.
     */
    func italics() {}
    
    /**
     Little description for the function
     
     Render a span of text using the strong font face.
     
     An example of using *strong*
     
     A **strong * (asterisk)** is on this line.
     
     __A strong line__.
     */
    func bold() {}
    
    // MARK: - Inserting Links
    
    /**
     Little description for the function
     
     Add a link to a text-based resource such as a web URL or email.
     
     - seealso: [The Swift Standard Library Reference](https://developer.apple.com/library/prerelease/ios//documentation/General/Reference/SwiftStandardLibraryReference/index.html)
     */
    func insertingLinks() {}
    
    /**
     Little description for the function
     
     Add a named reference to a URL that can be used in multiple places.
     
     [The Swift Programming Language]: http://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ "Some hover text"
     
     For light summer reading we suggest [The Swift Programming Language].
     
     ### Useful books
     * [The Swift Programming Language]
     */
    func insertingLinksReference() {}
    
    // MARK: - Inserting Assets
    
    /**
     Little description for the function
     
     Include inline images.
     
     ![Xcode icon](http://devimages.apple.com.edgekey.net/assets/elements/icons/128x128/xcode.png "Some hover text")
     */
    func insertingImage() {}
    
    // MARK: - Inserting Callouts
    
    /// markupDemoSimpleFunc description.
    func markupDemoSimpleFunc() {}
    
    /**
     Little description for the function
     
     Add an Attention callout to the Quick Help for a symbol using the Attention delimiter. Multiple Attention callouts appear in the description section in the same order as they do in the markup.
     
     - Attention: AttentionText
     */
    func attentionDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Add an Author callout with a single name to the Quick Help for a symbol using the Author delimiter. Multiple Author callouts appear in the description section in the same order as they do in the markup.
     
     - Author: Javier Cruz Santiago
     */
    func authorDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Add an Authors callout with a list of authors to the Quick Help for a symbol. The order of the authors in Quick Help is the same as the order they appear in the delimiter. Multiple Authors delimiters are added to Quick Help in the order that they appear in the markup.
     
     - Authors: Javier Cruz Santiago\
     \
     Nombre De Otra Persona
     */
    func authorsDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Adds a Bug callout to the Quick Help for a symbol using the Bug delimiter. Multiple Bug callouts appear in the description section in the same order as they do in the markup.
     
     - Bug: Simple description for a bug
     - Bug: [Passing a `UIViewController` crashes *bugExample*](BugDB://problem/2274610)
     */
    func bugDelimiterUsage() {}
    
    /**
     Use the callout to add tasks required to complete or update the functionality of the symbol.
     
     Add a ToDo callout to the Quick Help for a symbol using the To Do delimiter. Multiple To do callouts appear in the description section in the same order as they do in the markup.
     
     - ToDo: Do some Tasks.
     */
    func toDoDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Add a Complexity callout to the Quick Help for a symbol using the Complexity delimiter. Multiple Complexity callouts appear in the description section in the same order as they do in the markup.
     
     - Complexity: The method demonstrates an inefficient way to sort using an O(N\*N\*N) (order N-cubed) algorithm
     */
    func complexityDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Add a Copyright callout to the Quick Help for a symbol using the Copyright delimiter. Multiple Copyright callouts appear in the description section in the same order as they do in the markup.
     
     - Copyright: Copyright © 1215 by The Group of Barrons
     */
    func copyrightDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Add a Date callout to the Quick Help for a symbol using the Date delimiter. Multiple Date callouts appear in the description section in the same order as they do in the markup.
     
     Last date this example was changed
     - Date: August 19, 2015
     
     Days the method produces special results
     - Date: 12/31
     - Date: 03/17
     */
    func dateDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Add an Experiment callout to a playground or to the Quick Help for a symbol using the Experiment delimiter. Multiple Experiment callouts appear in the description section in the same order as they do in the markup.
     
     - Experiment: Pass in a string in the present tense
     - Experiment: Pass in a string with no vowels
     - Experiment: Change the third case statement to work only with consonants
     */
    func experimentDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Add an Important callout to a playground or to the Quick Help for a symbol using the Important delimiter. Multiple Important callouts in Quick Help appear in the description section in the same order as they do in the markup.
     
     Use the callout to highlight information that can have adverse effects on the tasks a user is trying to accomplish.
     
     - Important: "The beginning is the most important part of the work."  
     \
     –Plato
     */
    func importantDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Add an Invariant callout to the description of a symbol using the Invariant delimiter. Multiple Invariant callouts appear in the description section in the same order as they do in the markup.
     
     Use the callout to display a condition that is guaranteed to be true during the execution of the documented symbol.
     
     - Invariant: The person reference will not change during the execution of this method
     */
    func invariantDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Add a Note callout to a playground or to the Quick Help for a symbol using the Note delimiter. Multiple Note callouts in Quick Help appear in the description section in the same order as they do in the markup.
     
     - Note: This method returns an estimate.
     Use `reallyAccurateReading` to get the best results.
     */
    func noteDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Adds a Precondition callout to the Quick Help for a symbol. Multiple Precondition callouts appear in the description section in the same order as they do in the markup.
     
     Use the callout to document any conditions that are held for the documented symbol to work.
     
     - Precondition: The `person` property must be non-nil.
     - Precondition: `updatedAddress` must be a valid address.
     */
    func preconditionDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Add a Postcondition callout to the Quick Help for a symbol using the Postcondition delimiter. Multiple Postcondition callouts appear in the description section in the same order as they do in the markup.
     
     Use the callout to document conditions which have guaranteed values upon completion of the execution of the symbol.
     
     - Postcondition: After completing this method the billing address for the person will be set to `updatedAddress` if it is valid. Otherwise the billing address will not be changed.
     */
    func postconditionDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Add a Remark callout to the Quick Help for a symbol using the Remark delimiter. Multiple Remark callouts appear in the description section in the same order as they do in the markup.
     
     - Remark: The performance could be reduced from N-squared to N-log-N by switching patterns.
     */
    func remarkDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Add a Requires callout to the Quick Help for a symbol using the Requires delimiter. See Precondition for usage.
     
     - Requires: `start <= end`.
     - Requires: `count > 0`.
     */
    func requiresDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Adds a See also callout to the Quick Help for a symbol using the See Also delimiter. Multiple See also callouts appear in the description section in the same order as they do in the markup.
     
     Use the callout to add references to other information.
     
     - SeeAlso: [My Library Reference](https://example.com)
     */
    func seeAlsoDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Add a Since callout to the Quick Help for a symbol using the Since delimiter. Multiple Since callouts appear in the description section in the same order as they do in the markup.
     
     Use the callout to add information about when the symbol became available. Some example of the types of information include dates, framework versions, and operating system versions.
     
     - Since: First available in Mac OS 7
     */
    func sinceDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Add a Version callout to the Quick Help for a symbol using the Version delimiter. Multiple Version callouts appear in the description section in the same order as they do in the markup.
     
     - Version: 0.1 (61A329)
     */
    func versionDelimiterUsage() {}
    
    /**
     Little description for the function
     
     Add a Warning callout to the Quick Help for a symbol using the Warning delimiter. Multiple Warning callouts appear in the description section in the same order as they do in the markup.
     
     - Warning: Not all code paths for this method have been tested
     */
    func warningDelimiterUsage() {}
    
    // MARK: - Escaping Special Characters
    
    /**
     Little description for the function
     
     Treat the following character as a plain charactere instead of a markup delimiter.
     
     A simple example of using *display delimiter*
     
     Do not show the first line as a bullet item
     
     \* This is not a bullet item
     
     * This is a bullet item
     
     Display a special character with formatting
     
     Show the *middle asterisk\* with emphasis*
     
     These two lines
     wrap
     
     These two lines\
     do not
     */
    func scapes() {}
    
    // MARK: - Integral Examples
    
    /**
     Little description for the function
     
     Complete Summary for this function
     
     - Parameters:
         - parameterOne: First Parameter
         - parameterTwo: Second Parameter
     - Returns: Return Value
     
     - Attention: AttentionText
     
     - Authors: Javier Cruz Santiago\
     Nombre De Otra Persona
     
     - Bug: Simple description for a bug
     - Bug: [Passing a `UIViewController` crashes *bugExample*](BugDB://problem/2274610)
     
     - Complexity: The method demonstrates an inefficient way to sort using an O(N\*N\*N) (order N-cubed) algorithm
     
     - Copyright: Copyright © 1215 by The Group of Barrons
     
     Last date this example was changed
     - Date: August 19, 2015
     
     Days the method produces special results
     - Date: 12/31
     - Date: 03/17
     
     - Experiment: Pass in a string in the present tense
     - Experiment: Pass in a string with no vowels
     - Experiment: Change the third case statement to work only with consonants
     
     - Important: "The beginning is the most important part of the work."
     \
     –Plato
     
     - Invariant: The person reference will not change during the execution of this method
     
     - Note: This method returns an estimate. Use `reallyAccurateReading` to get the best results.
     
     - Precondition: The `person` property must be non-nil.
     - Precondition: `updatedAddress` must be a valid address.
     
     - Postcondition: After completing this method the billing address for the person will be set to `updatedAddress` if it is valid. Otherwise the billing address will not be changed.
     
     - Remark: The performance could be reduced from N-squared to N-log-N by switching patterns.
     
     - Requires: `start <= end`.
     - Requires: `count > 0`.
     
     - SeeAlso: [My Library Reference](https://example.com)
     
     - Since: First available in Mac OS 7
     
     - Version: 0.1 (61A329)
     
     - Warning: Not all code paths for this method have been tested
     */
    func completeExample() {}
    
    // MARK: - Xcode Annotations
    
    // TODO: Para señalar partes del código que aún están incompletas o necesitan ser implementadas.
    // FIXME: Para resaltar partes del código que son incorrectas y necesitan ser corregidas.
    // MARK: Para dividir y organizar visualmente tu código en secciones lógicas, como métodos, propiedades, extensiones, etc.
    
    // MARK: - Swift Compiler Directives
    
#warning("This is a Warning.")
#error("This is an Error.")
}

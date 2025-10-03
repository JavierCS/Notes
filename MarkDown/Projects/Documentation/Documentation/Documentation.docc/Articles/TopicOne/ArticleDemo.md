# Markup Formatting Reference in Articles

Article Demo Summary

## Overview

Article Demo Overview

### Formatting a Line of Text

#### Headings

<!--# Heading 1 String-->
## Heading 2 String
### Heading 3 String
#### Heading 4 String
##### Heading 5 String
###### Heading 6 String

### Formatting Multiple Lines of Text

#### Bulleted Lists

Display text as a bulleted list.

- Item 1, List A
- Item 2, List A
* Item 1, List B
+ Item 1, List C

#### Numbered Lists

Display text in a numbered list.

1. Cat
3. Dog
    1. Golden Retriever
2. Llama

#### Code Block

Display the text as a block of code.
 
     for character in "Aesop" {
         println(character)
     }

### Formatting Multiple Lines of Text

#### Code Voice

Render a span of text using the font for code voice.

Show Swift elements such as `for` and `let` as monspaced code font

#### Emphasis (Italics)

Render a span of text using the font face for emphasis.

This line has a word with *emphasis*.
 
This line uses _emphasis for the last six words_.

#### Strong (Bold)

Render a span of text using the strong font face.

A **strong * (asterisk)** is on this line.

__A strong line__.

### Inserting Links

#### Links

Add a link to a text-based resource such as a web URL or email.

For more information, see [The Swift Programming Language](http://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/)

#### Link Reference

Add a named reference to a URL that can be used in multiple places.

<!--Setup and use a link reference.-->
[The Swift Programming Language]: http://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ "Some hover text"
 
For light reading we suggest [The Swift Programming Language].
 
For more information, see [The Swift Programming Language].
 
If you are not sure, please see [The Swift Programming Language].

### Inserting Assets

#### Images

Include inline images from your playground project.

![Xcode icon](http://devimages.apple.com.edgekey.net/assets/elements/icons/128x128/xcode.png "Some hover text")

![Apple logo](Apple.png "Some hover text")

#### Videos

Display an inline video player for a specified file in the resources of the playground.

<!--![Video Reference](videoResource.mp4 "Some hover text")-->

### Inserting Callouts

- Author: Nombre Completo

- Authors: Autor Principal\
\
Nombre De Una Persona que Modificó o Aportó al Documento

- Copyright: Copyright © 1215 by The Group of Barrons

- SeeAlso: [My Library Reference](https://example.com)

- Note: "There is nothing either good or bad, but thinking makes it so."

- Experiment: Pass in a string in the present tense

- Important: "The beginning is the most important part of the work."

- Tip: This is a Tip

- Warning: This is a Warning

### Escaping Special Characters

#### Escaping

Treat the following character as a plain charactere instead of a markup delimiter.

\* This is not a bullet item
* This is a bullet item

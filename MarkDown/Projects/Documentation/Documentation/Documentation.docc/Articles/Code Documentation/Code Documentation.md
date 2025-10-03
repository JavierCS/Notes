# Documentación usando Markup Formatting

En este artículo te mostraremos los lineamentos que necesitarás para documentar correctamente el código que escribas para la aplicación.

## Overview

El Markup es utilizado principalmente para la implementación de la ayuda rápida (*Quick Help*) y la descripción de la función de auto completado (*Code Completion*) de Xcode como se muestra en las siguientes figuras.

![](MarkupUsage.png)

Es importante destacar que la documentación que se muestra en ambas imágenes ha sido generada por el mismo Markup, la única diferencia es que la de la primer imagen se muestra automáticamente en el auto completado mientras estamos escribiendo código, el *Quick Help* popover aparece haciendo option + click sobre la función y la *Quick Help* simple aparece en la pestaña de ayuda de la barra de utilidades al poner el cursor sobre la función.

- - -
### Uso del Markup

Markup utiliza delimitadores basados en caracteres para marcar el texto formateado, estos delimitadores incluyen funcionalidad para:

* Dar formato a una linea de texto
* Dar formato a varias lineas de texto
* Dar formato a un grupo de caracteres
* Insertar enlaces a contenido web
* Insertar archivos
* Insertar notas

![](MarkupFormattingDocumentation.png)

- - -
### Delimitadores Disponibles

El Markup de swift pone a nuestra disposición varios delimitadores para hacer una documentación más completa de nuestras Clases y Funciones, a continuación tendrás un listado de todos los delimitadores disponibles para realizar una documentación adecuada.

#### Delimitadores para dar formato

**Headings**

Se utiliza para crear Headings.

```
class MarkupClass {
    // MARK: - Formatting a Line of Text
    
    /**
     Little description for the function
     
     Display a line of text formatted as a heading.
     
     This is a Heading 1
     ===================
     ## This is a Heading 2
     */
    func headings() {}
}
```

**Bulleted Lists**

Se utiliza para crear listas con viñetas.

```
class MarkupClass {
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
}
```

**Numbered Lists**

Se utiliza para crear listas numeradas.

```
class MarkupClass {
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
}
```

- Note: Si los números están incorrectos, al compilarse la documentación se ordenarán sin afectar  el orden de los elementos.

**Code Block**

Se utiliza para insertar bloques de código que pueden usarse como ejemplos.

```
class MarkupClass {
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
}
```

**Code Voide**

Se utiliza para nombrar individualmente clases y palabras reservadas en tu documentación.

```
class MarkupClass {
    /**
     Little description for the function
     
     Render a span of text using the font for code voice.
     
     An example of using a *code voice*
     
     Show Swift elements such as `for` and `let` as monspaced code font
     */
    func codeVoice() {}
}
```

**Italics**

Se utiliza para mostrar letras itálicas.

```
class MarkupClass {
    /**
     Little description for the function
     
     Render a span of text using the font face for emphasis.
     
     This line has a word with *emphasis*.
     
     This line uses _emphasis for the last six words_.
     */
    func italics() {}
}
```

**Bold**

Se utiliza para mostrar letras negritas.

```
class MarkupClass {
    /**
     Little description for the function
     
     Render a span of text using the strong font face.
     
     An example of using *strong*
     
     A **strong * (asterisk)** is on this line.
     
     __A strong line__.
     */
    func bold() {}
}
```

#### Delimitadores para insertar links

**Links**

Se utiliza para insertar links .

```
class MarkupClass {
    /**
     Little description for the function
     
     Add a link to a text-based resource such as a web URL or email.
     
     - seealso: [The Swift Standard Library Reference](https://developer.apple.com/library/prerelease/ios//documentation/General/Reference/SwiftStandardLibraryReference/index.html)
     */
    func insertingLinks() {}
}
```

**Link Reference**

Se utiliza para referenciar un link en diferentes partes de la documentación.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add a named reference to a URL that can be used in multiple places.
     
     [The Swift Programming Language]: http://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ "Some hover text"
     
     For light summer reading we suggest [The Swift Programming Language].
     
     ### Useful books
     * [The Swift Programming Language]
     */
    func insertingLinksReference() {}
}
```

#### Delimitadores para insertar recursos

**Images**

Se utiliza para insertar una imagen.

```
class MarkupClass {
    /**
     Little description for the function
     
     Include inline images.
     
     ![Xcode icon](http://devimages.apple.com.edgekey.net/assets/elements/icons/128x128/xcode.png "Some hover text")
     */
    func insertingImage() {}
}
```

- Note: Las imágenes pueden consumirse directamente desde una url o ser obtenidas localmente.

#### Delimitadores exclusivos para funciones

**Parameter / Parameters**

Se utiliza para especificar los parámetros de entrada de tu función.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add a block of markup using these special opening and closing comment markers.
     
     - Parameters:
     - parameterOne: First Parameter description
     - parameterTwo: Second Parameter description
     */
    func blockComent(parameterOne: Int, parameterTwo: Int) {}
}
```

- Note: En la descripción de cada parámetro haz énfasis en lo que representa y el tipo.

**Returns**

Se utiliza para especificar el tipo de retorno de tu función.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add a block of markup using these special opening and closing comment markers.
     
     - Returns: Return Value description
     */
    func blockComent() -> Int {
        return 0
    }
}
```

**Throws**

Se utiliza para especificar el tipo de errores que pueden interrumpir el llamado de la función.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add a block of markup using these special opening and closing comment markers.
     
     - Throws: `Error.Type` description
     */
    func blockComent() throws {}
}
```

#### Delimitadores para insertar anotaciones

**Attention**

Se utiliza para denotar atención en una particularidad del símbolo que estás documentando.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add an Attention callout to the Quick Help for a symbol using the Attention delimiter. Multiple Attention callouts appear in the description section in the same order as they do in the markup.
     
     - Attention: AttentionText
     */
    func attentionDelimiterUsage() {}
}
```

**Author**

Se utiliza para hacer referencia al creador de la clase o función en la que se utiliza.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add an Author callout with a single name to the Quick Help for a symbol using the Author delimiter. Multiple Author callouts appear in the description section in the same order as they do in the markup.
     
     - Author: Javier Cruz Santiago
     */
    func authorDelimiterUsage() {}
}
```

**Authors**

Se utiliza para hacer referencia a los creadores y modificadores de la clase o función que la utiliza.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add an Authors callout with a list of authors to the Quick Help for a symbol. The order of the authors in Quick Help is the same as the order they appear in the delimiter. Multiple Authors delimiters are added to Quick Help in the order that they appear in the markup.
     
     - Authors: Javier Cruz Santiago\
     \
     Nombre De Otra Persona
     */
    func authorsDelimiterUsage() {}
}
```

**Bug**

Se utiliza para denotar bugs pendientes por resolver en la clase o función en la que se utiliza.

```
class MarkupClass {
    /**
     Little description for the function
     
     Adds a Bug callout to the Quick Help for a symbol using the Bug delimiter. Multiple Bug callouts appear in the description section in the same order as they do in the markup.
     
     - Bug: Simple description for a bug
     - Bug: [Passing a `UIViewController` crashes *bugExample*](BugDB://problem/2274610)
     */
    func bugDelimiterUsage() {}
}
```

**Complexity**

Se utiliza para indicar la complejidad de un algoritmo.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add a Complexity callout to the Quick Help for a symbol using the Complexity delimiter. Multiple Complexity callouts appear in the description section in the same order as they do in the markup.
     
     - Complexity: The method demonstrates an inefficient way to sort using an O(N\*N\*N) (order N-cubed) algorithm
     */
    func complexityDelimiterUsage() {}
}
```

**Copyright**

Se utiliza para denotar derechos de autor.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add a Copyright callout to the Quick Help for a symbol using the Copyright delimiter. Multiple Copyright callouts appear in the description section in the same order as they do in the markup.
     
     - Copyright: Copyright © 1215 by The Group of Barrons
     */
    func copyrightDelimiterUsage() {}
}
```

**Date**

Se utiliza para indicar fechas.

```
class MarkupClass {
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
}
```

**Experiment**

Se utiliza para sugerir experimentos al lector para ayudarlo a comprender las funcionalidades de una clase o función.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add an Experiment callout to a playground or to the Quick Help for a symbol using the Experiment delimiter. Multiple Experiment callouts appear in the description section in the same order as they do in the markup.
     
     - Experiment: Pass in a string in the present tense
     - Experiment: Pass in a string with no vowels
     - Experiment: Change the third case statement to work only with consonants
     */
    func experimentDelimiterUsage() {}
}
```

**Important**

Se utiliza para notificar al lector de las consideraciones importantes que implica el uso de la clase / función documentada con este delimitador.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add an Important callout to a playground or to the Quick Help for a symbol using the Important delimiter. Multiple Important callouts in Quick Help appear in the description section in the same order as they do in the markup.
     
     Use the callout to highlight information that can have adverse effects on the tasks a user is trying to accomplish.
     
     - Important: "The beginning is the most important part of the work."  
     \
     –Plato
     */
    func importantDelimiterUsage() {}
}
```

**Invariant**

Se utiliza para denotar una condición que siempre será true durante la ejecución del símbolo documentado con este delimitador.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add an Invariant callout to the description of a symbol using the Invariant delimiter. Multiple Invariant callouts appear in the description section in the same order as they do in the markup.
     
     Use the callout to display a condition that is guaranteed to be true during the execution of the documented symbol.
     
     - Invariant: The person reference will not change during the execution of this method
     */
    func invariantDelimiterUsage() {}
}
```

**Note**

Se utiliza para agregar notas que complementen la información proporcionada al lector.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add a Note callout to a playground or to the Quick Help for a symbol using the Note delimiter. Multiple Note callouts in Quick Help appear in the description section in the same order as they do in the markup.
     
     - Note: This method returns an estimate.
     Use `reallyAccurateReading` to get the best results.
     */
    func noteDelimiterUsage() {}
}
```

**Precondition**

Se utiliza para notificar al lector de las condiciones previas que se tienen que cumplir para el correcto funcionamiento.

```
class MarkupClass {
    /**
     Little description for the function
     
     Adds a Precondition callout to the Quick Help for a symbol. Multiple Precondition callouts appear in the description section in the same order as they do in the markup.
     
     Use the callout to document any conditions that are held for the documented symbol to work.
     
     - Precondition: The `person` property must be non-nil.
     - Precondition: `updatedAddress` must be a valid address.
     */
    func preconditionDelimiterUsage() {}
}
```

**Postcondition**

Se utiliza para documentar las condiciones que se cumplirán al término de la ejecución exitosa del símbolo documentado.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add a Postcondition callout to the Quick Help for a symbol using the Postcondition delimiter. Multiple Postcondition callouts appear in the description section in the same order as they do in the markup.
     
     Use the callout to document conditions which have guaranteed values upon completion of the execution of the symbol.
     
     - Postcondition: After completing this method the billing address for the person will be set to `updatedAddress` if it is valid. Otherwise the billing address will not be changed.
     */
    func postconditionDelimiterUsage() {}
}
```

**Remark**

Se utiliza para hacer notas de posibles mejoras al símbolo documentado.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add a Remark callout to the Quick Help for a symbol using the Remark delimiter. Multiple Remark callouts appear in the description section in the same order as they do in the markup.
     
     - Remark: The performance could be reduced from N-squared to N-log-N by switching patterns.
     */
    func remarkDelimiterUsage() {}
}
```

**Requires**

Se utiliza para marcar requerimientos para el correcto funcionamiento del símbolo, puede utilizarse de manera similar al **Precondition**.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add a Requires callout to the Quick Help for a symbol using the Requires delimiter. See Precondition for usage.
     
     - Requires: `start <= end`.
     - Requires: `count > 0`.
     */
    func requiresDelimiterUsage() {}
}
```

**SeeAlso**

Se utiliza para hacer referencia a mas documentación o contenido web.

```
class MarkupClass {
    /**
     Little description for the function
     
     Adds a See also callout to the Quick Help for a symbol using the See Also delimiter. Multiple See also callouts appear in the description section in the same order as they do in the markup.
     
     Use the callout to add references to other information.
     
     - SeeAlso: [My Library Reference](https://example.com)
     */
    func seeAlsoDelimiterUsage() {}
}
```

**Since**

Se utiliza para indicar cuando el símbolo documentado con este delimitador se hizo disponible.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add a Since callout to the Quick Help for a symbol using the Since delimiter. Multiple Since callouts appear in the description section in the same order as they do in the markup.
     
     Use the callout to add information about when the symbol became available. Some example of the types of information include dates, framework versions, and operating system versions.
     
     - Since: First available in Mac OS 7
     */
    func sinceDelimiterUsage() {}
}
```

**Version**

Se utiliza para delimitar versiones

```
class MarkupClass {
    /**
     Little description for the function
     
     Add a Version callout to the Quick Help for a symbol using the Version delimiter. Multiple Version callouts appear in the description section in the same order as they do in the markup.
     
     - Version: 0.1 (61A329)
     */
    func versionDelimiterUsage() {}
}
```

**Warning**

Se utiliza para advertir al lector sobre consideraciones importantes sobre el uso del símbolo documentado con este delimitador.

```
class MarkupClass {
    /**
     Little description for the function
     
     Add a Warning callout to the Quick Help for a symbol using the Warning delimiter. Multiple Warning callouts appear in the description section in the same order as they do in the markup.
     
     - Warning: Not all code paths for this method have been tested
     */
    func warningDelimiterUsage() {}
}
```

**Escaping Special Characters**

Usa `\` para manejar caracteres especiales.

```
class MarkupClass {
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
}
```

- - -
### Documentación del código

En la sección anterior se expusieron los delimitadores para la documentación de símbolos en Xcode (*Quick Help*) y en el siguiente extracto de código puedes observar un ejemplo de como documentar tu código debidamente con **Markup**.

```
// MARK: Class / Struct Documentation
/**
 Little description for the class
 
 Complete overview for the class
 
 - Authors: Nombre del primer autor\
 Nombre del segundo autor\
 Nombre del tercer autor
 - Version: 0.1 (61A329)
 */
class YourClassName {
    // MARK: Attribute Documentation
    /// Very simple description about your attribute
    var yourFirstAttribute: String = ""
    /**
     Little escription about your attribute
     
     Complete discussion about your attribute usage and its possible values
     */
    var yourSecondAttributeName: Int = 0
    
    // MARK: Function Documentation
    /**
     Little description for the function
     
     Complete summary for this function
     
     - Parameters:
        - parameterOne: Description for the first parameter of type `Int`
        - parameterTwo: Description for the second parameter of type `String`
     - Returns: Description for the return value of type `UUID`
     - Throws: `Error.Type`
     */
    func yourFunctionName(parameterOne: Int, parameterTwo: String) throws -> UUID {
        return UUID()
    }
}

// MARK: Protocol Documentation
/**
 Little description for the protocol
 
 Complete overview for the protocol
 
 - Author: Nombre del autor
 */
protocol YourProtocolName {
    // MARK: Protocol Function Documentation
    /**
     Little description for your function
     
     Summary for the function usage making reference to `YourProtocolName`
     */
    func protocolFunction()
}
```

- Author: Javier Cruz Santiago
- Version: 1.0
- Copyright: Copyright © 2024 by Javier Cruz Santiago
- SeeAlso: [Apple Markup Formatting Reference](https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/)

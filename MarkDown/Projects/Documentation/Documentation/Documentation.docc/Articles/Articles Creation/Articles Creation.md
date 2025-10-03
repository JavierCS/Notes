# Creación de Artículos con Markdown

En este artículo te mostraremos los lineamentos que necesitarás para crear artículos que podrían ser de interés para los desarrolladores que participan en la aplicación.

## Overview

En el vertiginoso mundo del desarrollo de aplicaciones iOS con Xcode, la documentación clara y precisa es fundamental para el éxito del proyecto. Es aquí donde Markdown emerge como una herramienta indispensable, simplificando la creación y el enriquecimiento de la documentación de Xcode.

**¿Qué es el Markdown?**

Markdown es un lenguaje de marcado ligero que permite dar formato al texto de manera sencilla y legible utilizando una sintaxis simple y minimalista. Diseñado para ser fácil de aprender y utilizar, Markdown se ha convertido en la elección preferida de muchos desarrolladores y escritores para la creación de contenido web y documentación técnica.

**Importancia de usar Markdown en proyectos de Xcode**

La importancia de utilizar Markdown en proyectos de Xcode radica en su capacidad para simplificar el proceso de documentación, permitiendo a los desarrolladores concentrarse en la creación de contenido sin distraerse con la complejidad de los formatos tradicionales. Al utilizar Markdown, los equipos de desarrollo pueden crear y mantener documentación clara y coherente, lo que facilita la comprensión y colaboración entre los miembros del equipo.

En este artículo, exploraremos cómo aprovechar al máximo Markdown en la documentación de proyectos de Xcode. Descubriremos cómo Markdown puede mejorar la calidad y la accesibilidad de la documentación de Xcode, impulsando así el éxito del proyecto y la satisfacción de los desarrolladores involucrados.

![](MarkDownArticle.png)

## Delimitadores

Antes de crear nuestro primer artículo es necesario conocer todas las opciones que tenemos a nuestra disposición para hacer mas amena la lectura de nuestro artículo.

### Comment

Para escribir comentarios se abre el texto con `<!--#` y se cierra con `-->`

**Ejemplo:**

```
<!--# Comment-->
```

### Heading

El delimitador Heading se utiliza para los títulos.

**Código:**

```
<!--# Heading 1 String-->
## Heading 2 String
### Heading 3 String
#### Heading 4 String
##### Heading 5 String
###### Heading 6 String
```

**Salida:**

## Heading 2 String
### Heading 3 String
#### Heading 4 String
##### Heading 5 String
###### Heading 6 String

- Important: Es importante destacar que Heading 1 `#` está comentado porque es reservado para el título del Artículo, por lo que su uso en cualquier otra parte generará un `warning` en Xcode

### Lists

Se usa para generar listas numeradas o con bullets.

**Código:**

```
#### Bulleted Lists

Display text as a bulleted list.

- Item 1
- Item 2
- Item 3
- Item 4

#### Numbered Lists

Display text in a numbered list.

1. Cat
3. Dog
    1. Golden Retriever
2. Llama
```

**Salida:**

### Bulleted Lists

Display text as a bulleted list.

- Item 1, List A
- Item 2, List A
* Item 1, List B
+ Item 1, List C

### Numbered Lists

Display text in a numbered list.

1. Cat
3. Dog
   1. Golden Retriever
2. Llama

- Important: Es importante mencionar que como se observa en el ejemplo, las listas enumeradas los número se ordenan automáticamente pero el contenido se queda en la misma posición y es sensible a tabulaciones lo que permite hacer sub listas.

### Code Blocks

Se puede utilizar para insertar ejemplos en código del tema que se está abordando dentro del artículo.

**Código:**

```
\```
for character in "Aesop" {
    println(character)
}
\```
```

**Salida:**

```
for character in "Aesop" {
    println(character)
}
```

- Warning: En tu código debes omitir los `\` de tal manera que solo quede ` ``` ` para que funcione correctamente, yo los utilicé para poder meter el ejemplo en un **Code Block**

### Code Voice

Se usa para hacer referencia a nombres de clases, estructuras, protocolos, palabras reservadas, etc.

**Código:**

```
Show Swift elements such as `for` and `let` as monspaced code font
```

**Salida:**

Show Swift elements such as `for` and `let` as monspaced code font

### Italics

Se utiliza para letras itálicas.

**Código:**

```
This line has a word with **emphasis**.
 
This line uses _*emphasis for the last six words*_.
```

**Salida:**

This line has a word with **emphasis**.
 
This line uses _*emphasis for the last six words*_.

### Bold

Se utiliza para letras en negritas.

**Código:**

```
A **strong * (asterisk)** is on this line.

__A strong line__.
```

**Salida:**

A **strong * (asterisk)** is on this line.

__A strong line__.

### Links

Se utiliza para insertar Links.

**Código:**

```
For more information, see [The Swift Programming Language](http://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/)
```

**Salida:**

For more information, see [The Swift Programming Language](http://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/)

### Link Reference

Se usa para insertar Links y hacer referencia a ellos en múltiples ocaciones.

**Código:**

```
<!--Setup and use a link reference.-->
[The Swift Programming Language]: http://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ "Some hover text"
 
For light reading we suggest [The Swift Programming Language].
 
For more information, see [The Swift Programming Language].
 
If you are not sure, please see [The Swift Programming Language].
```

**Salida:**

<!--Setup and use a link reference.-->
[The Swift Programming Language]: http://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ "Some hover text"
 
For light reading we suggest [The Swift Programming Language].
 
For more information, see [The Swift Programming Language].
 
If you are not sure, please see [The Swift Programming Language].

### Images

Se utiliza para insertar imágenes ya sea de una fuente web o local.

**Código:**

```
![Xcode icon](http://devimages.apple.com.edgekey.net/assets/elements/icons/128x128/xcode.png "Some hover text")

![](MarkDownArticle.png "Some hover text")
```

**Salida:**

![Xcode icon](http://devimages.apple.com.edgekey.net/assets/elements/icons/128x128/xcode.png "Some hover text")

![](MarkDownArticle.png)

### Videos

Se utiliza para insertar videos ya sea de una fuente web o local.

**Código**

```
<!--![Video Reference](videoResource.mp4 "Some hover text")-->
```

### Callouts

Se utilizan para especificar información adicional dentro de tu artículo.

**Código:**

```
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
```

**Salida:**

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

## Creación de un Artículo

Para la creación de artículos dentro del proyecto es importante que conozcas la ubicación de todos los artículos disponibles para su lectura.

### Ubicación

Dentro del proyecto encontrarás un archivo de tipo **Documentation Catalog** que se ve de la siguiente manera.

![](DocumentationFolder.png)

Dentro del catálogo debería haber una carpeta llamada **Articles**, si esta carpeta no está creada es tu responsabilidad crearla.

![](ArticlesFolder.png)

Dentro de la carpeta **Articles** encontraremos todos los artículos que serán compilados junto con la documentación del proyecto.

![](ArticlesStructure.png)

- Important: Cada artículo debe contener su archivo `.md` y una carpeta **Resources** donde se encontrarán los recursos utilizados dentro de dicho artículo.

### Creación del Artículo

Una vez comprendida la estructura del **Documentation Catalog** para crear nuestro primer artículo bastará con realizar el siguiente procedimiento:

1. Crear la carpeta contenedora con un nombre que haga alusión al tema que se abordará dentro del artículo.
2. Dar click derecho sobre la carpeta que contendrá nuestro artículo.
3. Seleccionar la opción *New File…*
4. Una vez que aparezca la ventana de templates, seleccionaremos *Article File*
5. Nombraremos nuestro archivo `.md` igual que su carpeta contenedora y daremos click en la opción *Create*.

Una vez creado nuestro artículo, tendremos un archivo con un contenido similar a este:

```
# ArticleTemplate

Summary

### ## Overview

Text

### Section Header

Text
```

### Estructura del Artículo

Con el template creado en la sección anterior deberíamos comenzar a escribir nuestro artículo de la siguiente manera

1. **ArticleTemplate** será reemplazado con un nombre descriptivo para tu Artículo.
2. **Summary** será reemplazado con un breve texto que describa el tema que abordará tu artículo.
3. El **Text** del *Heading* **Overview** será reemplazado por una breve introducción que introduzca conceptos importantes que se tocan dentro de tu artículo y una breve explicación de por qué es importante la lectura de dicho artículo.
4. **Section Header** será reemplazado por el nombre del primer tema que se abordará en tu Artículo.
5. El **Text** del *Heading* **Section Header** se reemplazará con el contenido del primer tema.
6. Seguido continuarás desarrollando temas y haciendo anotaciones con todos los *Delimitadores* y *Callouts* que explicamos previamente.
7. Para finalmente concluir con estos *Callouts*

```
- Author: Tu Nombre Completo (Tu Número De Empleado) 
- Version: 1.0
- Copyright: Copyright © 2024 by Empresa
```

- Tip: Puedes agregar el *Callout* `- SeeAlso: ` en caso de que quieras hacer referencia a contenido web que hayas usado como referencia para el desarrollo de tu artículo o a otros artículos que podrían complementar el tuyo.

- Author: Javier Cruz Santiago 
- Version: 1.0
- Copyright: Copyright © 2024 by Javier Cruz Santiago


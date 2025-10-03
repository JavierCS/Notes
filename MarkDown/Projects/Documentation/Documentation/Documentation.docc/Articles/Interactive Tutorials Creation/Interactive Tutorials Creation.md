# Tutoriales Interactivos con DocC

En este artículo te mostraremos como crear tutoriales interactivos de tus componentes genéricos para que los demás desarrolladores aprendan a reutilizarlos dentro de sus desarrollos. 

## Overview

**DocC** es una herramienta de documentación desarrollada por **Apple**, diseñada específicamente para la creación de documentación interactiva y legible en **Swift** para proyectos en **Xcode**. Permite a los desarrolladores crear documentación clara y detallada, enriquecida con contenido interactivo, como tutoriales paso a paso, fragmentos de código ejecutables y vistas previas en vivo de interfaces de usuario.

La creación de tutoriales interactivos con **DocC** proporciona una forma efectiva de compartir conocimientos y fomentar la adopción de los componentes genéricos desarrollados en **Swift**. Al ofrecer una experiencia de aprendizaje guiada y práctica, los desarrolladores pueden comprender rápidamente cómo utilizar estos componentes. Además, los tutoriales interactivos permiten una retroalimentación instantánea y la resolución de problemas en tiempo real, lo que mejora la eficiencia y la calidad del desarrollo.

**DocC** no solo simplifica la creación de documentación en **Swift**, sino que también facilita la difusión de conocimientos y la colaboración entre desarrolladores mediante tutoriales interactivos, promoviendo así la reutilización y la eficiencia en el desarrollo de software.

![](DocC.png)

## Estructura de una Tabla de Contenidos

Para poder crear nuestro primer tutorial interactivo con **DocC** es necesario comprender el que una **Tabla de Contenidos** puede verse a grandes rasgos como un **Libro** que contiene varios **Capítulos**, cada capítulo puede contener uno o más **Tutoriales Interactivos**, y dentro de cada uno de estos tutoriales podemos tener diferentes secciones y una pequeña evaluación para evaluar los conocimientos adquiridos.

Por ejemplo podríamos tener un libro para el **Uso de Componentes Genéricos** de tal manera que podríamos tener una estructura como la siguiente

* Uso de Componentes Genéricos
  * UIComponents
    * Botón
      * Inicialización
      * Configuración
    * Label
    * Color
  * Links y URLs
    * Deep Links
    * Universal Links
  * Vistas Genéricas
    * List View
    * Ticket View
  * Persistencia
    * Core Data

Donde el **Primer Nivel**, representa al **Libro** el cual puede ser nombrado dependiendo del contenido que se aborde dentro de el, en el **Segundo Nivel** tenemos a los **Capítulos** que son sub temas del tema principal del libro y finalmente a su vez cada capítulo puede contener diferentes **Tutoriales** de temas muy específicos se deben dominar para completar cada capítulo.

## Creación de una Tabla de Contenidos

Una vez comprendida la estructura que tendremos para nuestros tutoriales podremos crear nuestra primer tabla de contenidos.

### Documentation Catalog

Dentro del proyecto debemos tener un **Documentation Catalog** que es una carpeta donde se encontrará toda la documentación, si no tenemos un **Documentation Catalog** puedes crearlo de la siguiente manera.

1. Dar click derecho sobre la carpeta raíz del proyecto.
2. Dar click en la opción *“New File…”*
3. Una vez que se abra la ventana de plantillas, seleccionamos la opción *“Documentation Catalog”* que se encuentra en la sección *“Documentation”*
4. Dar click en el botón *“Next”* 
5. Nombrar nuestro catálogo de documentación (usar el nombre *“Documentation”* de preferencia)
6. Dar click en el botón *“Create”*

![](DocumentationFolder.png)

Dentro de nuestro **Documentation Catalog** debemos tener los siguientes archivos:

* Carpeta **Articles**: Esta carpeta contendrá todos los artículos que forman parte de la documentación.
* Carpeta **Resources**: Esta carpeta contendrá recursos compartidos entre artículos y tutorials
* Markdown **Documentation**: Un archivo `.md` en el que hay un resumen de lo que trata el proyecto y lo que podrás encontrar dentro de la documentación.
* Carpeta **Tutorials**: Esta carpeta contendrá nuestros “Libros” con todos los temas que cuentan con tutoriales interactivos para hacer a los desarrolladores más sencilla la reutilización de componentes genéricos.

![](DocumentationFolderContent.png)

- Important: Si el **Documentation Catalog** no tiene esta estructura es tu deber como primer persona en realizar documentación darle esta estructura para tener una mejor organización.

### Creación del Libro

Dentro de la carpeta **Tutorials** crearemos otra carpeta para nuestro **Libro**

![](GenericComponentsFolder.png)

### Creación de la Table of Contents

Una vez creada la carpeta para nuestro **Libro** seguiremos los siguientes pasos para crear nuestra **Table of Contents**

1. Damos click derecho sobre la carpeta.
2. Seleccionamos la opción “New File…”*.
3. Una vez que se abra la ventana de plantillas, seleccionamos la opción *“Tutorial Table of Contents”* que se encuentra en la sección *“Documentation”*.
4. Dar click en el botón *“Next”* .
5. Nombrar nuestro catálogo de documentación (usar el nombre *“[Nombre del Libro] Table of Contents”* de preferencia).
6. Dar click en el botón *“Create”*.
7. Volver a dar click derecho sobre la carpeta raíz del libro.
8. Crear una carpeta llamada *“Chapter 01”* la cual será utilizada mas adelante.

![](GenericComponentsTableOfContents.png)

### Contenido del archivo Table of Contents

Una vez creada nuestra tabla de contenidos el contenido del archivo lucirá de la siguiente manera:

```
@Tutorials(name: "text") {
    @Intro(title: "text") {
        text
        
        @Image(source: file, alt: "accesible description")
    }
    
    @Chapter(name: "text") {
        text

        @Image(source: file, alt: "accesible description")

        @TutorialReference(tutorial: "doc:tutorial name")
    }
}
```

Esta plantilla la llenaremos de la siguiente manera:

1. En la etiqueta **@Tutorials**, para el valor *“name”* escribiremos completo el nombre del archivo de la tabla de contenido.
2. En la etiqueta **@Intro** para el valor “title” escribiremos el título del **Libro** (este título es el que se verá en la documentación al compilarla), seguido escribiremos una breve descripción **Libro**.
3. En la etiqueta **@Image**, para el valor “source” escribiremos el nombre de una imagen diseñada para ser la carátula del tutorial mientras que para el valor “alt” podemos dejar una cadena vacía o agregar una descripción de accesibilidad. Esta imagen es opcional así que puedes omitirla si no tienes una imagen que haga alusión al contenido de tu **Libro**.
4. En la etiqueta **@Chapter**, para el valor “name” escribiremos el nombre del capítulo 1, seguido escribiremos una breve descripción de lo que trata dicho capítulo.
5. La segunda etiqueta **@Image** se llena de igual manera que la del paso número 2 pero aquí se usa una imagen diseñada para ser acorde al contenido del capítulo 1.
6. La etiqueta **@TutorialReference** la dejaremos vacía de momento.

Una vez llenada la plantilla tu tabla de contenidos debería verse algo similar a esto:

```
@Tutorials(name: "Tabla de Contenidos Tema 1") {
    @Intro(title: "Tema 1") {
        Esto es una Tabla de contenidos para tutoriales interactivos
        
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Cursus eget nunc scelerisque viverra mauris. Vestibulum sed arcu non odio euismod lacinia at quis risus. Accumsan sit amet nulla facilisi morbi tempus iaculis urna id. Nulla facilisi morbi tempus iaculis urna id volutpat lacus laoreet. Mi proin sed libero enim. Nam libero justo laoreet sit amet cursus sit amet dictum. Ultricies integer quis auctor elit sed vulputate mi. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Sit amet commodo nulla facilisi. Viverra nam libero justo laoreet sit amet. Curabitur gravida arcu ac tortor dignissim convallis aenean et. Felis eget velit aliquet sagittis. At risus viverra adipiscing at in tellus integer feugiat. Pretium viverra suspendisse potenti nullam ac tortor vitae purus.
        
        @Image(source: "Apple.png", alt: "appleLogo")
    }
    
    @Chapter(name: "Nombre del Capitulo 1") {
        Descripción del Capitulo
        @Image(source: "Swift.png", alt: "swiftLogo")
        @TutorialReference(tutorial: "tutorial name")
    }
}
```

## Creación de un Tutorial

Una vez creada la tabla de contenidos seguiremos el siguiente procedimiento para crear el primer tutorial:

1. Damos click derecho sobre la carpeta *“Chapter 01”*.
2. Seleccionamos la opción “New File…”*.
3. Una vez que se abra la ventana de plantillas, seleccionamos la opción *“Tutorial File”* que se encuentra en la sección *“Documentation”*.
4. Dar click en el botón *“Next”* .
5. Nombrar nuestro tutorial (usar el nombre *“[Something] + Tutorial”* de preferencia).
6. Dar click en el botón *“Create”*.
7. Volver a dar click derecho sobre la carpeta raíz del capítulo.
8. Crear una carpeta llamada *“Resources”* la cual será utilizada para los recursos del capítulo.

Una vez creado el archivo del tutorial, podemos regresar al archivo **Table of Contents** y sustituir `tutorial name` por el nombre del archivo creado.

```
@Tutorials(name: "Tabla de Contenidos Tema 1") {
    @Intro(title: "Tema 1") {
        Esto es una Tabla de contenidos para tutoriales interactivos
        
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Cursus eget nunc scelerisque viverra mauris. Vestibulum sed arcu non odio euismod lacinia at quis risus. Accumsan sit amet nulla facilisi morbi tempus iaculis urna id. Nulla facilisi morbi tempus iaculis urna id volutpat lacus laoreet. Mi proin sed libero enim. Nam libero justo laoreet sit amet cursus sit amet dictum. Ultricies integer quis auctor elit sed vulputate mi. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Sit amet commodo nulla facilisi. Viverra nam libero justo laoreet sit amet. Curabitur gravida arcu ac tortor dignissim convallis aenean et. Felis eget velit aliquet sagittis. At risus viverra adipiscing at in tellus integer feugiat. Pretium viverra suspendisse potenti nullam ac tortor vitae purus.
        
        @Image(source: "Apple.png", alt: "appleLogo")
    }
    
    @Chapter(name: "Nombre del Capitulo 1") {
        Descripción del Capitulo
        @Image(source: "Swift.png", alt: "swiftLogo")
        @TutorialReference(tutorial: "doc:TutorialDemo")
    }
}

```

- Important: Cada etiqueta **@Tutorials** puede contener mas de un **@Chapter**, y cada **@Chapter** pude contener más de un **@TutorialReference**, basta con seguir agregando etiquetas de manera secuencial.

Así se vería una **Table of Contents** con dos **@Chapter** y donde el primer **@Chapter** cuenta con dos **@TutorialReference**.

```
@Tutorials(name: "Tabla de Contenidos Tema 1") {
    @Intro(title: "Tema 1") {
        Esto es una Tabla de contenidos para tutoriales interactivos
        
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Cursus eget nunc scelerisque viverra mauris. Vestibulum sed arcu non odio euismod lacinia at quis risus. Accumsan sit amet nulla facilisi morbi tempus iaculis urna id. Nulla facilisi morbi tempus iaculis urna id volutpat lacus laoreet. Mi proin sed libero enim. Nam libero justo laoreet sit amet cursus sit amet dictum. Ultricies integer quis auctor elit sed vulputate mi. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Sit amet commodo nulla facilisi. Viverra nam libero justo laoreet sit amet. Curabitur gravida arcu ac tortor dignissim convallis aenean et. Felis eget velit aliquet sagittis. At risus viverra adipiscing at in tellus integer feugiat. Pretium viverra suspendisse potenti nullam ac tortor vitae purus.
        
        @Image(source: "Apple.png", alt: "appleLogo")
    }
    
    @Chapter(name: "Nombre del Capitulo 1") {
        Descripción del Capitulo
        @Image(source: "Swift.png", alt: "swiftLogo")
        @TutorialReference(tutorial: "doc:TutorialDemo")
        @TutorialReference(tutorial: "doc:TutorialDemoTwo")
    }
    
    @Chapter(name: "Nombre del Capitulo 2") {
        Descripción del Capitulo
        @Image(source: "Swift.png", alt: "swiftLogo")
        @TutorialReference(tutorial: "doc:TutorialDemoThree")
    }
}

```

![](MultipleChaptersAndTutorialTableOfContents.png)

- Note: El primer tutorial del capítulo 1 muestra `<#text#>` y no muestra el tiempo estimado ya que se creó un archivo **Tutorial File** y se dejó la plantilla ya que solo se hizo de manera ilustrativa para la imagen anterior.

### Contenido del archivo Tutorial

Una vez creado nuestro archivo de Tutorial su contenido lucirá de la siguiente manera:

```
@Tutorial(time: number) {
    @Intro(title: "text") {
        text

        @Image(source: file, alt: "accessible descrption")
    }

    @Section(title: "text") {
        @ContentAndMedia {
            text

            @Image(source: file, alt: "accessible descrption")
        }

        @Steps {
            @Step {
                text

                @Image(source: file, alt: "accessible descrption")
            }

            @Step {
                text

                @Code(name: "display name", file: filename.swift)
            }
        }
    }
}
```

La plantilla del tutorial se llenará de la siguiente manera:

1. La etiqueta **@Tutorial** denota el cuerpo del tutorial y el valor *“time”* se llena con el número de minutos que le tomará al lector realizar el desarrollo para el que se construyó este tutorial.
2. La etiqueta **@Intro** se utiliza para crear una introducción, el valor *“title”* se llena con el Título del tutorial, seguido de una descripción en la que puedes tener una introducción y platicar de lo que se hará en el tutorial.
3. La etiqueta **@Image** dentro de la etiqueta **@Intro** se utiliza para poner una imagen de fondo en la descripción del tutorial, para mantener una linea te recomendaría que utilizaras la misma imagen que usaste para hacer referencia al capítulo que contiene este tutorial en la tabla de contenidos que creamos previamente y se llena igual que las etiquetas **@Image** vistas anteriormente.
4. La etiqueta **@Section** representa una sección dentro del tutorial y se llena con el valor *“title”* que es el nombre de la sección, seguido de una etiqueta **@ContentAndMedia** y una etiqueta **@Steps**.
5. La etiqueta **@ContentAndMedia** dentro de una etiqueta **@Section** se usa para dar una breve introducción a lo que se hará en esa sección acompañada de una imagen alusiva a dicho contenido.
6. La etiqueta **@Steps** se utiliza para definir el área de trabajo donde se definirán cada uno de los pasos a seguir para completar la sección.
7. La etiqueta **@Step** se utiliza para definir un paso el cual puede tener una descripción, notas y una imagen o un fragmento de código referenciados con las etiquetas **@Image** y **@Code** respectivamente.
8. La etiqueta **@Code** se usa para mostrar un archivo de código Swift, el valor *“name”* se llena con un nombre que haga alusión al contenido del archivo y el valor *“file”* se llena con el nombre del archivo swift

- Warning: Es muy importante que sepas que los archivos swift dentro de **Documentation.docc** no se compilan por lo que si no quieres escribir mucho código para tu ejemplo puedes usar `. . .` para representar código que hay antes y después del código que realmente nos interesa.

- Important: Si usas la etiqueta **@Code** para tus pasos en los tutoriales debes crear una carpeta llamada **“Chapter Code”** dentro de la carpeta **Resources** del capítulo en el que estás trabajando, si por ejemplo vas a agregar un fragmento de código para el paso 3 de la sección 1 del capítulo 5 te recomiendo que el nombre del archivo sea Section01Step03.swift 

- Tip: **@Code** tiene un display name para poner un nombre mas alusivo mientras que ese nombre te permitirá llevar un mejor orden en tus archivos de código de ejemplo.

- Tip: Cada tutorial puede tener más de una sección así que no te limites para ser detallado con el procedimiento que hay que seguir.

Una vez comprendidas las etiquetas podemos llenar nuestro archivo de tutorial con el contenido que deseamos explicar.

```
@Tutorial(time: 60) {
    @Intro(title: "Título del Tutorial 1") {
        Descripción del Tutorial
        
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Cursus eget nunc scelerisque viverra mauris. Vestibulum sed arcu non odio euismod lacinia at quis risus. Accumsan sit amet nulla facilisi morbi tempus iaculis urna id. Nulla facilisi morbi tempus iaculis urna id volutpat lacus laoreet. Mi proin sed libero enim. Nam libero justo laoreet sit amet cursus sit amet dictum. Ultricies integer quis auctor elit sed vulputate mi. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Sit amet commodo nulla facilisi. Viverra nam libero justo laoreet sit amet. Curabitur gravida arcu ac tortor dignissim convallis aenean et. Felis eget velit aliquet sagittis. At risus viverra adipiscing at in tellus integer feugiat. Pretium viverra suspendisse potenti nullam ac tortor vitae purus.
        
        @Image(source: "Swift.png", alt: "swiftLogo")
    }
    
    @Section(title: "Título de Primer Sección") {
        @ContentAndMedia {
            Content And Media de la primer sección
            
            @Image(source: "Apple.png", alt: "appleLogo")
        }
        
        @Steps {
            @Step {
                Descripción del Paso 1
                
                Anotaciones importantes del paso 1
                
                @Image(source: "Swift.png", alt: "swiftLogo")
            }
            
            @Step {
                Descripción del Paso 2
                
                Anotaciones importantes del paso 2

                @Code(name: "Paso 2", file: TutorialDemoStep2.swift)
            }
        }
    }
    
    @Section(title: "Título de Segunda Sección") {
        @ContentAndMedia {
            Content And Media de la segunda sección
            
            @Image(source: "Apple.png", alt: "appleLogo")
        }
        
        @Steps {
            @Step {
                Descripción del Paso 1
                
                Anotaciones importantes del paso 1
                
                @Image(source: "Swift.png", alt: "swiftLogo")
            }
            
            @Step {
                Descripción del Paso 2
                
                Anotaciones importantes del paso 2

                @Code(name: "Paso 2", file: TutorialDemoStep2.swift)
            }
        }
    }
    
    @Assessments {
        @MultipleChoice {
            Write here your question
            
            @Choice(isCorrect: false) {
                Wrong Answer One
                
                @Justification(reaction: "Try Again!") {
                    Remember why this is not correct.
                }
            }
            
            @Choice(isCorrect: true) {
                Right Answer
                
                @Justification(reaction: "Well Done!") {
                    Justification why this answer is the right answer
                }
            }
            
            @Choice(isCorrect: false) {
                Wrong Answer Two
                
                @Justification(reaction: "Try Again!") {
                    Remember why this is not correct.
                }
            }
        }
    }
}

```

Lo cual nos producirá una salida como esta.

![](TutorialIntro.png)

![](TutorialSteps.png)

- Note: Conforme vayas haciendo scroll sobre el tutorial, de lado izquierdo se mostrarán las instrucciones y notas mientras que de lado derecho se mostrarán las imágenes o fragmentos de código.

## Evaluando el conocimiento adquirido

Finalmente utilizaremos la etiqueta **@Assessments** la cual se utilizará para definir el cuerpo de un pequeño cuestionario para evaluar el conocimiento adquirido durante el desarrollo del tutorial.

A continuación verás un ejemplo de implementación de un cuestionario

```
@Assessments {
    @MultipleCoice {
        Write here your question

        @Choice(isCorrect: false) {
            Wrong Answer One

            @Justification(reaction: "Try Again!") {
                Remember Why this is not correct.
            }
        }

        @Choice(isCorrect: true) {
            Right Answer

            @Justification(reaction: "Try Again!") {
                Justification why this answer is the right aswer
            }
        }

        @Choice(isCorrect: false) {
            Wrong Answer Two

            @Justification(reaction: "Try Again!") {
                Remember Why this is not correct.
            }
        }
    }
}
```

En el ejemplo anterior podemos observar nuevas etiquetas adicionales a **@Assessments** las cuales abordaremos en un momento.

1. La etiqueta **@Assessents** se coloca al final del tutorial y representa un cuestionario el cual puede contener etiquetas **@MultipleChoice**.
2. La etiqueta **@MultipleChoice** indica el tipo de pregunta de opción múltiple, se llena con la pregunta y varias etiquetas **@Choice**.
3. La etiqueta **@Choice** representa una posible respuesta a la pregunta y se llena con el valor *“isCorrect”* que representa si esa respuesta es la correcta a la pregunta, dentro de la etiqueta **@Choice** también se escribirá la posible respuesta a la pregunta acompañada de una etiqueta **@Justification**.
4. La etiqueta **@Justification** representa la justificación de por qué la respuesta del lector es correcta o incorrecta y se llena con el valor *“reaction”* que representa tu reacción a la respuesta dada por el lector y una justificación de por que dicha respuesta es correcta o incorrecta.

Una vez implementada la etiqueta **@Assessments** podemos ver un cuestionario con el siguiente formato

![](Assessments.png)

- Important: Dentro de **@Assessments**  podemos tener multiples etiquetas **@MultipleChoice** de tal manera que podamos corroborar que se dominen todos los temas abarcados durante el tutorial.

- Warning: Es importante que sepas que la sección de *Next* que aparece bajo la etiqueta **@Assessments** se genera automáticamente si DocC detecta que tienes más contenido.

Crea tutoriales interactivos para fomentar la reutilización de código ya que muchas veces estos componentes no se usan o les dan mal uso a falta de una buena documentación.

- Author: Javier Cruz Santiago 
- Version: 1.0
- Copyright: Copyright © 2024 by Javier Cruz Santiago
- SeeAlso: [Apple DocC Reference](https://www.swift.org/documentation/docc/)

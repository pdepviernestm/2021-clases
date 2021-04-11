# TP-0 de Funcional

Hola!,
la idea de este trabajo práctico es ganar un poco de tiempo instalando lo que vamos a usar durante la primera parte de la materia.

## ¿Qué hay que instalar?

### Git

git es una herramienta que vamos a usar a lo largo de toda la materia en los 3 paradigmas que vamos a ver.
En una de las primeras clases les vamos a explicar mejor para qué sirve y cómo lo vamos a usar.
Por ahora, lo que necesitan saber sobre git es que lo van a usar para bajarse los trabajos prácticos y luego subirlos a medida que los van resolviendo.

Link para descargar Git: https://git-scm.com/downloads

Si lo descargan en windows, asegurense de marcar Git Bash en lo que instalan, eso es para usarlo desde la consola.

Git se puede usar por línea de comandos o con una interfaz gráfica. En este primer ejercicio vamos a mostrar como usarlo por línea de comandos.

### Stack

Stack lo vamos a usar durante el paradigma funcional para trabajar con Haskell.
Haskell es el lenguaje de programación en el que vamos a programar, y stack es una herramienta para gestionar proyectos en Haskell.

Link para descargar Stack, explicado para diferentes sistemas operativos: https://docs.haskellstack.org/en/stable/README/#how-to-install

Si tienen algún problema usando Stack, revisen si es alguno de los mencionados acá, si no manden un mail pidiendo ayuda
https://github.com/pdep-utn/enunciados-miercoles-noche/blob/master/pages/haskell/troubleshooting.md

### Editor de texto

Lo que vamos a usar para literalmente escribir el código, para Haskell hay varias alternativas, nosotros recomendamos Visual Studio Code.

Dejo un link a una guía ya escrita para otro curso que está muy bien explicada: https://github.com/pdep-utn/enunciados-miercoles-noche/blob/master/pages/haskell/entorno.md#editor-de-texto

Si van a usar Visual Studio Code asegurense de instalar el plugin `Haskell` (https://marketplace.visualstudio.com/items?itemName=haskell.haskell), va a hacer que sea mucho más feliz programar en el lenguaje.

## Ya descargué todo, ¿y ahora qué?

Todavía nos falta instalar Haskell mismo, y vamos a usar Stack para eso.

1. El primer paso ahora es bajarse este repositorio. Para eso debemos copiar el link que nos muestra al hacer click en `Clone or download`

![Clickeando en Clone or Download, muestra el link de descarga](https://i.imgur.com/oqv4XFW.gif)

2. Abrimos la consola de git, para eso, buscamos el programa Git Bash que debería haberse instalado.
Cuando estan usando la consola, siempre están ubicados en alguna carpeta. Lo más probable es que la carpeta en la que estén por defecto sea la misma que cuando en el explorador de Windows adentro tiene las carpetas de Escritorio, Descargas, Documentos, etc.
Para chequear eso pueden usar uno de estos dos comandos que sirven para ver que hay en una carpeta: `dir` o `ls`.
(ignoren que el usuario se llama Garbarino)
![Captura de pantalla de Git Bash](https://i.imgur.com/zqQLjuO.png)

3. Usando la consola, nos movemos hacia la carpeta en la cual queremos descargar el ejercicio usando el comando `cd`.*

4. Clonar el repositorio a nuestra compu, para eso vamos a ejecutar:
`git clone linkQueCopiaronEnElPaso1`. Esto debería crearles una carpeta con el nombre del repositorio en su computadora.

5. Nos movemos a la carpeta del repositorio: `cd nombreDelRepositorio`.

6. Y en este paso, le pedimos a stack que compile el proyecto con `stack build`.
Este paso va a tardar un rato.
Como aun no tenemos Haskell instalado, en este paso Stack va a descargar la versión de Haskell que esté especificada en el proyecto. Como en todos los ejercicios vamos a usar la misma versión, es la única vez que va a pasar esto.

7. Una vez que terminó de descargarse e instalarse todo en el paso interior, vamos a correr los tests para garantizar que todo haya salido bien: `stack test`.
  
   Si ves este mensaje significa que todo ya está instalado y andando:
   ```
   Test de ejemplo
   El doble de un número es el número más si mismo
   ```

8. Abrir el proyecto con Visual Studio Code y validar que el plugin `Haskell` se haya instalado correctamente:
Desde visual studio code, abren la carpeta del ejercicio y van a `src/Library.hs`, si poniendo el cursor sobre "numero" les aparece un cartel que dice `Number`, significa que el plugin está funcionando :D.

9. Si llegaste hasta acá, ¡bien!, ya tenes todo instalado correctamente, manda un mail al docente avisando así nos enteramos cuantos pudieron instalar las cosas sin problemas.

A partir de acá, si querés jugar un poco con Haskell podés:

- Abrir el interprete para probar cosas corriendo este comando (estando ubicado en la carpeta del proyecto): `stack ghci`

- Escribir nuevo código en `src/Library.hs` y probarlo con tests que se escriben en `src/Spec.hs`

## Nota: ¿Por qué estamos usando Stack? ¿Qué es `import PdePreludat`?

Estamos usando Stack porque permite hacer algunas cosas que serían más difíciles de hacer con Haskell "pelado" como por ejemplo:
- Asegurarse que todos estemos trabajando con la misma versión de Haskell.
- Instalar dependencias (como el PdePreludat).
- Correr los tests.

PdePreludat es una librería que estamos usando en algunos cursos en vez de la librería estandar que usa Haskell por defecto (la cual se llama Prelude). Idealmente simplifica algunas cosas que no son necesarias a la materia y mejora algunos mensajes de error que les pueden aparecer en Haskell. El `import PdePreludat` lo necesitamos para poder usar un montón de funciones que vamos a usar en la materia (como la función suma `(+)` que aparece en este ejercicio).


Para leer más sobre esto: https://github.com/10Pines/pdepreludat

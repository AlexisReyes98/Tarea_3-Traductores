# Tarea_3-Traductores

UEA: Traductores.

Con la ayuda de FLEX, el generador automático de analizadores léxicos, y BISON, el generador automático de analizadores sintácticos, se implemento
una pequeña calculadora que permita realizar las operaciones aritméticas básicas, las trigonométricas como el seno, coseno y tangente.

Proceso de Compilación Y Ejecución.

Esta tarea se realizó en Linux Ubuntu y puede que se necesite de una diferente compilación
para que funcione en otro sistema operativo.

Se realizo lo siguiente:

a) Analizador léxico usando flex: Calc.l

b) Analizador sintactico usado bison: Calc.y

c) Se compilo bison con la opción –verbose (bison -d script.y -v) y se obtuvieron 47 estados

d) Se Insertaron las acciones semánticas necesarias para calcular el valor numérico de una expresión

e) Se Modifico la gramática para que se pueda reconocer una lista de asignaciones separadas por el punto y coma (;)

f) Se modifico la gramatica para incluir el operador potencia, las funciones de raíz cuadrada,

el logaritmo natural y por último la función que calcula el reciproco de un número (unosobrex)

g) El programa se ejecuta de tal manera que se incluye un archivo de entrada (entrada.txt)
donde se pueden usar todas las funciones implementadas y se genera un archivo de salida
con los cálculos realizados.

h) Se incluyen los scripts de entrada de Lex y Bison, el código fuente y el
compilado de los analizadores generados así como un pequeño instructivo de uso
También se Incluy en el instructivo la especficación de como se generan los analizadores léxico y sintáctico

Compilación y Ejecución:

-Debe situarse en el directorio donde esta el archivo Calc.l y Calc.y

Y escribir en consola:

// Para generar el analizador sintactico se genera un fichero de C basado en el archivo de bison

// Ficheros generados: Calc.tab.c y Calc.tab.h

$ bison -d Calc.y

//  Para generar el analizador léxico se genera un fichero de C basado en el archivo de flex

// El fichero que se genera es: lex.yy.c

$ flex Calc.l

// Por último se compila usando el estandar de C

// El cúal genera el ejecutable llamado: analizador

$ gcc lex.yy.c Calc.tab.c -o analizador -lfl -lm

// Para ejecutar el programa y que tome como entrada el archivo (entrada.txt) y

// guarde la salida en el archivo (salida.txt) se ejecuta lo siguiente:

$ ./analizador < entrada.txt > salida.txt

Como ya se está entregando todo funcionando y si no se le hace ningun cambio, entonces, lo unico que tiene que hacer es ejcutarlo con la ultima instrucción:

$ ./analizador < entrada.txt > salida.txt

Cambiando las entradas en el archivo (entrada.txt) para poder modificar a placer las operaciones.

Y eso es todo, al final tendra el reporte en el archivo "salida.txt".

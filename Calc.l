/*  Calculadora que permite realizar las operaciones aritméticas básicas */
/* y las trigonométricas como el seno, coseno y tangente. */
/* Poseriormnete se modifico la gramatica para incluir el operador potencia, */
/* las funciones de raíz cuadrada, el logaritmo natural y por último */
/* la función que calcula el reciproco de un número (unosobrex).

/* Sección de Declaraciones */
/* En este bloque se le indica al pre-procesador que lo que se esta definiendo aparecera ‘tal cual’ en el fichero C generado */
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "Calc.tab.h"  /* Archivo de cabecera creado por Yacc/Bison */

    unsigned int num_linea = 0;        /* Numero total de lineas */
%}

DIGITO      [0-9]
separador   ([ \t])+
ID          [a-zA-Z][a-zA-Z0-9_]*

/* Sección de Reglas */
%%
{DIGITO}+("."{DIGITO}+)?    { yylval.real = atof(yytext); return TKN_NUM; }     /* Numero a trabajar*/
{separador}                 { }     /* Se ignora el espacio en blanco */
";"                         { return TKN_PTOCOMA; }
"+"                         { return TKN_MAS; }
"-"                         { return TKN_MENOS; }
"*"                         { return TKN_MULT; }
"/"                         { return TKN_DIV; }
"cos"                       { return TKN_COS; }
"sen"                       { return TKN_SEN; }
"tan"                       { return TKN_TAN; }
"^"                         { return TKN_POW; }
"sqrt"                      { return TKN_SQRT; }
"ln"                        { return TKN_LN; }
"unosobrex"                 { return TKN_UNOSOBREX; }
"("                         { return TKN_PAA; }
")"                         { return TKN_PAC; }
"="                         { return TKN_ASIGN; }
{ID}                        { return TKN_ID; }      /* Variable o identifcador */
\n                          { num_linea++; }
%%
/* De ser necesario en seguida iría un método solo para el archivo Lex/Flex */

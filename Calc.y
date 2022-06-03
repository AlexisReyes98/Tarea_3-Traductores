%{
    /* Sección de Declaraciones */
    
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>

    extern int yylex(void);
    extern char *yytext;
    extern unsigned int num_linea;
    void yyerror(char *msj);
%}

%union
{
    float real;
}

%start Program

%token <real> TKN_NUM
%token TKN_ASIGN
%token TKN_PTOCOMA
%token <real> TKN_ID
%token TKN_MULT
%token TKN_DIV
%token TKN_MAS
%token TKN_MENOS
%token TKN_PAA
%token TKN_PAC
%token TKN_SEN
%token TKN_COS
%token TKN_TAN
%token TKN_POW
%token TKN_SQRT
%token TKN_LN
%token TKN_UNOSOBREX

%type <real> Expresion

%left TKN_MAS TKN_MENOS
%left TKN_MULT TKN_DIV
%left TKN_POW
%left TKN_SQRT
%left TKN_LN
%left TKN_UNOSOBREX

/* Sección de Reglas */
%%
Program :   Program Calculadora | Calculadora;

Calculadora :   TKN_ID { printf("El valor del identificador %s es: ", yytext); }   
                TKN_ASIGN Expresion TKN_PTOCOMA { printf("%f;", $4); };

Expresion : TKN_NUM { $$=$1; } |
            Expresion TKN_MAS Expresion { $$=$1+$3; } |
            Expresion TKN_MENOS Expresion { $$=$1-$3; } |
            Expresion TKN_MULT Expresion { $$=$1*$3; } |
            Expresion TKN_DIV Expresion { $$=$1/$3; } |
            TKN_PAA Expresion TKN_PAC { $$=$2; } |
            TKN_SEN TKN_PAA Expresion TKN_PAC { $$=sin($3); } |
            TKN_COS TKN_PAA Expresion TKN_PAC { $$=cos($3); } |
            TKN_TAN TKN_PAA Expresion TKN_PAC { $$=tan($3); } |
            Expresion TKN_POW Expresion { $$=pow($1,$3); } |
            TKN_SQRT TKN_PAA Expresion TKN_PAC { $$ = sqrt($3); } |
            TKN_LN TKN_PAA Expresion TKN_PAC { $$= log($3); } |
            TKN_UNOSOBREX TKN_PAA Expresion TKN_PAC { $$=1/$3; };
%%

/* Método Principal y funciones del usuario */
void yyerror(char *msj)
{
    printf("Error en linea %d: %s'\n", num_linea, msj);
}

int main()
{
    yyparse();  /* Invoca al Analizador Sintactico */
    return 0;
}

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "tokens.h"    
    #include "compilador.tab.h"
    
%}
%option noyywrap 

LETRA [a-zA-Z]
VARIAVEL {LETRA}+
DIGITO [0-9]
NUMERO {DIGITO}+
PONTO_FLUTUANTE [\.]{NUMERO}

FLOAT_VALOR {NUMERO}{PONTO_FLUTUANTE}
INT_VALOR {NUMERO}
BOOL_VALOR [0][1]
CHAR_VALOR {ASPA}{LETRA}{ASPA}
STRING_VALOR {ASPA}{LETRA}+{ASPA}


ABRE_CHAVES [{]
FECHA_CHAVES [}]
ABRE_PARENTESES [(]
FECHA_PARENTESES [)]
ABRE_COLCHETES [[]
FECHA_COLCHETES []]

ESPACO [ ]+
ASPA ["]

%%

int {return(INT_TIPO);}
float {return(FLOAT_TIPO);}
char {return(CHAR_TIPO);}
bool {return(BOOL_TIPO);}

if {return(IF);}
else {return(ELSE);}
while {return(WHILE);}
for {return(FOR);}
printf {return(PRINTF);}

main {return(MAIN);}
return {return(RETURN);}
stdio.h {return(BIBLIOTECA);}
#include {return(INCLUDE);}

"{" {return(ABRE_CHAVES);}
"}" {return(FECHA_CHAVES);}
"(" {return(ABRE_PARENTESES);}
")" {return(FECHA_PARENTESES);}
"[" {return(ABRE_COLCHETES);}
"]" {return(FECHA_COLCHETES);}
"." {return(PONTO);}
"," {return(VIRGULA);}
";" {return(PONTO_VIRGULA);}
ASPA {return(ASPA);}


"*" {return(MULTIPLICACAO);}
"+" {return(SOMA);}
"-" {return(SUBTRACAO);}
"/" {return(DIVISAO);}
"%" {return(PORCENTAGEM);}
"=" {return(IGUAL);}
"==" {return(IGUAL_IGUAL);}
"!=" {return(DIFERENTE);}
"!" {return(NEGACAO);}
">" {return(MAIOR);}
"<" {return(MENOR);}
">=" {return(MAIOR_IGUAL);}
"<=" {return(MENOR_IGUAL);}
"&&" {return(AND);}
"||" {return(OR);}


{DIGITO} {return(DIGITO);}
{NUMERO} {return(NUMERO);}
{VARIAVEL} {return(VARIAVEL);}
{ESPACO} {return(ESPACO);}

{INT_VALOR} {return(INT_VALOR);}
{FLOAT_VALOR} {return(FLOAT_VALOR);}
{CHAR_VALOR} {return(CHAR_VALOR);}
{STRING_VALOR} {return(STRING_VALOR);}
{BOOL_VALOR} {return(BOOL_VALOR);}


[[:^space]]+;

%%


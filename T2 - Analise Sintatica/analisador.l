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
CHAR {ASPA}{LETRA}{ASPA}
STRING {ASPA}{LETRA}+{ASPA}
NUMERO {DIGITO}*
FLOAT {NUMERO}[.]{NUMERO}


ABRE_CHAVES [{]
FECHA_CHAVES [}]
ABRE_PARENTESES [(]
FECHA_PARENTESES [)]
ABRE_COLCHETES [[]
FECHA_COLCHETES []]

ESPACO_UNICO [ ]
ESPACO_MULTIPLO [ ]{2,}
QUEBRA_LINHA [\n]

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
"=" {return(ATRIBUICAO);}
"==" {return(IGUAL);}
"!=" {return(DIFERENTE);}
"!" {return(NEGACAO);}
">" {return(MAIOR);}
"<" {return(MENOR);}
">=" {return(MAIOR_IGUAL);}
"<=" {return(MENOR_IGUAL);}
"&&" {return(AND);}
"||" {return(OR);}


{FLOAT}   {return (FLOAT);}
{DIGITO} {return(DIGITO);}
{NUMERO} {return(INT);}
{VARIAVEL} {return(VARIAVEL);}
{ESPACO_UNICO} {return(ESPACO_UNICO);}
{ESPACO_MULTIPLO} {return(ESPACO_MULTIPLO);}
{QUEBRA_LINHA} {return(QUEBRA_LINHA);}


[[:^space]]+;

%%


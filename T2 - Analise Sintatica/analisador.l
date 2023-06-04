%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "tokens.h"    
    #include "compilador.tab.h"
    
%}


LETRA [a-zA-Z]
VARIAVEL [a-zA-Z][a-zA-Z0-9]*
DIGITO [0-9]
NUMERO {DIGITO}*
PALAVRA {LETRA}*
ABRE_CHAVES ['{']
FECHA_CHAVES ['}']
ABRE_PARENTESES ['(']
FECHA_PARENTESES [')']
ABRE_COLCHETES['[']
FECHA_COLCHETES[']']


ESPACO [ ]
ASPA ["]
STRING [ASPA][PALAVRA][ASPA]
%%

int {printf("TIPO INT ");return(INT);}
double {return(DOUBLE);}
float {return(FLOAT);}
char {return(CHAR);}
bool {return(BOOL);}

if {printf("IF");return(IF);}
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
"=" {printf("ATRIBUICAO ");return(ATRIBUICAO);}
"==" {return(IGUAL);}
"!=" {return(DIFERENTE);}
"!" {return(NEGACAO);}
">" {return(MAIOR);}
"<" {return(MENOR);}
">=" {return(MAIOR_IGUAL);}
"<=" {return(MENOR_IGUAL);}
"&&" {return(AND);}
"||" {return(OR);}


{LETRA} {printf("LETRA ");return(LETRA);}
{PALAVRA} {printf("PALAVRA");return(PALAVRA);}
{DIGITO} {printf("DIGITO");return(DIGITO);}
{NUMERO} {printf("NUMERO");return(NUMERO);}
{VARIAVEL} {printf("VARIAVEL ");return(VARIAVEL);}
{ESPACO} {return(ESPACO);}


%%


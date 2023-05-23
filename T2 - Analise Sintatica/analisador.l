%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "tokens.h"
    #include "compilador.tab.h"

    #define YY_USER_ACTION yylloc.first_line = yylineno;
    #define YY_USER_INIT yylineno = 1;
    
%}

%option yylineno
%option noyywrap


LETRA [a-zA-Z]
VARIAVEL [a-zA-Z][a-zA-Z0-9]*
DIGITO [0-9]
NUMERO {DIGITO}+
PALAVRA {LETRA}+
ABRE_CHAVES [{]
FECHA_CHAVES [}]
ABRE_PARENTESES [(]
FECHA_PARENTESES [)]
ABRE_COLCHETE[[]
FECHA_COLCHETE[]]
ABRE_COMENTARIO [/*]
FECHA_COMENTARIO [*/]
ESPACO [ ]
ASPA ["]

%%

int {return(INT);}
double {return(DOUBLE);}
float {return(FLOAT);}
char {return(CHAR);}
bool {return(BOOL);}


if {return(IF);}
else {return(ELSE);}
while {return(WHILE);}
for {return(FOR);}
printf {return(PRINTF);}


main {return(MAIN);}
return {return(RETURN);}
stdio.h {return(BIBLIOTECA);}
#include {return(INCLUDE);}


"{" {return(ABRE_CHAVE);}
"}" {return(FECHA_CHAVE);}
"(" {return(ABRE_PARENTESE);}
")" {return(FECHA_PARENTESE);}
"[" {return(ABRE_COLCHETE);}
"]" {return(FECHA_COLCHETE);}
"." {return(PONTO);}
"," {return(VIRGULA);}
";" {return(PONTO_VIRGULA);}
"\"" {return(ASPA);}


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


{LETRA} {return(yytext);}
{PALAVRA} {return(yytext);}
{DIGITO} {return(yytext);}
{NUMERO} {return(yytext);}
{VARIAVEL} {return(yytext);}
{ASPA}{PALAVRA}+{ASPA} {return(yytext);}
{ESPACO} {return(yytext);}


%%


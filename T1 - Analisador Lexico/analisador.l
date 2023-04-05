%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "tokens.h"
%}


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


int {printf("[%s] -> INT \n", yytext);}
double {printf("[%s] -> DOUBLE \n", yytext);}
float {printf("[%s] -> FLOAT \n", yytext);}
char {printf("[%s] -> CHAR \n", yytext);}
bool {printf("[%s] -> BOOL \n", yytext);}


if {printf("[%s] -> IF \n", yytext);}
else {printf("[%s] -> ELSE \n", yytext);}
while {printf("[%s] -> WHILE \n", yytext);}
for {printf("[%s] -> FOR \n", yytext);}
printf {printf("[%s] -> PRINTF \n", yytext);}


main {printf("[%s] -> MAIN \n", yytext);}
return {printf("[%s] -> RETURN \n", yytext);}
stdio.h {printf("[%s] -> BIBLIOTECA \n", yytext);}
#include {printf("[%s] -> INCLUDE \n", yytext);}


"{" {printf("[%s] -> ABRE_CHAVE \n", yytext);}
"}" {printf("[%s] -> FECHA_CHAVE \n", yytext);}
"(" {printf("[%s] -> ABRE_PARENTESE \n", yytext);}
")" {printf("[%s] -> FECHA_PARENTESE \n", yytext);}
"[" {printf("[%s] -> ABRE_COLCHETE \n", yytext);}
"]" {printf("[%s] -> FECHA_COLCHETE \n", yytext);}
"." {printf("[%s] -> PONTO \n", yytext);}
"," {printf("[%s] -> VIRGULA \n", yytext);}
";" {printf("[%s] -> PONTO_VIRGULA \n", yytext);}
"\"" {printf("[%s] -> ASPA \n", yytext);}


"*" {printf("[%s] -> MULTIPLICACAO \n", yytext);}
"+" {printf("[%s] -> SOMA \n", yytext);}
"-" {printf("[%s] -> SUBTRACAO \n", yytext);}
"/" {printf("[%s] -> DIVISAO \n", yytext);}
"%" {printf("[%s] -> PORCENTAGEM \n", yytext);}
"=" {printf("[%s] -> ATRIBUICAO \n", yytext);}
"==" {printf("[%s] -> IGUAL \n", yytext);}
"!=" {printf("[%s] -> DIFERENTE \n", yytext);}
"!" {printf("[%s] -> NEGACAO \n", yytext);}
">" {printf("[%s] -> MAIOR \n", yytext);}
"<" {printf("[%s] -> MENOR \n", yytext);}
">=" {printf("[%s] -> MAIOR_IGUAL \n", yytext);}
"<=" {printf("[%s] -> MENOR_IGUAL \n", yytext);}
"&&" {printf("[%s] -> AND \n", yytext);}
"||" {printf("[%s] -> OR \n", yytext);}


{LETRA} {printf("[%s] -> LETRA \n", yytext);}
{PALAVRA} {printf("[%s] -> PALAVRA \n", yytext);}
{DIGITO} {printf("[%s] -> DIGITO \n", yytext);}
{NUMERO} {printf("[%s] -> NUMERO \n", yytext);}
{VARIAVEL} {printf("[%s] -> VARIAVEL \n", yytext);}
{ASPA}{PALAVRA}+{ASPA} {printf("[%s] -> TEXTO \n", yytext);}
{ESPACO} {printf("[%s] -> ESPACO \n", yytext);}


%%


int main(){
    yylex();
    return 0;
}
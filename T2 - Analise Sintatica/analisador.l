%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "tokens.h"    
    #include "compilador.tab.h"
    
%}
%option noyywrap yylineno

LETRA [a-zA-Z]
VARIAVEL {LETRA}+
DIGITO [0-9]
PONTO_FLUTUANTE [\.]{DIGITO}+

FLOAT_VALOR {DIGITO}+{PONTO_FLUTUANTE}
INT_VALOR {DIGITO}+
BOOL_VALOR [0|1]
CHAR_VALOR {ASPA}{LETRA}{ASPA}
STRING_VALOR {ASPA}{LETRA}+{ASPA}
ASPA ["]
ESPACO [ ]
ESPACOS {ESPACO}[\t][\n]


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
{VARIAVEL} {return(VARIAVEL);}
{ESPACOS} {}

{INT_VALOR} {return(INT_VALOR);}
{FLOAT_VALOR} {return(FLOAT_VALOR);}
{CHAR_VALOR} {return(CHAR_VALOR);}
{STRING_VALOR} {return(STRING_VALOR);}
{BOOL_VALOR} {return(BOOL_VALOR);}


[[:^space]]+;

%%
/*
void main(){
  printf("Digite o lexema: ");
  yylex();
}*/
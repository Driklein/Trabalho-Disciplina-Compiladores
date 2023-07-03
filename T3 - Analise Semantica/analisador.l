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
PONTO [\.]
PONTO_FLUTUANTE {PONTO}{DIGITO}+

INT_VALOR {DIGITO}+
FLOAT_VALOR {INT_VALOR}{PONTO_FLUTUANTE}?
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

{INT_VALOR} {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(INT_VALOR);
}
{FLOAT_VALOR} {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(FLOAT_VALOR);}
{CHAR_VALOR} {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(CHAR_VALOR);}
{STRING_VALOR} {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(STRING_VALOR);}
{BOOL_VALOR} {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(BOOL_VALOR);}


[[:^space]]+;

%%
/*
void main(){
  printf("Digite o lexema: ");
  yylex();
}*/
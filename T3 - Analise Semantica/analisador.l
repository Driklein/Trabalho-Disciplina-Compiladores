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

int {
    yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(INT_TIPO);}
float {
    yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(FLOAT_TIPO);}
char {
    yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(CHAR_TIPO);}
bool {
    yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(BOOL_TIPO);}

if {
    yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(IF);}
else {
    yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(ELSE);}
while {
    yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(WHILE);}
for {
    yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(FOR);}
printf {
    yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(PRINTF);}

main {return(MAIN);}
return {
    yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(RETURN);}
stdio.h {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(BIBLIOTECA);}
#include {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(INCLUDE);}

"{" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(ABRE_CHAVES);}
"}" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(FECHA_CHAVES);}
"(" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(ABRE_PARENTESES);}
")" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(FECHA_PARENTESES);}
"[" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(ABRE_COLCHETES);}
"]" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(FECHA_COLCHETES);}
"." {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(PONTO);}
"," {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(VIRGULA);}
";" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(PONTO_VIRGULA);}
ASPA {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(ASPA);}


"*" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(MULTIPLICACAO);}
"+" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(SOMA);}
"-" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(SUBTRACAO);}
"/" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(DIVISAO);}
"%" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(PORCENTAGEM);}
"=" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(IGUAL);}
"==" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(IGUAL_IGUAL);}
"!=" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(DIFERENTE);}
"!" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(NEGACAO);}
">" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(MAIOR);}
"<" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(MENOR);}
">=" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(MAIOR_IGUAL);}
"<=" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(MENOR_IGUAL);}
"&&" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(AND);}
"||" {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(OR);}


{DIGITO} {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(DIGITO);}
{VARIAVEL} {
  yylval.cadeia = (char*)malloc((strlen(yytext)+1)*sizeof(char));
  strcpy(yylval.cadeia, yytext);
  return(VARIAVEL);}
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
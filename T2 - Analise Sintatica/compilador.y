
%{
  /* Aqui, pode-se inserir qualquer codigo C necessario ah compilacao
   * final do parser. Sera copiado tal como esta no inicio do y.tab.c
   * gerado por Yacc.
   */

	#include <stdio.h>
	#include <stdlib.h>
	#include "node.h"
	#include "compilador.tab.h"
	extern int yyerror(const char* msg ); 
	extern int yylex();

	extern Node * syntax_tree;
%}

%union {
	char* cadeia;
	struct _node * node;
}

/*
%token INT_TOKEN 260
%token FLOAT_TOKEN 262
%token CHAR_TOKEN 263
%token BOOL_TOKEN 264
%token IF_TOKEN 265
%token ELSE_TOKEN 266
%token WHILE_TOKEN 267
%token FOR_TOKEN 268
%token PRINTF_TOKEN 269

%token MAIN_TOKEN 270
%token RETURN_TOKEN 271
%token BIBLIOTECA_TOKEN 272
%token INCLUDE_TOKEN 273
*/
%token VARIAVEL_TOKEN 274

%token ESPACO_UNICO_TOKEN 306
%token ESPACO_MULTIPLO_TOKEN 307
%token QUEBRA_LINHA_TOKEN 308
%token PONTO_VIRGULA_TOKEN 283

%token INT_TIPO_TOKEN 309
%token FLOAT_TIPO_TOKEN 310
%token CHAR_TIPO_TOKEN 311
%token BOOL_TIPO_TOKEN 312

%token ATRIBUICAO_TOKEN 290


%type<node> code 
%type<node> acao
//%type<node> valor
%type<node> tipo
%type<node> declaracao
//%type<node> atribuicao
%type<node> quebra_linha
%type<node> espaco_obrigatorio
%type<node> espaco_opcional
%type<node> variavel

/*
%type<node> expressao
%type<node> condicao
%type<node> laco
%type<node> impressao
*/


%start code

/* A completar com seus tokens - compilar com 'yacc -d' */

%%


/* @1.first_line, "tipo do node", "lexema", "filhos", "NULL" (Não tem mais filhos)*/

code: acao{printf("RECONHECI SUA LINGUAGEM");};

acao: declaracao acao{printf("DECLARACAO  ACAO\n");}
	| declaracao{printf("DECLARACAO FINAL\n");}
	| linha_vazia acao {}
	| linha_vazia {}
	;

//valor: INT_TOKEN{printf("RECONHECI VALOR INTEIRO\n");}
//	| FLOAT_TOKEN{};

declaracao: tipo espaco_obrigatorio variavel espaco_opcional ponto_virgula quebra_linha {printf("DECLARACAO\n\n"); }
	| tipo espaco_obrigatorio variavel espaco_opcional ponto_virgula {printf("DECLARACAO\n\n"); }
	;

ponto_virgula:PONTO_VIRGULA_TOKEN{printf("RECONHECI PONTO E VIRGULA\n");};

quebra_linha: espaco_opcional QUEBRA_LINHA_TOKEN{printf("QUEBROU LINHA\n");};

tipo: INT_TIPO_TOKEN {printf("RECONHECI INT\n");}
	| FLOAT_TIPO_TOKEN {}
	| CHAR_TIPO_TOKEN{}
	| BOOL_TIPO_TOKEN {};

variavel: VARIAVEL_TOKEN{printf("RECONHECI VARIAVEL\n");};

//atribuicao:ATRIBUICAO_TOKEN{printf("RECONHECI ATRIBUICAO\n");};

espaco_obrigatorio: ESPACO_MULTIPLO_TOKEN {}
				| ESPACO_UNICO_TOKEN {}
				;

espaco_opcional: ESPACO_MULTIPLO_TOKEN {}
				| ESPACO_UNICO_TOKEN {}
				| sem_espaco {}
				;

sem_espaco: {};

linha_vazia: espaco_opcional quebra_linha {}
%%

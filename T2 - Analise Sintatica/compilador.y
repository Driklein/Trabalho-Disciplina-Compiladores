
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

%token ESPACO_TOKEN 306
%token PONTO_VIRGULA_TOKEN 283

%token INT_TIPO_TOKEN 309
%token FLOAT_TIPO_TOKEN 310
%token CHAR_TIPO_TOKEN 311
%token BOOL_TIPO_TOKEN 312

%token INT_VALOR_TOKEN  314
%token FLOAT_VALOR_TOKEN  315
%token CHAR_VALOR_TOKEN  316
%token BOOL_VALOR_TOKEN  317
%token STRING_VALOR_TOKEN 318

%token MULTIPLICACAO_TOKEN 285
%token SOMA_TOKEN 286
%token SUBTRACAO_TOKEN 287
%token DIVISAO_TOKEN 288

%token IGUAL_TOKEN 290


%type<node> code 
%type<node> acao
%type<node> valor
%type<node> tipo
%type<node> declaracao
%type<node> atribuicao
%type<node> espaco_obrigatorio
%type<node> espaco_opcional
%type<node> variavel
%type<node> menos
%type<node> mais
%type<node> vezes
%type<node> dividido
%type<node> numero
%type<node> expressao

/*
%type<node> condicao
%type<node> laco
%type<node> impressao
*/


%start code

/* A completar com seus tokens - compilar com 'yacc -d' */

%%


/* @1.first_line, "tipo do node", "lexema", "filhos", "NULL" (Não tem mais filhos)*/

code: acao{};

acao: 
	declaracao{printf("DECLARACAO FINAL\n");}
	| declaracao acao{printf("DECLARACAO  ACAO\n");}
	| atribuicao{printf("ATRIBUICAO FINAL\n");}
	| atribuicao acao{printf("ATRIBUICAO ACAO\n");}
	| espaco_opcional{};

valor: 
	INT_VALOR_TOKEN{printf("RECONHECENDO VALOR INTEIRO\n");}
	| FLOAT_VALOR_TOKEN{printf("RECONHECENDO VALOR FLOAT\n");};
	| CHAR_VALOR_TOKEN{printf("RECONHECENDO VALOR CHAR\n");};
	| STRING_VALOR_TOKEN{printf("RECONHECENDO VALOR STRING\n");};
	| BOOL_VALOR_TOKEN{printf("RECONHECENDO VALOR BOOL\n");};

numero:
	INT_VALOR_TOKEN{printf("RECONHECENDO NUMERO INTEIRO\n");}
	| FLOAT_VALOR_TOKEN{printf("RECONHECENDO NUMERO FLOAT\n");};

declaracao: 
	tipo espaco_obrigatorio variavel espaco_opcional ponto_virgula {printf("RECONHECENDO DECLARACAO\n"); };
	| tipo espaco_obrigatorio atribuicao {printf("RECONHECENDO DECLARACAO INICIALIZANDO\n"); };

atribuicao:
	variavel espaco_opcional igual espaco_opcional valor espaco_opcional ponto_virgula{printf("RECONHECENDO ATRIBUICAO VALOR\n");}
	|variavel espaco_opcional igual espaco_opcional expressao espaco_opcional ponto_virgula{printf("RECONHECENDO ATRIBUICAO EXPRESSAO\n");};
	
expressao:
	expressao mais expressao{printf("RECONHECENDO EXPRESSAO SOMA");}
	| expressao espaco_opcional menos espaco_opcional expressao espaco_opcional ponto_virgula{printf("RECONHECENDO EXPRESSAO SUBTRACAO");}
	| expressao espaco_opcional vezes espaco_opcional expressao espaco_opcional ponto_virgula{printf("RECONHECENDO EXPRESSAO MULTIPLICACAO");}
	| expressao espaco_opcional dividido espaco_opcional expressao espaco_opcional ponto_virgula{printf("RECONHECENDO EXPRESSAO DIVISAO");}
	| numero espaco_opcional mais espaco_opcional numero espaco_opcional ponto_virgula{printf("RECONHECENDO EXPRESSAO SOMA");}
	| numero espaco_opcional menos espaco_opcional numero espaco_opcional ponto_virgula{printf("RECONHECENDO EXPRESSAO SUBTRACAO");}
	| numero espaco_opcional vezes espaco_opcional numero espaco_opcional ponto_virgula{printf("RECONHECENDO EXPRESSAO MULTIPLICACAO");}
	| numero espaco_opcional dividido espaco_opcional numero espaco_opcional ponto_virgula{printf("RECONHECENDO EXPRESSAO DIVISAO");};

mais:
	SOMA_TOKEN{printf("RECONHECENDO SOMA\n");};
menos:
	SUBTRACAO_TOKEN{printf("RECONHECENDO SOMA\n");};
vezes:
	MULTIPLICACAO_TOKEN{printf("RECONHECENDO SOMA\n");};
dividido:
	DIVISAO_TOKEN{printf("RECONHECENDO SOMA\n");};
	

ponto_virgula:
	PONTO_VIRGULA_TOKEN{printf("RECONHECENDO PONTO E VIRGULA\n");};

tipo: 
	INT_TIPO_TOKEN {printf("RECONHECENDO TIPO INT\n");}
	| FLOAT_TIPO_TOKEN {printf("RECONHECENDO TIPO FLOAT\n");}
	| CHAR_TIPO_TOKEN{printf("RECONHECENDO TIPO CHAR\n");}
	| BOOL_TIPO_TOKEN {printf("RECONHECENDO TIPO BOOL\n");};

variavel: 
	VARIAVEL_TOKEN{printf("RECONHECENDO VARIAVEL\n");};

igual:
	IGUAL_TOKEN{printf("RECONHECENDO IGUAL\n");};

espaco_obrigatorio:
	ESPACO_TOKEN {printf("RECONHECENDO ESPACO OBRIGATORIO\n");};

espaco_opcional:
	ESPACO_TOKEN {printf("RECONHECENDO ESPACO OPCIONAL\n");} | {};



%%

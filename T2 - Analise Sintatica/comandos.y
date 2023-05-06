%error-verbose

%{
  /* Aqui, pode-se inserir qualquer codigo C necessario ah compilacao
   * final do parser. Sera copiado tal como esta no inicio do y.tab.c
   * gerado por Yacc.
   */

	#include <stdio.h>
	#include <stdlib.h>
	#include "node.h"

	extern int yyerror(const char* msg ); 
	extern int yylex();

	extern Node * syntax_tree;
%}

%union {
	char* cadeia;
	struct _node * node;
}

%token INT
%token DOUBLE
%token FLOAT
%token CHAR
%token BOOL

%token IF
%token ELSE
%token WHILE
%token FOR
%token PRINTF

%token MAIN
%token RETURN
%token BIBLIOTECA
%token INCLUDE

%type<node> code
%type<node> code_node
%type<node> acao
%type<node> acoes
%type<node> declaracoes
%type<node> declaracao
%type<node> atribuicao
%type<node> condicao
%type<node> laco
%type<node> comparacao

%type<node> tipo

%start code

 /* A completar com seus tokens - compilar com 'yacc -d' */

%%

code: declaracoes acoes {
	  
	$$ = create_node(@1.first_line, code_node, NULL, $1, $2, NULL); 
	syntax_tree = $$;

} | acoes {
	$$ = $1; 
	syntax_tree = $$;  
};


tipo: INT | CHAR | FLOAT;
condicao: IF;
laco: WHILE | FOR;



%%

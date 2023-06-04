
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

%token INT_TOKEN 260
/*
%token DOUBLE_TOKEN 261
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
%token VARIAVEL_TOKEN 274
*/

%type<node> code 
%type<node> acao
/*
%type<node> atribuicao
%type<node> expressao
%type<node> tipo

%type<node> condicao
%type<node> laco
%type<node> impressao
*/


%start code

/* A completar com seus tokens - compilar com 'yacc -d' */

%%


/* @1.first_line, "tipo do node", "lexema", "filhos", "NULL" (Não tem mais filhos)*/

code: acao ' ' ';'{ printf("RECONHECI TUA LINGUAGEM");
	///Node* pontoevirgula = create_node(@1.first_line,pontoevirgula_node,';',NULL);
	//$$ = create_node(@1.first_line, code_node, NULL, $1, pontoevirgula, NULL); 
	//syntax_tree = $$;
};

acao: INT_TOKEN{};

//acao: atribuicao{ $$ = create_node(@1.first_line, atribuicao_node, NULL, $1, NULL); }
	//| atribuicao code{$$ = create_node(@1.first_line, atribuicao_node, NULL, $1, $2, NULL); };

/*
	| condicao code{$$ = create_node(@1.first_line, condicao_node, NULL, $1, $2, NULL); }
	| laco code{$$ = create_node(@1.first_line, laco_node, NULL, $1, $2, NULL); }
	| impressao code{$$ = create_node(@1.first_line, impressao_node, NULL, $1, $2, NULL); };



atribuicao: 
	VARIAVEL_TOKEN '=' expressao {
	Node* variavel = create_node(@1.first_line,variavel_node, yylval.cadeia, NULL);
	Node* igual = create_node(@1.first_line,igual_node,"=",NULL);
	$$ = create_node(@1.first_line, atribuicao_node, NULL, variavel, igual, $3, NULL);  };


tipo: 
	  INT_TOKEN {$$ = create_node(@1.first_line, int_node, NULL, NULL );}
	| DOUBLE_TOKEN {$$ = create_node(@1.first_line, double_node, NULL, NULL );}
	| FLOAT_TOKEN {$$ = create_node(@1.first_line, float_node, NULL, NULL );}
	| CHAR_TOKEN{$$ = create_node(@1.first_line, char_node, NULL, NULL );}
	| BOOL_TOKEN {$$ = create_node(@1.first_line, int_node, NULL, NULL );};


expressao: 
		expressao '+' expressao {			
		Node* soma = create_node(@1.first_line, soma_node,"+",NULL);
		$$ = create_node(@1.first_line, expressao_node, NULL, $1, soma, $3, NULL);}

		|  expressao '-' expressao {
		Node* subtracao = create_node(@1.first_line, subtracao_node,"-", NULL);
		$$ = create_node(@1.first_line, expressao_node, NULL, $1, subtracao, $3, NULL);}

		|  expressao '/' expressao {
		Node* divisao = create_node(@1.first_line, divisao_node,"/", NULL);
		$$ = create_node(@1.first_line, expressao_node, NULL, $1, divisao, $3, NULL);}

		|  expressao '*' expressao {
		Node* multiplicacao = create_node(@1.first_line, multiplicacao_node,"+", NULL);
		$$ = create_node(@1.first_line, expressao_node, NULL, $1, multiplicacao, $3, NULL);}

		|  expressao '+' tipo {
		Node* soma = create_node(@1.first_line, soma_node,"+",NULL);
		$$ = create_node(@1.first_line, expressao_node, NULL, $1, soma, $3, NULL);}

		|  expressao '-' tipo {
		Node* subtracao = create_node(@1.first_line, subtracao_node,"-", NULL);
		$$ = create_node(@1.first_line, expressao_node, NULL, $1, subtracao, $3, NULL);}

		|  expressao '/' tipo {
		Node* divisao = create_node(@1.first_line, divisao_node,"/", NULL);
		$$ = create_node(@1.first_line, expressao_node, NULL, $1, divisao, $3, NULL);}

		|  expressao '*' tipo {
		Node* multiplicacao = create_node(@1.first_line, multiplicacao_node,"+", NULL);
		$$ = create_node(@1.first_line, expressao_node, NULL, $1, multiplicacao, $3, NULL);}



*/


%%

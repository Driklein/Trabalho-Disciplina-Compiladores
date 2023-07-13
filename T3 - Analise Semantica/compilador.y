
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

%token WHILE_TOKEN 267
%token FOR_TOKEN 268
%token PRINTF_TOKEN 269

%token MAIN_TOKEN 270
%token RETURN_TOKEN 271
%token BIBLIOTECA_TOKEN 272
%token INCLUDE_TOKEN 273
*/
%token VARIAVEL_TOKEN 274

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

%token IF_TOKEN 522
%token ELSE_TOKEN 524
%token ABRE_PARENTESES_TOKEN 525
%token FECHA_PARENTESES_TOKEN 526
%token ABRE_CHAVES_TOKEN 527
%token FECHA_CHAVES_TOKEN 528
%token MAIOR_TOKEN 529
%token MENOR_TOKEN 530
%token IGUAL_IGUAL_TOKEN 531
%token DIFERENTE_TOKEN 532

%type<node> code 
%type<node> acao
%type<node> valor
%type<node> tipo
%type<node> declaracao
%type<node> atribuicao

%type<node> variavel
%type<node> menos
%type<node> mais
%type<node> vezes
%type<node> dividido
%type<node> expressao
%type<node> igual
%type<node> ponto_virgula
%type<node> condicao
%type<node> abre_parenteses
%type<node> fecha_parenteses
%type<node> abre_chaves
%type<node> fecha_chaves
%type<node> if
%type<node> else
%type<node> comparacao_if
%type<node> menor
%type<node> maior
%type<node> igual_igual
%type<node> diferente


/*
%type<node> laco
%type<node> impressao
*/


%start code

/* A completar com seus tokens - compilar com 'yacc -d' */

%%


/* 
nó terminal
	$$ = create_node(@1.first_line, "tipodonode","lexema", NULL);
nó não terminal
	$$ = create_node(@1.first_line, "tipodonode", NULL, $1, ... , NULL);

*/

code: acao
{
	$$ = create_node(@1.first_line, code_node, NULL , $1, NULL);
	syntax_tree = $$; 
};

acao:
	declaracao
	{
		printf("DECLARACAO FINAL\n");
		$$ = create_node(@1.first_line, acao_node, "declaracao", $1, NULL);
	}
	| declaracao acao{
		printf("DECLARACAO  ACAO\n");
		$$ = create_node(@1.first_line, acao_node, "declaracao", $1, $2, NULL);
	}
	| atribuicao{
		printf("ATRIBUICAO FINAL\n");
		$$ = create_node(@1.first_line, acao_node, "atribuicao", $1, NULL);	
	}
	| atribuicao acao{
		printf("ATRIBUICAO ACAO\n");
		$$ = create_node(@1.first_line, acao_node, "atribuicao", $1, $2,  NULL);
	}
	| condicao{
		printf("CONDICAO FINAL\n");
		$$ = create_node(@1.first_line, condicao_node, "condicao", $1, NULL);	
	}
	| condicao acao{
		printf("CONDICAO ACAO\n");
		$$ = create_node(@1.first_line, condicao_node, "condicao", $1, $2,  NULL);
	}
	| {};

valor:
	INT_VALOR_TOKEN{ printf("RECONHECENDO VALOR INTEIRO\n");
		$$ = create_node(@1.first_line, int_valor_node, "int_valor", NULL);
	}
	| FLOAT_VALOR_TOKEN{ printf("RECONHECENDO VALOR FLOAT\n");
		$$ = create_node(@1.first_line, float_valor_node, "float_valor", NULL);	
	};
	| CHAR_VALOR_TOKEN{ printf("RECONHECENDO VALOR CHAR\n");
		$$ = create_node(@1.first_line, char_valor_node, "char_valor", NULL);
	};
	| STRING_VALOR_TOKEN{ printf("RECONHECENDO VALOR STRING\n");
		$$ = create_node(@1.first_line, string_valor_node, "string_valor", NULL);
	};
	| BOOL_VALOR_TOKEN{ printf("RECONHECENDO VALOR BOOL\n");
		$$ = create_node(@1.first_line, bool_valor_node, "bool_valor", NULL);	
	};


declaracao: 
	tipo variavel ponto_virgula { 
		printf("RECONHECENDO DECLARACAO\n");
		$$ = create_node(@1.first_line, declaracao_node, "declaracao", $1, $2, $3, NULL); 
	}
	| tipo atribuicao{ 
		printf("RECONHECENDO DECLARACAO INICIALIZANDO\n"); 
		$$ = create_node(@1.first_line, atribuicao_node, "atribuicao", $1, $2, NULL);
	};

atribuicao:
	variavel  igual  valor ponto_virgula { 
		printf("RECONHECENDO ATRIBUICAO VALOR\n");
		$$ = create_node(@1.first_line, atribuicao_node, "atribuicao", $1, $2, $3, $4, NULL);	
	}
	| variavel  igual  expressao{
		printf("RECONHECENDO ATRIBUICAO EXPRESSAO\n");
		$$ = create_node(@1.first_line, atribuicao_node, "atribuicao", $1, $2, $3, NULL);
	
	};

expressao:
	expressao mais expressao ponto_virgula{
		printf("RECONHECENDO EXPRESSAO SOMA\n");	
		$$ = create_node(@1.first_line, expressao_node, "expressao", $1, $2, $3, $4, NULL);
	}
	| expressao  menos  expressao ponto_virgula{
		printf("RECONHECENDO EXPRESSAO SUBTRACAO\n");
		$$ = create_node(@1.first_line, expressao_node, "expressao", $1, $2, $3, $4, NULL);
	}
	| expressao  vezes  expressao ponto_virgula{
		printf("RECONHECENDO EXPRESSAO MULTIPLICACAO\n");
		$$ = create_node(@1.first_line, expressao_node, "expressao", $1, $2, $3, $4, NULL);
	}
	| expressao  dividido  expressao  ponto_virgula{
		printf("RECONHECENDO EXPRESSAO DIVISAO\n");
		$$ = create_node(@1.first_line, expressao_node, "expressao", $1, $2, $3, $4, NULL);
	}
	| valor  mais  valor ponto_virgula{
		printf("RECONHECENDO EXPRESSAO SOMA\n");
		$$ = create_node(@1.first_line, expressao_node, "expressao", $1, $2, $3, $4, NULL);
	}
	| valor  menos  valor ponto_virgula{
		printf("RECONHECENDO EXPRESSAO SUBTRACAO\n");
		$$ = create_node(@1.first_line, expressao_node, "expressao", $1, $2, $3, $4, NULL);
	}
	| valor  vezes  valor ponto_virgula{
		printf("RECONHECENDO EXPRESSAO MULTIPLICACAO\n");
		$$ = create_node(@1.first_line, expressao_node, "expressao", $1, $2, $3, $4, NULL);
	}
	| valor  dividido  valor ponto_virgula{
		printf("RECONHECENDO EXPRESSAO DIVISAO\n");
		$$ = create_node(@1.first_line, expressao_node, "expressao", $1, $2, $3, $4, NULL);
	}
	| variavel  mais  variavel ponto_virgula{
		printf("RECONHECENDO EXPRESSAO SOMA\n");
		$$ = create_node(@1.first_line, expressao_node, "expressao", $1, $2, $3, $4, NULL);
	}
	| variavel  menos  variavel ponto_virgula{
		printf("RECONHECENDO EXPRESSAO SUBTRACAO\n");
		$$ = create_node(@1.first_line, expressao_node, "expressao", $1, $2, $3, $4, NULL);
	}
	| variavel  vezes  variavel ponto_virgula{
		printf("RECONHECENDO EXPRESSAO MULTIPLICACAO\n");
		$$ = create_node(@1.first_line, expressao_node, "expressao", $1, $2, $3, $4, NULL);
		
	}
	| variavel  dividido  variavel ponto_virgula{
		printf("RECONHECENDO EXPRESSAO DIVISAO\n");
		$$ = create_node(@1.first_line, expressao_node, "expressao", $1, $2, $3, $4, NULL);
	};

	condicao:
		if abre_parenteses comparacao_if fecha_parenteses abre_chaves code fecha_chaves{
			printf("RECONHECENDO CONDICAO IF");
			$$ = create_node(@1.first_line, condicao_node, "condicao", $1, $2, $3, $4, $5, $6, $7, NULL);
		}
		|
		if abre_parenteses comparacao_if fecha_parenteses abre_chaves code fecha_chaves else abre_chaves code fecha_chaves{
			printf("RECONHECENDO CONDICAO IF ELSE\n");
			$$ = create_node(@1.first_line, condicao_node, "condicao", $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, NULL);
		};



comparacao_if:
		variavel maior variavel{
		printf("RECONHECENDO COMPARACAO\n");
		$$ = create_node(@1.first_line, comparacao_node, "comparacao", $1, $2, $3, NULL);
	}
	|
		variavel menor variavel{
		printf("RECONHECENDO COMPARACAO\n");
		$$ = create_node(@1.first_line, comparacao_node, "comparacao", $1, $2, $3, NULL);
	}
	|
		variavel igual_igual variavel{
		printf("RECONHECENDO COMPARACAO\n");
		$$ = create_node(@1.first_line, comparacao_node, "comparacao", $1, $2, $3, NULL);
	}
	|
		variavel diferente variavel{
		printf("RECONHECENDO COMPARACAO\n");
		$$ = create_node(@1.first_line, comparacao_node, "comparacao", $1, $2, $3, NULL);
	}
	|
		valor maior valor{
		printf("RECONHECENDO COMPARACAO\n");
		$$ = create_node(@1.first_line, comparacao_node, "comparacao", $1, $2, $3, NULL);
	}
	|
		valor menor valor{
		printf("RECONHECENDO COMPARACAO\n");
		$$ = create_node(@1.first_line, comparacao_node, "comparacao", $1, $2, $3, NULL);
	}
	|
		valor diferente valor{
		printf("RECONHECENDO COMPARACAO\n");
		$$ = create_node(@1.first_line, comparacao_node, "comparacao", $1, $2, $3, NULL);
	}
	|
	valor igual valor{
		printf("RECONHECENDO COMPARACAO\n");
		$$ = create_node(@1.first_line, comparacao_node, "comparacao", $1, $2, $3, NULL);
	};

abre_chaves:
	ABRE_CHAVES_TOKEN{
		printf("RECONHECENDO ABRE_CHAVES\n");
		$$ = create_node(@1.first_line, abre_chaves_node, "abre_chaves", NULL);
};

maior:
	MAIOR_TOKEN{
		printf("RECONHECENDO MAIOR\n");
		$$ = create_node(@1.first_line, maior_node, "maior", NULL);
};

menor:
	MENOR_TOKEN{
		printf("RECONHECENDO MENOR\n");
		$$ = create_node(@1.first_line, menor_node, "menor", NULL);
};

igual_igual:
	IGUAL_IGUAL_TOKEN{
		printf("RECONHECENDO IGUAL_IGUAL\n");
		$$ = create_node(@1.first_line, igual_igual_node, "igual_igual", NULL);
};

diferente:
	DIFERENTE_TOKEN{
		printf("RECONHECENDO DIFERENTE\n");
		$$ = create_node(@1.first_line, diferente_node, "diferente", NULL);
};

fecha_chaves:
	FECHA_CHAVES_TOKEN{
		printf("RECONHECENDO FECHA_CHAVES\n");
		$$ = create_node(@1.first_line, fecha_chaves_node, "fecha_chaves", NULL);
};

abre_parenteses:
	ABRE_PARENTESES_TOKEN{
		printf("RECONHECENDO ABRE_PARENTESES\n");
		$$ = create_node(@1.first_line, abre_parenteses_node, "abre_parenteses", NULL);
};

fecha_parenteses:
	FECHA_PARENTESES_TOKEN{
		printf("RECONHECENDO FECHA_PARENTESES\n");
		$$ = create_node(@1.first_line, fecha_parenteses_node, "fecha_parenteses", NULL);
};

if:
 	IF_TOKEN{
		printf("RECONHECENDO IF\n");
		$$ = create_node(@1.first_line, if_node, "if", NULL);
};
else:
	ELSE_TOKEN{
		printf("RECONHECENDO ELSE\n");
		$$ = create_node(@1.first_line, else_node, "else", NULL);
};
mais:
	SOMA_TOKEN{
		printf("RECONHECENDO SOMA\n");
		$$ = create_node(@1.first_line, soma_node, "soma", NULL);
};
menos:
	SUBTRACAO_TOKEN{
		printf("RECONHECENDO SUBTRACAO\n");
		$$ = create_node(@1.first_line, subtracao_node, "subtracao", NULL);

};
vezes:
	MULTIPLICACAO_TOKEN{
		printf("RECONHECENDO MULTIPLICACAO\n");
		$$ = create_node(@1.first_line, multiplicacao_node, "multiplicacao", NULL);
	};
dividido:
	DIVISAO_TOKEN{
		printf("RECONHECENDO DIVISAO\n");
		$$ = create_node(@1.first_line, divisao_node, "divisao", NULL);		
	};
	

ponto_virgula:
	PONTO_VIRGULA_TOKEN{
		printf("RECONHECENDO PONTO E VIRGULA\n");
		$$ = create_node(@1.first_line, ponto_virgula_node, "ponto_virgula", NULL);	
	};

tipo: 
	INT_TIPO_TOKEN {
		printf("RECONHECENDO TIPO INT\n");
		$$ = create_node(@1.first_line, int_tipo_node, "int", NULL);	
	}
	| FLOAT_TIPO_TOKEN {
		printf("RECONHECENDO TIPO FLOAT\n");
		$$ = create_node(@1.first_line, float_tipo_node, "float", NULL);	
	}
	| CHAR_TIPO_TOKEN {
		printf("RECONHECENDO TIPO CHAR\n");
		$$ = create_node(@1.first_line, char_tipo_node, "char", NULL);	
	}
	| BOOL_TIPO_TOKEN {
		printf("RECONHECENDO TIPO BOOL\n");
		$$ = create_node(@1.first_line, bool_tipo_node, "bool", NULL);	
	};

variavel: 
	VARIAVEL_TOKEN{
		printf("RECONHECENDO VARIAVEL\n");
		$$ = create_node(@1.first_line, variavel_node, "variavel", NULL);	
	};

igual:
	IGUAL_TOKEN{
		printf("RECONHECENDO IGUAL\n");
		$$ = create_node(@1.first_line, igual_node, "igual", NULL);	
	};



%%

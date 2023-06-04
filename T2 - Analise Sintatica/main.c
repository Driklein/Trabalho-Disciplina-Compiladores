#include<stdio.h>
#include<stdlib.h>
#include <assert.h>
#include "node.h"
#include "compilador.tab.h"

char* progname;
int lineno;

extern FILE *yyin;
extern int yyparse();
extern int yylex();
extern Node* syntax_tree;

int main(int argc, char* argv[]) {
   int token;
   
   if (argc < 2 || argc > 3) {
     printf("uso: %s <input_file>. Try again!\n", argv[0]);
     exit(50);
   }
   yyin = fopen(argv[1], "r");
   if (!yyin) {
     printf("Uso: %s <input_file>. Could not find %s. Try again!\n", 
         argv[0], argv[1]);
     exit(55);
   }
  progname = argv[0];
  
	int result = yyparse();
  
	
	if(argc == 3) //testing
		uncompile(stdout, syntax_tree);
	else
	{
		if(!result)
			printf("OKAY.\n");
		else
      printf("\nFAIL. \n");
			//yyerror("ERROR.\n");
	}

  
}

void yyerror(char* s) {
	fprintf(stderr, "%s: %s", progname, s);
	fprintf(stderr, "line %d\n", lineno);
}
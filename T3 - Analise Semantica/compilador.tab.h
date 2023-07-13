/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_COMPILADOR_TAB_H_INCLUDED
# define YY_YY_COMPILADOR_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    VARIAVEL_TOKEN = 274,
    PONTO_VIRGULA_TOKEN = 283,
    INT_TIPO_TOKEN = 309,
    FLOAT_TIPO_TOKEN = 310,
    CHAR_TIPO_TOKEN = 311,
    BOOL_TIPO_TOKEN = 312,
    INT_VALOR_TOKEN = 314,
    FLOAT_VALOR_TOKEN = 315,
    CHAR_VALOR_TOKEN = 316,
    BOOL_VALOR_TOKEN = 317,
    STRING_VALOR_TOKEN = 318,
    MULTIPLICACAO_TOKEN = 285,
    SOMA_TOKEN = 286,
    SUBTRACAO_TOKEN = 287,
    DIVISAO_TOKEN = 288,
    IGUAL_TOKEN = 290,
    IF_TOKEN = 522,
    ELSE_TOKEN = 524,
    ABRE_PARENTESES_TOKEN = 525,
    FECHA_PARENTESES_TOKEN = 526,
    ABRE_CHAVES_TOKEN = 527,
    FECHA_CHAVES_TOKEN = 528,
    MAIOR_TOKEN = 529,
    MENOR_TOKEN = 530,
    IGUAL_IGUAL_TOKEN = 531,
    DIFERENTE_TOKEN = 532
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 18 "compilador.y"

	char* cadeia;
	struct _node * node;

#line 91 "compilador.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;
int yyparse (void);

#endif /* !YY_YY_COMPILADOR_TAB_H_INCLUDED  */

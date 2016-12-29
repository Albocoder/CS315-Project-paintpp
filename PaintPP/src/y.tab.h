/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
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
    DRAW = 258,
    VAR = 259,
    ID = 260,
    ASSIGN_OP = 261,
    COMMA = 262,
    LOGNOT = 263,
    LINE = 264,
    RECTANGLE = 265,
    OVAL = 266,
    COMPOSITE = 267,
    SIZE = 268,
    COLOR = 269,
    LOCATION = 270,
    INT = 271,
    FLOAT = 272,
    STRING = 273,
    BOOLEAN = 274,
    ARRAY_TYPE = 275,
    PRIMARY_OPS = 276,
    LOGICAL_OPS = 277,
    LOGICAL_CONCAT = 278,
    INT_FUNCT = 279,
    FLOAT_FUNCT = 280,
    STRING_FUNCT = 281,
    BOOL_FUNCT = 282,
    WHILE = 283,
    IF = 284,
    ELSE = 285,
    BRACKOP = 286,
    BRACKCL = 287,
    RPAR = 288,
    LPAR = 289
  };
#endif
/* Tokens.  */
#define DRAW 258
#define VAR 259
#define ID 260
#define ASSIGN_OP 261
#define COMMA 262
#define LOGNOT 263
#define LINE 264
#define RECTANGLE 265
#define OVAL 266
#define COMPOSITE 267
#define SIZE 268
#define COLOR 269
#define LOCATION 270
#define INT 271
#define FLOAT 272
#define STRING 273
#define BOOLEAN 274
#define ARRAY_TYPE 275
#define PRIMARY_OPS 276
#define LOGICAL_OPS 277
#define LOGICAL_CONCAT 278
#define INT_FUNCT 279
#define FLOAT_FUNCT 280
#define STRING_FUNCT 281
#define BOOL_FUNCT 282
#define WHILE 283
#define IF 284
#define ELSE 285
#define BRACKOP 286
#define BRACKCL 287
#define RPAR 288
#define LPAR 289

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 49 "parse.y" /* yacc.c:1909  */

  char * stringedparams;

#line 126 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

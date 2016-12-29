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
    BOUNDRECT = 271,
    INT = 272,
    FLOAT = 273,
    STRING = 274,
    BOOLEAN = 275,
    ARRAY_TYPE = 276,
    PRIMARY_OPS = 277,
    LOGICAL_OPS = 278,
    LOGICAL_CONCAT = 279,
    INT_FUNCT = 280,
    FLOAT_FUNCT = 281,
    STRING_FUNCT = 282,
    BOOL_FUNCT = 283,
    WHILE = 284,
    IF = 285,
    ELSE = 286,
    BRACKOP = 287,
    BRACKCL = 288,
    RPAR = 289,
    LPAR = 290
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
#define BOUNDRECT 271
#define INT 272
#define FLOAT 273
#define STRING 274
#define BOOLEAN 275
#define ARRAY_TYPE 276
#define PRIMARY_OPS 277
#define LOGICAL_OPS 278
#define LOGICAL_CONCAT 279
#define INT_FUNCT 280
#define FLOAT_FUNCT 281
#define STRING_FUNCT 282
#define BOOL_FUNCT 283
#define WHILE 284
#define IF 285
#define ELSE 286
#define BRACKOP 287
#define BRACKCL 288
#define RPAR 289
#define LPAR 290

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 50 "parse.y" /* yacc.c:1909  */

  char * stringedparams;

#line 128 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

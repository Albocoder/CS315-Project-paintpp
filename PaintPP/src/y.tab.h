/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
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
     COLORCONSTR = 269,
     LOCATION = 270,
     BOUNDRECT = 271,
     DIRECTION = 272,
     INT = 273,
     FLOAT = 274,
     STRING = 275,
     BOOLEAN = 276,
     ARRAY_TYPE = 277,
     PRIMARY_OPS = 278,
     LOGICAL_OPS = 279,
     LOGICAL_CONCAT = 280,
     INT_FUNCT = 281,
     FLOAT_FUNCT = 282,
     STRING_FUNCT = 283,
     BOOL_FUNCT = 284,
     WHILE = 285,
     IF = 286,
     ELSE = 287,
     BRACKOP = 288,
     BRACKCL = 289,
     RPAR = 290,
     LPAR = 291,
     blackcolor = 292,
     cyancolor = 293,
     greencolor = 294,
     orangecolor = 295,
     purplecolor = 296,
     bluecolor = 297,
     yellowcolor = 298,
     whitecolor = 299,
     redcolor = 300,
     ERROR_CHAR = 301,
     END = 302,
     NEG = 303
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
#define COLORCONSTR 269
#define LOCATION 270
#define BOUNDRECT 271
#define DIRECTION 272
#define INT 273
#define FLOAT 274
#define STRING 275
#define BOOLEAN 276
#define ARRAY_TYPE 277
#define PRIMARY_OPS 278
#define LOGICAL_OPS 279
#define LOGICAL_CONCAT 280
#define INT_FUNCT 281
#define FLOAT_FUNCT 282
#define STRING_FUNCT 283
#define BOOL_FUNCT 284
#define WHILE 285
#define IF 286
#define ELSE 287
#define BRACKOP 288
#define BRACKCL 289
#define RPAR 290
#define LPAR 291
#define blackcolor 292
#define cyancolor 293
#define greencolor 294
#define orangecolor 295
#define purplecolor 296
#define bluecolor 297
#define yellowcolor 298
#define whitecolor 299
#define redcolor 300
#define ERROR_CHAR 301
#define END 302
#define NEG 303




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 63 "parse.y"
{
  char * stringedparams;
  float flot;
  int integer;
  bool boolean;
  int value;
  char * boundrectparams;
  char * rectparams;
  char * strcontents;
  char * colorconstr;
  char * boolconvertparams;
  char * strconvertparams;
  char * floatconvertparams;
  char * intconvertparams;
  char * id;
  char * sizeparams;
  char * location;
}
/* Line 1529 of yacc.c.  */
#line 164 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;


//draw function
%token DRAW

//std
%token VAR
%token ID
%token ASSIGN_OP
%token COMMA
%token LOGNOT

//composite types
%token LINE
%token RECTANGLE
%token OVAL
%token COMPOSITE
%token SIZE
%token COLORCONSTR
%token LOCATION
%token BOUNDRECT
%token DIRECTION

%token INT
%token FLOAT
%token STRING
%token BOOLEAN
%token ARRAY_TYPE

//ops
%token PRIMARY_OPS
%token LOGICAL_OPS
%token LOGICAL_CONCAT

//converters
%token INT_FUNCT
%token FLOAT_FUNCT
%token STRING_FUNCT
%token BOOL_FUNCT

//conditionals
%token WHILE
%token IF
%token ELSE

//parantheses
%token BRACKOP
%token BRACKCL
%token RPAR
%token LPAR

//color tokens
%token blackcolor
%token cyancolor
%token greencolor
%token orangecolor
%token purplecolor
%token bluecolor
%token yellowcolor
%token whitecolor
%token redcolor

%token ERROR_CHAR
%token END

%union{
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

%type <stringedparams> DRAW
%type <flot> FLOAT
%type <integer> INT
%type <boolean> BOOLEAN
%type <location> LOCATION
%type <boundrectparams> BOUNDRECT
%type <rectparams> RECTANGLE
%type <strcontents> STRING
%type <colorconstr> COLORCONSTR
%type <boolconvertparams> BOOL_FUNCT
%type <strconvertparams> STRING_FUNCT
%type <floatconvertparams> FLOAT_FUNCT
%type <intconvertparams> INT_FUNCT
%type <value> DIRECTION
%type <sizeparams> SIZE
%type <id> ID

%left '+' '-' // the order defines precedence,
%left '*' '/' // so * and / has higher precedence than + and - because they are lower in our list so processed after + and -   /* % left means left associative */
%nonassoc NEG

%{
  #include <unordered_map>
  #include <iostream>
  #include <string.h>
  using namespace std;
  // forward declarations
  void yyerror(char *);
  int yylex(void);
  // symbol table to hold variable values
  unordered_map<string, string> symbols;
%}

%%

prog:   stmt prog
      | stmt
      | ERROR_CHAR
      ;

stmt:   cond
      | loop
      | assign
      | DRAW
      | alloc
      ;

prim_exp:  int_exp
          | float_exp
          | boolean_exp
          ;

alloc: VAR ID
      ;

shape_functions: LINE
                | OVAL
                | RECTANGLE
                | COMPOSITE
                ;

comp_exp: LOCATION
          | SIZE
          | BOUNDRECT
          | COLORCONSTR
          | shape_functions
          ;

assign: ID ASSIGN_OP assign_tail
      | ARRAY_TYPE ASSIGN_OP assign_tail
      | VAR ID ASSIGN_OP assign_tail
      ;


assign_tail:  prim_exp
              | comp_exp
              | string_exp
              | color_consts
              ;
color_consts:  blackcolor
              | cyancolor
              | greencolor
              | orangecolor
              | purplecolor
              | bluecolor
              | yellowcolor
              | whitecolor
              | redcolor
              ;

int_exp:  INT int_exp_tail
          | INT_FUNCT
          ;

int_exp_tail: PRIMARY_OPS int_exp
              |
              ;

float_exp:  FLOAT float_exp_tail
            | FLOAT_FUNCT
            ;

float_exp_tail:  PRIMARY_OPS float_exp
                |
                ;

string_exp:  STRING
            | STRING_FUNCT
            //| string_exp '+' STRING_FUNCT
            //| STRING_FUNCT '+'  string_exp
            | string_exp '+' string_exp
            ;

boolean_exp: logic bool_exp_tail 
            | LPAR boolean_exp RPAR
            | LOGNOT boolean_exp %prec NEG
            ;


bool_exp_tail: LOGICAL_CONCAT boolean_exp
              |
              ;

logic:  logic_terminals LOGICAL_OPS logic_terminals
      | logic_terminals
      ;
logic_terminals: ID
                | BOOLEAN
                | BOOL_FUNCT
                ;

cond: IF boolean_exp BRACKOP prog BRACKCL cond_tail
      | IF boolean_exp BRACKOP BRACKCL cond_tail
      ;

cond_tail: ELSE BRACKOP prog BRACKCL
          | ELSE BRACKOP BRACKCL
          |
          ;

loop: WHILE LPAR boolean_exp RPAR BRACKOP prog BRACKCL
        | WHILE LPAR boolean_exp RPAR BRACKOP BRACKCL
        ;


%%
// report errors
void yyerror(char *s)   //if there is an error print out the error
{
  cerr << s << endl;
}

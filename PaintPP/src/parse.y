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
prog:   stmt prog {cout << " in prog!" << endl;}
      | stmt  {cout << "in stmt!" << endl;}
      | ERROR_CHAR  {cout <<"yo from gulo"<< endl;}
      ;

stmt:   cond
      | loop
      | assign  {cout <<"in assign"<<endl;}
      | func
      | alloc
      |   {cout <<"this is an empty stmt"<< endl;}
      ;

prim_exp:  int_exp
          | float_exp
          | boolean_exp
          ;

alloc: VAR ID {cout <<"in var"<<endl;}
      ;

shape_functions: LINE
                  | OVAL
                  | RECTANGLE
                  | COMPOSITE
                  ;

comp_exp: LOCATION
              | SIZE
              | COLORCONSTR
              | shape_functions
              ;
/*
type:  INT
      | FLOAT
      | STRING
      | BOOLEAN
      | ARRAY_TYPE
      | comp_exp
      ;
*/
assign: ID ASSIGN_OP assign_tail
      | VAR ID ASSIGN_OP assign_tail
      ;
      //maybe we should get rid of ASSIGN_OP for better error checking
      //=== can be translated as ASSIGN ASSIGN ASSIGN and not error

assign_tail:  //ID
              prim_exp
              | comp_exp
              | string_exp
              ;

int_exp:  INT int_exp_tail;

int_exp_tail: PRIMARY_OPS int_exp
              | PRIMARY_OPS INT_FUNCT
              |
              ;

float_exp:  FLOAT float_exp_tail
              ;

float_exp_tail:  PRIMARY_OPS float_exp
              | PRIMARY_OPS FLOAT_FUNCT
              |
              ;

string_exp:  STRING {cout<<"IN STRING!!!"<<endl;}
              | STRING_FUNCT
              //| string_exp '+' STRING_FUNCT
              //| STRING_FUNCT '+'  string_exp
              | string_exp '+' string_exp
              ;

boolean_exp: logic bool_exp_tail;

bool_exp_tail: LOGICAL_CONCAT logic bool_exp_tail
                |
                ;

logic: LOGNOT logic %prec NEG
      | ID LOGICAL_OPS ID
      | ID LOGICAL_OPS  BOOL_FUNCT
      | BOOL_FUNCT LOGICAL_OPS BOOL_FUNCT
      | BOOL_FUNCT LOGICAL_OPS ID
      | ID
      | BOOL_FUNCT
      | BOOLEAN
      ;

cond: IF LPAR logic RPAR BRACKOP prog BRACKCL cond_tail;

cond_tail: ELSE BRACKOP prog BRACKCL
            |
            ;

loop: WHILE LPAR logic RPAR BRACKOP prog BRACKCL;

func: comp_exp
        | conv_exp
        | DRAW  {cout << "Draw Params: " << $1 << endl;}
        ;

conv_exp: INT_FUNCT
            | FLOAT_FUNCT
            | STRING_FUNCT
            | BOOL_FUNCT
            ;

%%
// report errors
void yyerror(char *s)   //if there is an error print out the error
{
  cerr << s << endl;
}

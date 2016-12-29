%token DRAW
%token VAR
%token ID
%token ASSIGN_OP
%token COMMA

%token LINE
%token RECTANGLE
%token OVAL
%token COMPOSITE
%token SIZE
%token COLOR
%token LOCATION

%token INT
%token FLOAT
%token STRING
%token BOOLEAN
%token ARRAY_TYPE

%token PRIMARY_OPS

//converters
%token INT_FUNCT
%token FLOAT_FUNCT
%token STRING_FUNCT
%token BOOLEAN_FUNCT

%union{
  char * stringedparams;
}

%type <stringedparams> DRAW

%{
  #include <unordered_map>
  #include <iostream>
  #include <string.h>
  using namespace std;
  // forward declarations
  void yyerror(char *);
  int yylex(void);
  // symbol table to hold variable values
  unordered_map<string, int> symbols;
%}

%%

prog:   prog '\n' stmt
      | stmt
      ;
stmt: //  cond
    //  | loop
      | assign
    //  | function
      | alloc
      ;
alloc: VAR ' ' ID
      ;
shape_functions: LINE
                  | OVAL
                  | RECTANGLE
                  | COMPOSITE
                  ;
comp_exp: LOCATION
              | SIZE
              | COLOR
              | shape_functions
              ;
type:  INT
      | FLOAT
      | STRING
      | BOOLEAN
      | ARRAY_TYPE
      | comp_exp
      ;
assign: ID ASSIGN_OP assign_tail
      | VAR ID ASSIGN_OP assign_tail;
      //maybe we should get rid of ASSIGN_OP for better error checking
      //=== can be translated as ASSIGN ASSIGN ASSIGN and not error

assign_tail:  ID
              | prim_exp
              | comp_exp
              | string_exp
              ;

prim_exp:  int_exp
          | float_exp
          | boolean_exp
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
string_exp:  STRING
              | STRING_FUNCT
              | string_exp + STRING_FUNCT
              | STRING_FUNCT +  string_exp
              | string_exp + string_exp
              ;

boolean_exp: logic bool_exp_tail;

bool_exp_tail: LOGICAL_CONCAT logic bool_exp_tail
                |
                ;

logic: '!' logic
      | ID LOGICAL_OPS ID
      | ID LOGICAL_OPS  BOOL_FUNCT
      | BOOL_FUNCT LOGICAL_OPS BOOL_FUNCT
      | BOOL_FUNCT LOGICAL_OPS ID
      | ID
      | BOOL_FUNCT
      ;

cond: IF '(' logic ')' '{' prog '}' cond_tail;

cond_tail: ELSE '{' prog '}'
            |
            ;

loop: WHILE '(' logic ')' '{' prog '}';

func: comp_exp
        | conv_exp
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

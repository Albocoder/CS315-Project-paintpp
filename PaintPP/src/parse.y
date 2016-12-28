%token DRAW

%union{
  char * stringedparams;
}

%type <stringedparams> DRAW

%{
  #include <unordered_map>
  #include <iostream>
  using namespace std;
  // forward declarations
  void yyerror(char *);
  int yylex(void);
  // symbol table to hold variable values
  unordered_map<string, int> symbols; // a hash table of symbols key is string and int is the value to keep value of my variables
					// to remember the values
%}

%%
program: DRAW            { cout << $1 << endl; }
;
%%
// report errors
void yyerror(char *s)   //if there is an error print out the error
{
  cerr << s << endl;
}

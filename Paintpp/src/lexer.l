%{
#include <iostream>
#include <cstdlib>
void yyerror(char *);
%}


%%



%%

int main(){
	yylex();
	return 0;
}

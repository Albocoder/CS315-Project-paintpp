%{
#include <iostream>
#include <cstdlib>
#include <string>
#include <stdio.h>
#include <stdlib.h>
using namespace std;
void yyerror(char *);
#include "y.tab.h"
%}

id [a-zA-Z][a-zA-Z0-9_]*
int [0-9]+
string \"([^\"\\\n]|\\\"|\\n|\\t|\\\\)*\"
float [0-9]*\.[0-9]+
bool TRUE|FALSE
arraytype {id}\[({int}|{id})\]
logical_ops ((==)|(<=)|(<)|(>)|(>=)|(!=))
logical_concat (&&|\|\|)
logical_not \!
primary_ops [+\-*/]
assign_op \=
directions N|E|S|W|(NE)|(SE)|(SW)|(NW)
location Location\((({float}|{int}|{id}){comma}({float}|{int}|{id}))\)
size Size\(({float}|{int}|{id}){comma}({float}|{int}|{id})\)
bounding BoundingRectangle\(({id}){comma}({id})\)
var_decl var
draw_funct Draw\(({id}{comma}{id}({comma}{id})?({comma}{id})?({comma}{id})?)\)
oval_shape Oval\(\)
rect_shape Rect\(({int}|{bool})\)
line_shape Line\(({directions}{comma}({id}|{int}){comma}({id}|{int}))\)
comp_funct Composite\({id}\)
lparan \(
rparan \)
comma ,
if if
else else
while while
brackcl \}
brackop \{
str_funct str\(({int}|{float}|{bool}|{id})\)
float_funct float\(({int}|{bool}|{string}|{id})\)
int_funct int\(({float}|{bool}|{string})\)
bool_funct bool\(({string}|{int}|{float}|{id})\)
redcolor Color\.RED
blackcolor Color\.BLACK
cyancolor Color\.CYAN
greencolor Color\.GREEN
orangecolor Color\.ORANGE
purplecolor Color\.PURPLE
bluecolor Color\.BLUE
yellowcolor Color\.YELLOW
whitecolor Color\.WHITE
color Color\(({int}|{id}){comma}({int}|{id}){comma}({int}|{id})\)
colorconstructor Color\.rgb\(({int}|{id}){comma}({int}|{id}){comma}({int}|{id})\)
%%
\/\/[^\n]* printf("comment here");
[ \t\r]+ ;

{var_decl} {
	printf("VAR ");
	return VAR;
}
{comp_funct} {
	printf("%s ", "compositeFunction ");
}
{arraytype} {
	printf("arraytype ");
}
{brackop} {
	printf("%s ", "brackop");
}
{brackcl} {
	printf("%s ", "brackcl");
}
{colorconstructor} {
	printf("%s ", "colorConstr");
}
{blackcolor} {
	printf("%s ", "blackcol");
}
{cyancolor} {
	printf("%s ", "cyancol");
}
{greencolor} {
	printf("%s ", "greencol");
}
{orangecolor} {
	printf("%s ", "orangecol");
}
{purplecolor} {
	printf("%s ", "purpcol");
}
{bluecolor} {
	printf("%s ", "blucol");
}
{yellowcolor} {
	printf("%s ", "yellowcol");
}
{whitecolor} {
	printf("%s ", "whitecol");
}
{redcolor} {
	printf("%s ", "redcol");
}
{bool_funct} {
	printf("%s ", "boolconvert");
}
{str_funct} {
	printf("%s ", "strconvert");
}
{float_funct} {
	printf("%s ", "floatconvert");
}
{int_funct} {
	printf("%s ", "intconvert");
}

{if} {
	printf("%s ", "IF");
}

{else} {
	printf("%s ", "ELSE");
}

{while} {
	printf("%s ", "WHILE");
}

{float} {
	printf("%s ", "FLOAT");
}

{int} {
	printf("%s ", "INT");
	return INT;
}


{bool} {
	printf("%s ", "BOOL");
}

{logical_ops} {
	printf("%s ", "LOGOP");
}

{logical_concat} {
	printf("%s ", "LOGCONC");
}

{logical_not} {
	printf("%s ", "LOGNOT");
}

{primary_ops} {
	printf("%s ", "PRIMOP");
	return PRIMARY_OPS;
}

{assign_op} {
	printf("%s ", "ASSIGN_OP");
	return ASSIGN_OP;
}


{location} {
	printf("%s ", "loc");
}

{directions} {
	printf("%s ", "DIR");
}

{size} {
	printf("%s ", "SIZE");
	return SIZE;
}

{color} {
	printf("%s ", "COL");
}

{bounding} {
	printf("%s ", "BOUNDRECT");
}

{draw_funct} {
	int stringlength = strlen(yytext);
	char * newString = (char*) malloc(sizeof(char)*(stringlength-5));
	cout << stringlength << endl;
	strncpy(newString,yytext+5,stringlength-6);
	*(newString+stringlength-5) = '\0';
	yylval.stringedparams = newString;
	return DRAW;
}

{oval_shape} {
	printf("OVAL ");
	return OVAL;
}

{rect_shape} {
	printf("RECT ");
	return RECTANGLE;
}

{line_shape} {
	printf("LINE ");
	return LINE;
}

{lparan} {
	printf("LPAR ");
}

{rparan} {
	printf("RPAR ");
}

{comma} {
	printf("comma ");
	return COMMA;
}
{string} {
	printf("%s ", "STRING ");
}

{id} {
	printf("%s ", "ID ");
	return ID;
}
. { /* anything else is error */
  printf("ERROR ");
}
%%

int yywrap(void){
  return 1;
}

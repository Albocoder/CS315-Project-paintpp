%{
#include <iostream>
#include <cstdlib>
#include <string>
#include <stdio.h>
#include <stdlib.h>
using namespace std;
void yyerror(char *);
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
directions 'N'|'E'|'S'|'W'|'NE'|'SE'|'SW'|'NW'
location Location\(({int}|{id}){comma}({int}|{id})\)
size Size\(({int}|{id}){comma}({int}|{id})\)
color Color\(({int}|{id}){comma}({int}|{id}){comma}({int}|{id})\)
bounding BoundingRectangle\(({int}|{id}){comma}({int}|{id})\)
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
redcolor Color'.'RED
blackcolor Color'.'BLACK
cyancolor Color'.'CYAN
greencolor Color'.'GREEN
orangecolor Color'.'ORANGE
purplecolor Color'.'PURPLE
bluecolor Color'.'BLUE
yellowcolor Color'.'YELLOW
whitecolor Color'.'WHITE
colorconstructor Color'.'rgb\(({int}|{id}){comma}({int}|{id}){comma}({int}|{id})\)
%%
\/\/[^\n]* printf("comment here");
[ \t\r]+ ;

{var_decl} {
	printf("VAR ");
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
}

{assign_op} {
	printf("%s ", "ASSIGN");
}

{directions} {
	printf("%s ", "DIR");
}

{location} {
	printf("%s ", "loc");
}

{size} {
	printf("%s ", "SZ");
}

{color} {
	printf("%s ", "COL");
}

{bounding} {
	printf("%s ", "BOUNDRECT");
}


{draw_funct} {
	printf("DRAW ");
}

{oval_shape} {
	printf("OVAL ");
}

{rect_shape} {
	printf("RECT ");
}

{line_shape} {
	printf("LINE ");
}

{lparan} {
	printf("LPAR ");
}

{rparan} {
	printf("RPAR ");
}

{comma} {
	printf("comma ");
}
{string} {
	printf("%s ", "STRING ");
}

{id} {
	printf("%s ", "ID ");
}
. { /* anything else is error */
  printf("ERROR ");
}
%%
int yywrap(void)
{
  return 1;
}

int main()
{
  yylex();
  return 0;
}


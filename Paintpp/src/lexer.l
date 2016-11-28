%{
#include <iostream>
#include <cstdlib>
#include <string>
using namespace std;
void yyerror(char *);
%}

id [a-zA-Z][a-zA-Z0-9_]*
int [0-9]+
string ".*"
float  [0-9]*('.'[0-9]|[0-9]'.'[0-9])[0-9]*
bool 'True'|'False'
logical_ops [\==\<=\<\>\>=\!=]
logical_concat (&&|\|\|)
logical_not '!'
primary_ops [+\-*/]
assign_op '='
directions 'N'|'E'|'S'|'W'|'NE'|'SE'|'SW'|'NW'
location Location\(({int}|{id}){comma}({int}|{id})\)
size Size({int}|{id},{int}|{id})
color Color\(({int}|{id}){comma}({int}|{id}){comma}({int}|{id})\)
bounding BoundingRectangle\(({int}|{id}){comma}({int}|{id})\)
var_decl 'var'
draw_funct 'Draw'
oval_shape 'Oval'
rect_shape 'Rect'
line_shape 'Line'
lparan \(
rparan \)
comma \,
if 'if'
else 'else'
while 'while'
brackcl '}'
brackop '{'
str_funct str\({int}|{float}|{bool}|{id}\)
float_funct float\({int}|{bool}|{string}|{id}\)
int_funct int\({float}|{bool}|{string}|{id}\)
bool_funct bool\({string}|{int}|{float}|{id}\)
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
\/\/[^\n]* ;
{colorconstructor} {
	string toReturn = strdup(yytext+10);
	toReturn+(toReturn.find(")")) = \0;
	int tmp = toReturn.find(',');
	yyval.arg1 = toReturn.substr(0,tmp);
	toReturn = toReturn+tmp+1;
	tmp = toReturn.find(',');
	yyval.arg2 = toReturn.substr(0,tmp);
	toReturn = toReturn+tmp+1;
	yyval.arg3 = toReturn;
	return COLOR_CONSTRUCTOR;
}
{blackcolor} {
	return BLACK_COLOR;
}
{cyancolor} {
	return CYAN_COLOR;
}
{greencolor} {
	return GREEN_COLOR;
}
{orangecolor} {
	return ORANGE_COLOR;
}
{purplecolor} {
	return PURPLE_COLOR;
}
{bluecolor} {
	return BLUE_COLOR;
}
{yellowcolor} {
	return YELLOW_COLOR;
}
{whitecolor} {
	return WHITE_COLOR;
}
{redcolor} {
	return RED_COLOR;
}
{bool_funct} {
	yytext+(yytext.find(')')) = \0;
	yyval.value = strdup(yytext+4);
	return BOOL_FUNCT;
}
{str_funct} {
	yytext+(yytext.find(')')) = \0;
	yyval.value = strdup(yytext+3);
	return STR_FUNCT;
}
{float_funct} {
	yytext+(yytext.find(')')) = \0;
	yyval.value = strdup(yytext+5);
	return FLOAT_FUNCT;
}
{int_funct} {
	yytext+(yytext.find(')')) = \0;
	yyval.value = strdup(yytext+3);
	return INT_FUNCT;
}

{if} {
	return IF;
}

{else} {
	return ELSE;
}

{while} {
	return WHILE;
}

{id} {
	yyval.id = strdup(yytext);
	return ID;
}

{int} {
	yyval.int = atoi(yytext);
	return INT;
}

{string} {
	yyval.string = strdup(yytext);
	return STRING;
}

{float} {
	yyval.float = atof(yytext);
	return FLOAT;
}

{bool} {
	if(strcmp(yytext, "True") == 0)
		yyval.bool = 1;
	else
		yyval.bool = 0;
	return BOOL;
}

{logical_ops} {
	yyval.logical_ops = *yytext;
	return LOGICAL_OPS;
}

{logical_concat} {
	yyval.logical_concat = *yytext;
	return LOGICAL_CONCAT;
}

{logical_not} {
	yyval.logical_not = *yytext;
	return LOGICAL_NOT;
}

{primary_ops} {
	yyval.primary = *yytext;
	return PRIMARY_OPS;
}

{assign_op} {
	yyval.assign_op = *yytext;
	return ASSIGN_OP;
}

{directions} {
	if(strcmp(yytext, "N")  == 0)
		yyval.directions = 0;
	else if(strcmp(yytext, "E") == 0)
		yyval.directions = 1;
	else if(strcmp(yytext, "S") == 0)
		yyval.directions = 2;
	else if(strcmp(yytext, "W") == 0)
		yyval.directions = 3;
	else if(strcmp(yytext, "NE") == 0)
		yyval.directions = 4;
	else if(strcmp(yytext, "NW") == 0)
		yyval.directions = 5;
	else if(strcmp(yytext, "SE") == 0)
		yyval.directions = 6;
	else
		yyval.directions = 7;

	return DIRECTION;
}

{location} {
	yyval.location = *yytext;
	return LOCATION;
}

{size} {
	yyval.size = *yytext;
	return SIZE;
}

{color} {
	yytext.color = *yytext;
	return COLOR;
}

{bounding} {
	yytext.bounding = *yytext;
	return BOUNDING;
}

{var_decl} {
	return VAR;
}

{draw_funct} {
	return DRAW;
}

{oval_shape} {
	return OVAL;
}

{rect_shape} {
	return RECT;
}

{line_shape} {
	return LINE;
}

{lparan} {
	return LPARAN;
}

{rparan} {
	return RPARAN;
}

{comma} {
	return COMMA;
}
. {
	return ERROR_CHAR;
}
%%
int main(){
	yylex();
	return 0;
}

%{
#include <iostream>
#include <cstdlib>
#include <string>
using namespace std;
void yyerror(char *);
%}

id [a-zA-Z][a-zA-Z0-9_]*
int [0-9]+
string "[ˆ\n\"]*"
float  [0-9]*('.'[0-9]|[0-9]'.'[0-9])[0-9]*
bool 'True'|'False'
logical_ops [\==\<=\<\>\>=\!=]
logical_concat (&&|\|\|)
logical_not '!'
primary_ops [+\-*/]
assign_op '='
directions 'N'|'E'|'S'|'W'|'NE'|'SE'|'SW'|'NW'
location Location\(({int}|{id}){comma}({int}|{id})\)
size Size\({int}|{id},{int}|{id}\)
color Color\(({int}|{id}){comma}({int}|{id}){comma}({int}|{id})\)
bounding BoundingRectangle\(({int}|{id}){comma}({int}|{id})\)
var_decl 'var'
draw_funct 'Draw'
oval_shape 'Oval'
rect_shape 'Rect'
line_shape 'Line'
lparan \(
rparan \)
comma ,
if 'if'
else 'else'
while 'while'
brackcl '}'
brackop '{'
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
	printf("%s ", yytext);
	return BLACK_COLOR;
}
{cyancolor} {
	printf("%s ", yytext);
	return CYAN_COLOR;
}
{greencolor} {
	printf("%s ", yytext);
	return GREEN_COLOR;
}
{orangecolor} {
	printf("%s ", yytext);
	return ORANGE_COLOR;
}
{purplecolor} {
	printf("%s ", yytext);
	return PURPLE_COLOR;
}
{bluecolor} {
	printf("%s ", yytext);
	return BLUE_COLOR;
}
{yellowcolor} {
	printf("%s ", yytext);
	return YELLOW_COLOR;
}
{whitecolor} {
	printf("%s ", yytext);
	return WHITE_COLOR;
}
{redcolor} {
	printf("%s ", yytext);
	return RED_COLOR;
}
{bool_funct} {
	yytext+(yytext.find(')')) = \0;
	yyval.value = strdup(yytext+4);
	printf("%s ", yyval.value);
	return BOOL_FUNCT;
}
{str_funct} {
	yytext+(yytext.find(')')) = \0;
	yyval.value = strdup(yytext+3);
	printf("%s ", yyval.value);
	return STR_FUNCT;
}
{float_funct} {
	yytext+(yytext.find(')')) = \0;
	yyval.value = strdup(yytext+5);
	printf("%s ", yyval.value);
	return FLOAT_FUNCT;
}
{int_funct} {
	yytext+(yytext.find(')')) = \0;
	yyval.value = strdup(yytext+3);
	printf("%s ", yyval.value);
	return INT_FUNCT;
}

{if} {
	printf("%s ", yyval);
	return IF;
}

{else} {
	printf("%s ", yyval);
	return ELSE;
}

{while} {
	printf("%s ", yyval);
	return WHILE;
}

{id} {
	yyval.id = strdup(yytext);
	printf("%s ", yyval.id);
	return ID;
}


{int} {
	yyval.integer = atoi(yytext);
	printf("%d ", yyval.integer);
	return INT;
}

{string} {
	yyval.string = strdup(yytext);
	printf("%s ", yyval.string);
	return STRING;
}

{float} {
	yyval.float = atof(yytext);
	printf("%f ", yyval.float);
	return FLOAT;
}

{bool} {
	if(strcmp(yytext, "True") == 0)
		yyval.bool = 1;
	else
		yyval.bool = 0;
	printf("%d ", yyval.bool);
	return BOOL;
}

{logical_ops} {
	yyval.logical_ops = *yytext;
	printf("%s ", yyval.logical_ops);
	return LOGICAL_OPS;
}

{logical_concat} {
	yyval.logical_concat = *yytext;
	printf("%s ", yyval.logical_concat);
	return LOGICAL_CONCAT;
}

{logical_not} {
	yyval.logical_not = *yytext;
	printf("%s ", yyval.logical_not);
	return LOGICAL_NOT;
}

{primary_ops} {
	yyval.primary = *yytext;
	printf("%s ", yyval.primary);
	return PRIMARY_OPS;
}

{assign_op} {
	yyval.assign_op = *yytext;
	printf("%s ", yyval.assign_op);
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

	printf("%d ", yyval.directions);
	return DIRECTION;
}

{location} {
	yyval.location = *yytext;
	printf("%s ", yyval.location);
	return LOCATION;
}

{size} {
	yyval.size = *yytext;
	printf("%s ", yyval.size);
	return SIZE;
}

{color} {
	yyval.color = *yytext;
	printf("%s ", yyval.color);
	return COLOR;
}

{bounding} {
	yyval.bounding = *yytext;
	printf("%s ", yyval.bounding);
	return BOUNDING;
}

{var_decl} {
	printf("VAR");
	return VAR;
}

{draw_funct} {
	printf("DRAW");
	return DRAW;
}

{oval_shape} {
	printf("OVAL");
	return OVAL;
}

{rect_shape} {
	printf("RECT");
	return RECT;
}

{line_shape} {
	printf("LINE");
	return LINE;
}

{lparan} {
	printf("(");
	return LPARAN;
}

{rparan} {
	printf(")");
	return RPARAN;
}

{comma} {
	printf(",")
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

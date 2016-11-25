%{
#include <iostream>
#include <cstdlib>
void yyerror(char *);
%}

id [a-z]+[0-9]*
int [0-9]+
string ".*"
float  {int}|[0-9]*('.'[0-9]|[0-9]'.')[0-9]*
bool true|false
logical_ops [(==)(<=)(<)(>)(>=)(!=)]
logical_concat [(&&) (||)]
logical_not !
primary_ops [+-*/]
assign_op =
directions [(N)(E)(S)(W)(NE)(SE)(SW)(NW)]
location Location({int}|{id},{int}|{id})
size Size({int}|{id},{int}|{id})
color Color({int}|{id},{int}|{id},{int}|{id})
var_decl var
draw_funct Draw
oval_shape Oval
rect_shape Rect
line_shape Line

%%

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
	if(strcmp(yytext, "true") == 0)
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
	yyval.primary_ops = *yytext;
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

( {
	return LPARAN;
}

) {
	return RPARAN;
}

, {
	return COMMA;
}

%%

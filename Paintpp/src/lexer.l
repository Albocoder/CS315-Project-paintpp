%{
#include <iostream>

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
	yyval.directions = *yytext;
	return PRIMARY_OPS;
}
%%

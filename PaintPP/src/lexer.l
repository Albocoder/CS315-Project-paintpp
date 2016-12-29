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
	return BRACKOP;
}
{brackcl} {
	printf("%s ", "brackcl");
	return BRACKCL;
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
	return IF;
}

{else} {
	printf("%s ", "ELSE");
	return ELSE;
}

{while} {
	printf("%s ", "WHILE");
	return WHILE;
}

{float} {
	printf("%s ", "FLOAT");
	yyval.float = atof(*yytext);
	return FLOAT;
}

{int} {
	printf("%s ", "INT");
	yyval.integer = atoi(*yytext);
	return INT;
}


{bool} {
	printf("%s ", "BOOL");
	if(stcmp(*yytext, "TRUE") )
		yyval.boolean = TRUE;
	if(stcmp(*yytext, "FALSE") )
		yyval.boolean = FALSE;
	return BOOL;
}

{logical_ops} {
	printf("%s ", "LOGOP");
	return LOGOP;
}

{logical_concat} {
	printf("%s ", "LOGCONC");
	return LOGCONC;
}

{logical_not} {
	printf("%s ", "LOGNOT");
	return LOGNOT;
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
	printf("%s ", "location");
	int stringlength = strlen(yytext);
	char * newString = (char*) malloc(sizeof(char)*(stringlength-9));
	cout << stringlength << endl;
	strncpy(newString,yytext+9,stringlength-10);
	*(newString+stringlength+9) = '\0';
	yylval.location = newString;
	return LOCATION;
}

{directions} {
	printf("%s ", "DIR");
	if(strcmp(*yytext, "N") == 0)
		yyval.value = 0;
	else if(strcmp(*yytext, "E") == 0)
		yyval.value = 1;
	else if(strcmp(*yytext, "S") == 0)
		yyval.value = 2;
	else if(strcmp(*yytext, "W") == 0)
		yyval.value = 3;
	else if(strcmp(*yytext, "NE") == 0)
		yyval.value = 4;
	else if(strcmp(*yytext, "SE") == 0)
		yyval.value = 5;
	else if(strcmp(*yytext, "NW") == 0)
		yyval.value = 6;
	else if(strcmp(*yytext, "SW") == 0)
		yyval.value = 7;
	else yyval.value = -1;

	return DIRECTION;
}

{size} {
	printf("%s ", "SIZE");
	int stringlength = strlen(yytext);
	char * newString = (char*) malloc(sizeof(char)*(stringlength-5));
	cout << stringlength << endl;
	strncpy(newString,yytext+5,stringlength-6);
	*(newString+stringlength-5) = '\0';
	yylval.sizeparams = newString;
	return SIZE;
}

{bounding} {
	printf("%s ", "BOUNDRECT");
	int stringlength = strlen(yytext);
	char * newString = (char*) malloc(sizeof(char)*(stringlength-10));
	cout << stringlength << endl;
	strncpy(newString,yytext+10,stringlength-11);
	*(newString+stringlength-10) = '\0';
	yylval.boundrectparams = newString;
	return BOUNDRECT;
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
	int stleng = strlen(yytext);
	char *returnedString = (char*) malloc(sizeof(char)*(strleng-5));
	cout << stleng << endl;
	strncpy(returnedString, yytext+5, stleng-6);
	*(returnedString + stleng-5) = '\0';
	cout << returnedString << endl;
	yyval.rectparams = returnedString;
	return RECTANGLE;
}

{line_shape} {
	printf("LINE ");
	return LINE;
}

{lparan} {
	printf("LPAR ");
	return LPAR;
}

{rparan} {
	printf("RPAR ");
	return RPAR;
}

{comma} {
	printf("comma ");
	return COMMA;
}

{string} { 
	printf("%s ", "STRING ");
	int stleng = strlen(yytext);
	char *returnedString = (char*) malloc(sizeof(char)*(strleng-1));
	cout << stleng << endl;
	strncpy(returnedString, yytext+1, stleng-2);
	*(returnedString + stleng-1) = '\0';
	cout << returnedString << endl;
	yyval.strcontents = returnedString;
	return STRING;
}

{id} {
	printf("%s ", "ID ");
	yyval.id = *yytext;
	return ID;
}
. { /* anything else is error */
  printf("ERROR ");
}
%%

int yywrap(void){
  return 1;
}

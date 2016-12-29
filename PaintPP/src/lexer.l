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
    int stringLength = strlen(yytext);
    char * newString = (char*) malloc(sizeof(char)*(stringLength-10));
    cout << stringLength << endl;
    strncpy(newString,yytext+10,stringLength-11);
    *(newString+stringLength-10) = '\0';
    yylval.stringedparams = newString;
    return COMPOSITE;

}
{arraytype} {
	printf("arraytype ");
    int stringLength = strlen(yytext);
    char * newString = (char*) malloc(sizeof(char)*(stringLength-10));
    cout << stringLength << endl;
    strncpy(newString,yytext,stringLength);
    for(int i = 0; i++; i < stringLength)
    {
        if(*(yytext+i) == '[')
            *(newString+i) = ',';
        if(*(yytext+i) == ']')
            *(newString+i) = '\0';
    }
    yylval.stringedparams = newString;
    return ARRAY_TYPE;
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
	int stringLength = strlen(yytext);
	char * newString = (char*) malloc(sizeof(char)*(stringLength-10));
	cout << stringLength << endl;
	strncpy(newString,yytext+10,stringLength-11);
	*(newString+stringLength-10) = '\0';
	yylval.colorconstr = newString;
	return COLORCONSTR;
}

{cyancolor} {
	printf("%s ", "cyancol");
	return cyancolor;
}
{blackcolor} {
	printf("%s ", "blackcol");
	return blackcolor;
}
{greencolor} {
	printf("%s ", "greencol");
	return greencolor;
}
{orangecolor} {
	printf("%s ", "orangecol");
	return orangecolor;
}
{purplecolor} {
	printf("%s ", "purpcol");
	return purplecolor;
}
{bluecolor} {
	printf("%s ", "blucol");
	return bluecolor;
}
{yellowcolor} {
	printf("%s ", "yellowcol");
	return yellowcolor;
}
{whitecolor} {
	printf("%s ", "whitecol");
	return whitecolor;
}
{redcolor} {
	printf("%s ", "redcol");
	return redcolor;
}
{bool_funct} {
	printf("%s ", "boolconvert");
    int stringLength = strlen(yytext);
    char * newString = (char*) malloc(sizeof(char)*(stringLength-5));
    cout << stringLength << endl;
    strncpy(newString,yytext+5,stringLength-6);
    *(newString+stringLength-5) = '\0';
    yylval.boolconvertparams = newString;
    return BOOL_FUNCT;

}
{str_funct} {
	printf("%s ", "strconvert");
    int stringLength = strlen(yytext);
    char * newString = (char*) malloc(sizeof(char)*(stringLength-4));
    cout << stringLength << endl;
    strncpy(newString,yytext+4,stringLength-5);
    *(newString+stringLength-4) = '\0';
    yylval.strconvertparams = newString;
    return STRING_FUNCT;
}
{float_funct} {
	printf("%s ", "floatconvert");
    int stringLength = strlen(yytext);
    char * newString = (char*) malloc(sizeof(char)*(stringLength-7));
    cout << stringLength << endl;
    strncpy(newString,yytext+7,stringLength-8);
    *(newString+stringLength-7) = '\0';
    yylval.floatconvertparams = newString;
    return FLOAT_FUNCT;
}
{int_funct} {
	printf("%s ", "intconvert");
    int stringLength = strlen(yytext);
    char * newString = (char*) malloc(sizeof(char)*(stringLength-4));
    cout << stringLength << endl;
    strncpy(newString,yytext+4,stringLength-5);
    *(newString+stringLength-4) = '\0';
    yylval.intconvertparams = newString;
    return INT_FUNCT;
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
	char * s = strdup(yytext);
	yylval.flot = atof(s);
	return FLOAT;
}

{int} {
	printf("%s ", "INT");
	char * s = strdup(yytext);
	yylval.integer = atoi(s);
	return INT;
}


{bool} {
	printf("%s ", "BOOL");
	if(strcmp(yytext, "TRUE") )
		yylval.boolean = true;
	if(strcmp(yytext, "FALSE") )
		yylval.boolean = false;
	return BOOLEAN;
}

{logical_ops} {
	printf("%s ", "LOGICAL_OPS");
	return LOGICAL_OPS;
}

{logical_concat} {
	printf("%s ", "LOGICAL_CONCAT");
	return LOGICAL_CONCAT;
}

{logical_not} {
	printf("%s ", "LOGNOT");
	return LOGNOT;
}

{primary_ops} {
	printf("%s ", "PRIMARY_OPS");
	return PRIMARY_OPS;
}

{assign_op} {
	printf("%s ", "ASSIGN_OP");
	return ASSIGN_OP;
}


{location} {
	printf("%s ", "location");
	int stringLength = strlen(yytext);
	char * newString = (char*) malloc(sizeof(char)*(stringLength-9));
	cout << stringLength << endl;
	strncpy(newString,yytext+9,stringLength-10);
	*(newString+stringLength-9) = '\0';
	yylval.location = newString;
	return LOCATION;
}

{directions} {
	printf("%s ", "DIR");
	if(strcmp(yytext, "N") == 0)
		yylval.value = 0;
	else if(strcmp(yytext, "E") == 0)
		yylval.value = 1;
	else if(strcmp(yytext, "S") == 0)
		yylval.value = 2;
	else if(strcmp(yytext, "W") == 0)
		yylval.value = 3;
	else if(strcmp(yytext, "NE") == 0)
		yylval.value = 4;
	else if(strcmp(yytext, "SE") == 0)
		yylval.value = 5;
	else if(strcmp(yytext, "NW") == 0)
		yylval.value = 6;
	else if(strcmp(yytext, "SW") == 0)
		yylval.value = 7;
	else yylval.value = -1;

	return DIRECTION;
}

{size} {
	printf("%s ", "SIZE");
	int stringLength = strlen(yytext);
	char * newString = (char*) malloc(sizeof(char)*(stringLength-5));
	cout << stringLength << endl;
	strncpy(newString,yytext+5,stringLength-6);
	*(newString+stringLength-5) = '\0';
	yylval.sizeparams = newString;
	return SIZE;
}

{bounding} {
	printf("%s ", "BOUNDRECT");
	int stringLength = strlen(yytext);
	char * newString = (char*) malloc(sizeof(char)*(stringLength-10));
	cout << stringLength << endl;
	strncpy(newString,yytext+10,stringLength-11);
	*(newString+stringLength-10) = '\0';
	yylval.boundrectparams = newString;
	return BOUNDRECT;
}

{draw_funct} {
	int stringLength = strlen(yytext);
	char * newString = (char*) malloc(sizeof(char)*(stringLength-5));
	strncpy(newString,yytext+5,stringLength-6);
	*(newString+stringLength-5) = '\0';
	yylval.stringedparams = newString;
	return DRAW;
}

{oval_shape} {
	printf("OVAL ");
	return OVAL;
}

{rect_shape} {
	printf("RECT ");
	int strleng = strlen(yytext);
	char *returnedString = (char*) malloc(sizeof(char)*(strleng-5));
	cout << strleng << endl;
	strncpy(returnedString, yytext+5, strleng-6);
	*(returnedString + strleng-5) = '\0';
	cout << returnedString << endl;
	yylval.rectparams = returnedString;
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

{id} {
	printf("%s ", "ID");
	yylval.id = yytext;
	return ID;
}

{string} {
	printf("%s", "STRING");
	int strleng = strlen(yytext);
	char *returnedString = (char*) malloc(sizeof(char)*(strleng-1));
	cout << strleng << endl;
	strncpy(returnedString, yytext+1, strleng-2);
	*(returnedString + strleng-1) = '\0';
	cout << "RETURNED STRING" << returnedString << endl;
	yylval.strcontents = returnedString;
	return STRING;
}


\$ { return END; }

%%

int yywrap(void){
  return 1;
}

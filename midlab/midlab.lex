%option noyywrap
%{
	#include<stdio.h>
%}

digit[0-9]
letter[A-Za-z]
key "int"|"main"|"for"|"return"|"printf"|"while"|"scanf"|"if"|"else"

%%
{key} {printf("%s is a keyword and length is: %d\n", yytext, yyleng);}
{letter} ({letter}|{digit})* {printf("%s is an identifier and length is: %d\n",yytext, yyleng);}
{digit}+ {printf("%s is an int number and int value is: %d\n",yytext, atoi);}
{digit}+"."{digit}+ {print("%s is a floating vlaue is %f\n", yytext, atof(yytext));}

%%
int main()
{ yylex()

	return 0;
}

%{
#include<stdio.h>
#include "boolcalc.tab.h"
%}

%option noyywrap

%%

[ \t]   ;  
[01]+      		{ yylval = atoi(yytext); return BOOLEAN; }  /* 0 and 1 are treated as FALSE and TRUE */
[Tt][Rr][Uu][Ee]+ 	{ yylval = 1; return BOOLEAN; }  /* Treat any case variation of "TRUE" as 1 */
[Ff][Aa][Ll][Ss][Ee]+ 	{ yylval = 0; return BOOLEAN; }  /* Treat any case variation of "FALSE" as 0 */
[&]       		{ return AND; }  /* AND operator */
[|]       		{ return OR; }  /* OR operator */
[!]       		{ return NOT; }  /* NOT operator */
\n			{return NEWLINE;}

%%


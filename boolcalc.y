%{
#include<stdio.h>

int yylex (void);
extern int yyparse();
extern FILE* yyin;

void yyerror (char const *);
%}

%define api.value.type {int} 

// Tokenize the variables 
%token BOOLEAN 
%token AND OR NOT
%token NEWLINE
%start input


%%

input:
  %empty
| input line
;

line:
  NEWLINE
| exp NEWLINE {printf("%s\n", $1 ? "TRUE" : "FALSE"); } 	// Outputs only TRUE or FALSE
;

exp:
  BOOLEAN
| exp exp AND {$$ = $1 && $2;} 	// Handles the boolean algebra for AND
| exp exp OR {$$ = $1 || $2;} 	// Handles the boolean algebra for OR
| exp NOT {$$ = !$2;} 	// Handles the boolean algebra for NOT

;
%%


void yyerror (char const *s){
  fprintf(stderr, "%s\n",s);
}

int main(void){
  yyin = stdin;
  do {
	yyparse();
  } while (!feof(yyin));
  return 0;
}  

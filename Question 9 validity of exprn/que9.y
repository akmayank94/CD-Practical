%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER
%token INVALID

/* Operator precedence (lowest to highest) */
%left '+' '-'
%left '*' '/'
%right UMINUS     /* unary minus */

%%

start:
      expr               { printf("Valid expression\n"); }
    ;

expr:
      expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '-' expr %prec UMINUS
    | '(' expr ')'
    | NUMBER
    ;

%%

void yyerror(const char *s) {
    printf("Invalid expression\n");
}

int main() {
    printf("Enter expression: ");
    yyparse();
    return 0;
}

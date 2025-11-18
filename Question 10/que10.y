%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'
%right UMINUS

%%

start:
      expr '\n'   { printf("Result = %d\n", $1); }
    | start expr '\n'  { printf("Result = %d\n", $2); }
    ;

expr:
      expr '+' expr    { $$ = $1 + $3; }
    | expr '-' expr    { $$ = $1 - $3; }
    | expr '*' expr    { $$ = $1 * $3; }
    | expr '/' expr    { 
                           if($3 == 0) {
                              yyerror("Division by zero");
                              $$ = 0;
                           } else {
                              $$ = $1 / $3;
                           }
                        }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | '(' expr ')'      { $$ = $2; }
    | NUMBER
    ;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter expression:\n");
    yyparse();
    return 0;
}

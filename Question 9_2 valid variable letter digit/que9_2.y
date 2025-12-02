%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token VALIDVAR
%token INVALID

%%

start:
      VALIDVAR     { printf("Valid variable\n"); }
    | INVALID      { printf("Invalid variable\n"); }
    ;

%%

void yyerror(const char *s) {
    printf("Invalid variable\n");
}

int main() {
    printf("Enter variable: ");
    yyparse();
    return 0;
}

%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token A B INVALID

%%

start:
      S '\n'     { printf("Valid string\n"); }
    | '\n'        { yyerror("Empty input"); }
    ;

S:
      A S B
    | A B
    ;

%%

void yyerror(const char *s) {
    printf("Invalid string\n");
}

int main() {
    printf("Enter string: ");
    yyparse();
    return 0;
}

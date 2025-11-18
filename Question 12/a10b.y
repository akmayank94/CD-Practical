%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token A B INVALID

%%

start:
      S '\n'   { printf("Valid string\n"); }
    | '\n'     { printf("Invalid string\n"); }
    ;

S:
      MIN_A B
    ;

MIN_A:
      A A A A A A A A A A   /* first 10 a's required */
      MORE_A
    ;

MORE_A:
      MORE_A A
    | /* empty */
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

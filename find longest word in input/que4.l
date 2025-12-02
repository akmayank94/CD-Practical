%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char *longest = NULL;
int maxlen = 0;
%}

%%

[a-zA-Z]+ {
    if (yyleng > maxlen) {
        maxlen = yyleng;
        free(longest);
        longest = (char*)malloc(yyleng + 1);
        strncpy(longest, yytext, yyleng);
        longest[yyleng] = '\0';
    }
}

.   ;

%%

int yywrap() { return 1; }

int main() {
    printf("Enter a string: ");
    yylex();
    printf("\nLongest word: %s\n", longest);
    return 0;
}

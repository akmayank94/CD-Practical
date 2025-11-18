%{
#include<stdio.h>
int lines = 0;
int chars = 0;
%}

%%

\n { 
    lines++; 
    chars++; /* A newline is technically a character too */
}

. { 
    chars++; /* Match any character except newline */
}

%%

int main()
{
    /* 1. Open the file */
    yyin = fopen("input.txt", "r");

    /* 2. Check if file exists */
    if(!yyin) {
        printf("Error: input.txt not found!\n");
        return 1;
    }

    /* 3. Run Lexer */
    yylex();

    /* 4. Print Results */
    printf("Number of lines: %d\n", lines);
    printf("Number of characters: %d\n", chars);

    return 0;
}

int yywrap()
{
    return 1;
}

%{
#include<stdio.h>

int lines=0, words=0, spaces=0, characters=0;
%}

%%

\n { 
    lines++; 
    characters++; /* A newline is also a character */
}

[ \t]+ { 
    spaces += yyleng; 
    characters += yyleng; 
}

[^ \t\n]+ { 
    words++; 
    characters += yyleng; 
}

%%

int main()
{
    /* 1. Open the C file to read */
    yyin = fopen("input.c", "r");
    
    /* 2. Safety check */
    if(!yyin) {
        printf("Error: Could not find 'input.c'. Please create it first!\n");
        return 1;
    }

    /* 3. Run the analysis */
    yylex();

    /* 4. Print Results */
    printf("\n--- File Analysis ---\n");
    printf("Lines      : %d\n", lines);
    printf("Words      : %d\n", words);
    printf("Spaces     : %d\n", spaces);
    printf("Characters : %d\n", characters);

    return 0;
}

int yywrap()
{
    return 1;
}

%{
#include<stdio.h>
int i, j;
%}

%%

[a-zA-Z]+ {
    /* Loop from the full length down to 1 */
    for(i = yyleng; i > 0; i--) {
        /* Print characters from 0 to the current length 'i' */
        for(j = 0; j < i; j++) {
            printf("%c", yytext[j]);
        }
        printf("\n");
    }
}

.|\n ; /* Ignore other characters and newlines */

%%

int main()
{
    printf("Enter the string: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}

%{
#include<stdio.h>
int v=0, c=0;
%}

%%

[aeiouAEIOU] { v++; }
[a-zA-Z]     { c++; }   /* Catches letters that weren't caught by the vowel rule */
.|\n         ;          /* Ignore everything else (spaces, numbers, symbols) */

%%

int main()
{
    printf("Enter the input string:\n");
    yylex();
    printf("No. of vowels are %d \n", v);
    printf("No. of consonants are %d \n", c);
    return 0;
}

int yywrap()
{
    return 1;
}

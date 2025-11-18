%{
    #include<stdio.h>   
%}

%%
[a-z] {
    char ch = yytext[0];
    /* Check if the character is x, y, or z (wrap around) */
    if(ch == 'x' || ch == 'y' || ch == 'z')
        ch -= 23;
    else
        ch += 3;
    printf("%c", ch);
}

[A-Z] {
    char ch = yytext[0];
    /* Check if the character is X, Y, or Z */
    if(ch == 'X' || ch == 'Y' || ch == 'Z') 
        ch -= 23;
    else
        ch += 3;
    printf("%c", ch);
}
%%

int main(){
    printf("Enter the input string: ");
    yylex();
}

int yywrap(){
    return 1;
}

%{
#include<stdio.h>
int operands=0, operators=0, brackets=0, valid=1;
%}

%%

[a-zA-Z0-9]+ { 
    operands++; 
    /* Print to see what is detected (Optional) */
    /* printf("Operand: %s\n", yytext); */
}

[+\-*/] { 
    operators++; 
    /* printf("Operator: %s\n", yytext); */
}

"(" { brackets++; }
")" { brackets--; }

[ \t] ; /* Ignore spaces */
\n { return 0; } /* Stop on Enter key */

. { valid=0; } /* Any other character marks it invalid */

%%

int main()
{
    printf("Enter the arithmetic expression: ");
    yylex();

    /* Logic for Validity:
       1. 'valid' flag must still be 1 (no weird characters).
       2. brackets must be 0 (equal open and close).
       3. operands must be operators + 1 (e.g., a+b is 2 operands, 1 operator).
       4. brackets must not have gone negative (handled by order usually, but simple count is checked here).
    */
    
    if(valid == 1 && brackets == 0 && operands == operators + 1 && operators > 0) {
        printf("\nValid Arithmetic Expression\n");
    } else {
        printf("\nInvalid Arithmetic Expression\n");
    }

    return 0;
}

int yywrap()
{
    return 1;
}

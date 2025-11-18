%{
#include<stdio.h>

int negf=0, negi=0, posi=0, posf=0;
int identifiers=0, operators=0;
int singleLineCmt=0, multiLineCmt=0;
int keywords=0;
%}

/* --- DEFINITIONS --- */

DEC [0-9]*\.[0-9]+
INT [0-9]+
ID [_A-Za-z][A-Za-z0-9_]*

/* Comment Handling Definitions */
KNONSTAR [^*]*
PSTAR \*+
NONSTARFWD [^*/]

%%

    /* --- RULES SECTION --- */

\"(\\.|[^"\\])*\" ; /* Ignore String Literals */

"//".* { singleLineCmt++; }

"/*"{KNONSTAR}{PSTAR}({NONSTARFWD}{KNONSTAR}{PSTAR})*"/" { multiLineCmt++; }

int|float|char|double|void|if|else|while|for|do|return|break|continue|switch|case|default|struct|const|static {
    keywords++;
    printf("\nKEYWORD    : %s", yytext);
}

{ID} {
    identifiers++;
    printf("\nIDENTIFIER : %s", yytext);
}

-{DEC} { negf++; printf("\nNEG FLOAT  : %s", yytext); }
-{INT} { negi++; printf("\nNEG INT    : %s", yytext); }
{DEC}  { posf++; printf("\nPOS FLOAT  : %s", yytext); }
{INT}  { posi++; printf("\nPOS INT    : %s", yytext); }

[-+=*/%^] { 
    operators++; 
    printf("\nOPERATOR   : %s", yytext);
}

[ \t\n] ;
. ;

%%

int main() {
    yyin = fopen("input.cpp", "r");
    if(!yyin) {
        printf("Error: Could not find 'input.cpp'.\n");
        return 1;
    }

    printf("--- ANALYZING CODE ---\n");
    yylex();
    printf("\n\n--- STATISTICS ---\n");
    printf("Keywords            : %d\n", keywords);
    printf("Identifiers         : %d\n", identifiers);
    printf("Operators           : %d\n", operators);
    printf("Positive Integers   : %d\n", posi);
    printf("Negative Integers   : %d\n", negi);
    printf("Positive Floats     : %d\n", posf);
    printf("Negative Floats     : %d\n", negf);
    printf("Single Line Comments: %d\n", singleLineCmt);
    printf("Multi Line Comments : %d\n", multiLineCmt);

    return 0;
}

int yywrap() {
    return 1;
}

%{
#include "que10.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[+\-*/() ]  { return yytext[0]; }
\n          { return '\n'; }
\t          ;
.           ;

%%

int yywrap() { return 1; }

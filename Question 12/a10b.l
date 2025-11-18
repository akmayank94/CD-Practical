%{
#include "a10b.tab.h"
%}

%%

a      { return A; }
b      { return B; }
[ \t]  ;
\n     { return '\n'; }
.      { return INVALID; }

%%

int yywrap() { return 1; }

%{
#include "abnb.tab.h"
%}

%%

a       { return A; }
b       { return B; }
\n      { return '\n'; }
[ \t]   ;
.       { return INVALID; }

%%

int yywrap() { return 1; }

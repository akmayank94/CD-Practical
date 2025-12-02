%{
#include "que9_2.tab.h"
%}

%%

[a-z][0-9]      { return VALIDVAR; }
.*              { return INVALID; }

%%

int yywrap() { return 1; }

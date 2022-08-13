%{
#include <stdlib.h>

void yyerror(char *c);

#include "y.tab.h"
%}

%% 

[0-9]+ {
	yylval = atoi(yytext);
	return N;
	}

\n {return EOL;}

[+] {return OP;}

[[:space:]]+ ;

. { yyerror("Token desconocido\n"); }

%%

int yywrap(){
	return 1;
}

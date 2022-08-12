%{
#include <stdio.h>

void yyerror(char *c);
int yylex(void);

%}

%token N OP EOL
%left OP

%%

S: S E EOL {$$ = $2;  printf("El valor de la suma es %d\n", $2);}
 |
 ;

E:
 N {$$ = $1;}
 | E OP E {$$ = $1 + $3;}
;

%%
void yyerror(char *c){
	printf("error: %s\n", c);
}


int main(){
	yyparse();
	return 0;
} 

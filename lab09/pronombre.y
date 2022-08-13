%{
#include <stdio.h>

void yyerror(char *s);
int yylex(void);

%}


%token PRON
%token NL

%%

cadena: PRON NL {printf("Se imprime un texto \n");};
%%
int yyerror (char *s){
	printf("cadena invalida %s\n",s);
	return 1;
}
int main(int argc ,char ** argv) {
	printf("Ingrese la cadena\n");
	yyparse();
	return 0;
}
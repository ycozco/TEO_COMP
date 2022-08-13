%{
    #include <stdio.h>
    int yylex(void);
    void yyerror(char *S);
%}

%token NUMBER EVALUAR

%%

%%

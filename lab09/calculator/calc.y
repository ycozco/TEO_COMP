%{
    #include <stdio.h>
    int yylex(void);
    void yyerror(char *S);
%}

%token NUMBER EVALUAR

%%
    INICIO
        : EVALUAR '(' Expresion ')' ';'
        {
            printf("\nResultado=%d\n", $3);
            return 0;
        }
    ;
    Expresion
        : Expresion '+' Expresion
        {
            $$ = $1 + $3;
        }
        | Expresion '-' Expresion
        {
            $$ = $1 - $3;
        }
        | Expresion '*' Expresion
        {
            $$ = $1 * $3;
        }
        | Expresion '/' Expresion
        {
            $$ = $1 / $3;
        }
        | NUMBER
        {
            $$ = $1;
        }
    ;
        
%%

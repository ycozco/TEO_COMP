%{
    #include <stdio.h>
    #include <math.h>
    int yylex(void);
    void yyerror(char *S);
%}

%name parse
%token NUMBER EVALUAR

%start INICIO
%left '+' '-'
%left '*' '/'


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

int main()
{
    return (yyparse());
}
void yyerror(char *s)
{
    fprintf(stderr, "Error: %s\n", s);
}

int yywrap()
{
    return 1;
}
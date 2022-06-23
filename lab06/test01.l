%{
%}
DIGIT [0-9]
NUM {DIGIT}+.{DIGIT}+
%%
{DIGIT} { printf("numero entero\n");}
{NUM} {printf("numero float\n");}
%%
int yywrap(){}
int main(){
yylex();
return 0;
}
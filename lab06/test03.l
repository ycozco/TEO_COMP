%{
%}
DIGIT [0-9]
NUM {DIGIT}+(\.{DIGIT}+)?
%%
{DIGIT} { printf("numero E\n");}
{NUM} { printf("numero FFF\n");}
%%
int yywrap(){}
int main(){
yylex();
return 0;
}
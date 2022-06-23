%{
void evaluate();
%}
DIGIT [0-9]
NUM {DIGIT}+(\.{DIGIT}+)?
%%
{DIGIT} { printf("numero entero\n");}
{NUM} { printf("numero flotante\n");}
[+] { printf("es suma\n");}
[-] { printf("es resta\n");}
[*] { printf("es multi\n");}
[/] { printf("es divis\n");}

[\n] { evaluate(); }
%%
int yywrap(){}
int main(){
yylex();
return 0;
}
void evaluate(){
printf("nada que evaluar\n");
}
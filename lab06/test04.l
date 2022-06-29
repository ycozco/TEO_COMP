%{
int flag_operador1=0,flag_operador2=0;
void evaluate();
float operador1=0, operador2=0, respuesta=0;
%}
DIGIT [0-9]
NUM {DIGIT}+(\.{DIGIT}+)?
%%
{DIGIT} { printf("numero entero\n");}
{NUM} {
if (flag_operador1 == 0){
operador1 = atof(yytext);
flag_operador1 = 1;
printf("operador 1: %0.2f\n", operador1);
}
else if(flag_operador2 == -1){
operador2 = atof(yytext);
flag_operador2 = 1;
printf("operador 2: %0.2f\n", operador2);
}
if((flag_operador1 == 1) && (flag_operador2 == 1)) {
flag_operador1 = 0;
flag_operador2 = 0;
}
}
[-] {
printf("es resta\n");
flag_operador2 = -1;
}
[\n] {
evaluate();
if((flag_operador1 == 1) && (flag_operador2 == 1)) {
flag_operador1 = 0;
flag_operador2 = 0;
}
}
%%
int yywrap(){}
int main(){
yylex();
return 0;
}
void evaluate(){
respuesta = operador1 - operador2;
printf("respuesta es: %0.2f\n", respuesta);
}
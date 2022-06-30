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
    else if(flag_operador2 == -1 || flag_operador2 == 1 || flag_operador2 == 2 || flag_operador2 == 3 || flag_operador2 == 4 || flag_operador2 == 5 || flag_operador2 == 6 || flag_operador2 == 7 || flag_operador2 == 8 || flag_operador2 == 9){){ 
        operador2 = atof(yytext);
        flag_operador2 = 1;
        printf("operador 2: %0.2f\n", operador2);
    }
    else {
         printf("no se reconoce operacion\n");
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
[+] {
    flag_operador2 = 1;
    printf("es suma\n");
    }
[*] {
    printf("es multiplicacion\n");
    flag_operador2 = 2;
    }
[/] {
    printf("es division\n");
    flag_operador2 = 3;
    }
[%] {
    printf("es modulo\n");
    flag_operador2 = 4;
    }
[^] {
    printf("es potencia\n");
    flag_operador2 = 5;
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
    printf("%4.2f\n",operador1);
    switch(flag_operador2){
        case 1:
            respuesta = operador1 + operador2;
            printf("es suma %0.2f\n",operador1);
            break;
        case -1:
            respuesta = operador1 - operador2;
            printf("es  sustraccion \n");
            break;
        case 2:
            respuesta = operador1 * operador2;
            printf("es multiplicacion \n");
            break;
        case 3:
            if(operador2 == 0){
                printf("error division por cero\n");
            }
            else{
                respuesta = operador1 / operador2;
                printf("es division \n");
            }
            break;
        case 4:
            respuesta = operador1 % operador2;
            printf("es modulo \n");
            break;
        case 5:
            respuesta = pow(operador1,operador2);
            printf("es potencia \n");
            break;

    }
    flag_operador1 = 0;
    flag_operador2 = 0;
    operador1 = 0;
    operador2 = 0;

    printf("respuesta es: %0.2f\n", respuesta);
}
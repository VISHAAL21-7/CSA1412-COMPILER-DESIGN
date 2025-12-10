/* // #192424420 */

%{
#undef yywrap
#define yywrap() 1
int f1=0,f2=0;
char oper;
float op1=0,op2=0,ans=0;
void eval();
%}
DIGIT [0-9]
NUM {DIGIT}+(\.{DIGIT}+)?
%%
{NUM}      { if(!f1){ op1 = atof(yytext); f1=1; } else { op2 = atof(yytext); f2=1; } }
[+\-*/]    { oper = yytext[0]; }
\n         { if(f1 && f2){ switch(oper){ case '+': ans=op1+op2; break; case '-': ans=op1-op2; break; case '*': ans=op1*op2; break; case '/': if(op2!=0) ans=op1/op2; else { printf("Divide by zero\n"); } break; } printf("Result: %f\n", ans); f1=f2=0; op1=op2=0; } }
.|\t       { /* ignore */ }
%%
int main(){ yylex(); return 0; }
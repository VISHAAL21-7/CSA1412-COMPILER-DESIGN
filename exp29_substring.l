/* // #192424420 */

%{
int i;
%}
%%
[a-zA-Z]* {
    for(i=0;i<yyleng;i++){
        if(i+2<yyleng && yytext[i]=='a' && yytext[i+1]=='b' && yytext[i+2]=='c'){
            yytext[i]='A'; yytext[i+1]='B'; yytext[i+2]='C';
        }
    }
    printf("%s", yytext);
}
[\t]* { return 1; }
.*     { ECHO; }
\n     { printf("%s", yytext); }
%%
int main(void){ yylex(); return 0; }
int yywrap(void){ return 1; }
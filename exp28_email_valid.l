/* // #192424420 */

%{
int flag=0;
%}
%%
[a-z0-9._%+-]+@[a-z0-9.-]+\.(com|in|org|edu)  { flag=1; printf("Accepted: %s\n", yytext); }
.|\n                                         { /* ignore */ }
%%
int main(void){
    yylex();
    if(flag) printf("Accepted\n"); else printf("Not Accepted\n");
    return 0;
}
int yywrap(void){ return 1; }
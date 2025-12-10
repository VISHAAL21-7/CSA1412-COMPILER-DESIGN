/* // #192424420 */

%{
%}
%%
[0-9]+   { printf("\nValid digit \n"); }
.*       { printf("\nInvalid digit\n"); }
%%
int yywrap(){ return 1; }
int main(){ yylex(); return 0; }
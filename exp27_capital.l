/* // #192424420 */

%{
%}
%%
[A-Z]+[ \t\n]   { printf("%s is a capital word\n", yytext); }
.|\n            { /* ignore */ }
%%
int yywrap(void){ return 1; }
int main(void){ yylex(); return 0; }
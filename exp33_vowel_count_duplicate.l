/* // #192424420 */

%{
int vcount=0;
%}
%%
([AEIOUaeiou])   { vcount++; printf("%s\n", yytext); }
.|\n             { /* ignore */ }
%%
int yywrap(void){ return 1; }
int main(void){ yylex(); printf("Vowels=%d\n", vcount); return 0; }
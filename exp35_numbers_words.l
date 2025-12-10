/* // #192424420 */

%{
int numcnt=0, wordcnt=0;
%}
%%
[0-9]+    { numcnt++; printf("NUMBER: %s\n", yytext); }
[a-zA-Z]+ { wordcnt++; printf("WORD: %s\n", yytext); }
.|\n      { /* ignore */ }
%%
int yywrap(void){ return 1; }
int main(void){ yylex(); printf("Numbers=%d Words=%d\n", numcnt, wordcnt); return 0; }
/* // #192424420 */

%{
char *keywords[] = {"int","return","if","else","while","for","void","char", NULL};
%}
%%
[a-zA-Z_][a-zA-Z0-9_]*  { 
    int i=0; while(keywords[i]){ if(strcmp(yytext, keywords[i])==0){ printf("KEYWORD: %s\n", yytext); break; } i++; }
    if(!keywords[i]) printf("IDENTIFIER: %s\n", yytext);
}
[0-9]+                  { printf("NUMBER: %s\n", yytext); }
.|\n                    { /* ignore */ }
%%
int yywrap(void){ return 1; }
int main(void){ yylex(); return 0; }
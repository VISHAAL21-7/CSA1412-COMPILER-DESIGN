/* // #192424420 */

%{
int macros=0, headers=0;
%}
%%
^[ \t]*#[ \t]*define[ \t]+[A-Za-z_][A-Za-z0-9_]*    { macros++; printf("Macro: %s\n", yytext); }
^[ \t]*#[ \t]*include[ \t]*<[^\n>]+>                 { headers++; printf("Header: %s\n", yytext); }
.|\n                                               { /* ignore other */ }
%%
int yywrap(void){ return 1; }
int main(int argc, char *argv[]){
    if(argc<2){ printf("Usage: %s <file>\n", argv[0]); return 1; }
    yyin = fopen(argv[1],"r");
    if(!yyin){ perror("fopen"); return 1; }
    yylex();
    printf("Macros: %d, Headers: %d\n", macros, headers);
    fclose(yyin);
    return 0;
}
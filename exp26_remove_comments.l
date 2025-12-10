/* // #192424420 */

%{
int com=0;
%}
%s COMMENT
%%
"/*"        { BEGIN(COMMENT); }
<COMMENT>"*/" { BEGIN(INITIAL); com++; }
<COMMENT>\n  { com++; }
<COMMENT>.    { /* skip */ }
\/\/[^\n]*    { com++; /* single-line comment */ }
.|\n         { ECHO; }
%%
int yywrap(void){ return 1; }
int main(int argc, char *argv[]){
    if(argc<2){ printf("Usage: %s <file>\n", argv[0]); return 1; }
    yyin = fopen(argv[1],"r"); if(!yyin){ perror("fopen"); return 1; }
    yylex();
    printf("\nNumber of comments removed: %d\n", com);
    fclose(yyin);
    return 0;
}
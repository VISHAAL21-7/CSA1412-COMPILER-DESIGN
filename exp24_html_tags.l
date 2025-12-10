/* // #192424420 */

%{
int tags=0;
%}
%%
"<"[^>]*">"    { tags++; printf("%s\n", yytext); }
.|\n           { /* ignore */ }
%%
int yywrap(){ return 1; }
int main(void){
    FILE *f; char file[256];
    printf("Enter File Name : ");
    if(scanf("%255s", file)!=1) return 1;
    f = fopen(file,"r"); if(!f){ perror("fopen"); return 1; }
    yyin = f;
    yylex();
    printf("\nNumber of html tags: %d\n", tags);
    fclose(yyin);
    return 0;
}
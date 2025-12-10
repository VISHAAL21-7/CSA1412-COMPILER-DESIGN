/* // #192424420 */

%{
int cons=0;
%}
digit [0-9]
%%
{digit}+    { cons++; printf("%s is a constant\n", yytext); }
.|\n        { /* ignore */ }
%%
int yywrap(void){ return 1; }
int main(void){
    FILE *f;
    char file[256];
    printf("Enter File Name : ");
    if(scanf("%255s", file)!=1) return 1;
    f = fopen(file,"r");
    if(!f){ perror("fopen"); return 1; }
    yyin = f;
    yylex();
    printf("Number of Constants : %d\n", cons);
    fclose(yyin);
    return 0;
}
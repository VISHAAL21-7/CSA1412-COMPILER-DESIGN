/* // #192424420 */

%{
%}
%%
((http|ftp)s?:\/\/)?[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}([\/\?].*)?   { printf("\nURL Valid\n"); }
.+                                                           { printf("\nURL Invalid\n"); }
%%
int yywrap(){ return 1; }
int main(){ printf("Enter URL : "); yylex(); return 0; }
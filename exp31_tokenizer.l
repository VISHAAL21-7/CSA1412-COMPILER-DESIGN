/* // #192424420 */

%{
int count_id=0, count_num=0;
%}
digit [0-9]
letter [A-Za-z]
%%
{letter}({letter}|{digit})*   { printf("IDENTIFIER: %s\n", yytext); count_id++; }
{digit}+                     { printf("NUMBER: %s\n", yytext); count_num++; }
"\""([^"\n]|\\")*"\""        { /* string literal */ }
[ \t\n]+                     { /* skip */ }
.                            { printf("SYMBOL: %s\n", yytext); }
%%
int yywrap(void){ return 1; }
int main(void){ yylex(); printf("IDs=%d Numbers=%d\n", count_id, count_num); return 0; }
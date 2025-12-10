/* // #192424420 */

%{
%}
%%
((0[1-9])|([1-2][0-9])|(3[0-1]))\/((0[1-9])|(1[0-2]))\/(19[0-9]{2}|20[0-9]{2})   { printf("Valid DoB\n"); }
.*                                                                              { printf("Invalid DoB\n"); }
%%
int yywrap(){ return 1; }
int main(){ yylex(); return 0; }
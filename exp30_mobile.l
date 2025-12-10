/* // #192424420 */

%{
%}
%%
[1-9][0-9]{9}   { printf("\nMobile Number Valid\n"); }
.+              { printf("\nMobile Number Invalid\n"); }
%%
int main(void){ printf("Enter Mobile Number : "); yylex(); return 0; }
int yywrap(void){ return 1; }
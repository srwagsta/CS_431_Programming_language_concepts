
/* description: Parses and executes mathematical expressions. */

/* lexical grammar */
%lex
%%

\s+                   /* skip whitespace */
[0-9]+("."[0-9]+)?\b  return 'NUMBER'
"*"                   return '*'
"/"                   return '/'
"-"                   return '-'
"+"                   return '+'
"^"                   return '^'
"!"                   return '!'
"%"                   return '%'
"("                   return '('
")"                   return ')'
"PI"                  return 'PI'
"E"                   return 'E'
<<EOF>>               return 'EOF'
.                     return 'INVALID'

/lex

%start expressions

%% /* language grammar */

expressions
    : e EOF
        { typeof console !== 'undefined' ? console.log($1) : print($1);
          return $1; }
    ;

e
    : e '+' MulExp
        {$$ = '(' + $1 + ' + ' + $3 + ')';}
    | e '-' MulExp
        {$$ = '(' + $1 + ' - ' + $3 + ')';}
    | MulExp
    ;
MulExp
    : MulExp '*' PowExp
        {$$ = '(' + $1 + ' * ' + $3 + ')';}
    | MulExp '/' PowExp
        {$$ = '(' + $1 + ' / ' + $3 + ')';}
    | PowExp
    ;
PowExp
    : UnaryExp '^' PowExp
        {$$ = '(' + $1 + ' ^ ' + $3 + ')';}
    | UnaryExp
    ;
UnaryExp
    : NegExp '!'
        {$$ = '(' + $1 + '!' + ')';}
    | NegExp '%'
        {$$ = '(' + $1 + '%' + ')';}
    | NegExp
    ;
NegExp
    : '-' RootExp %prec UMINUS
        {$$ = '(-' + $2 + ')';}
    | RootExp
    ;
RootExp
    : '(' e ')'
        {$$ = '(' + $2 + ')';}
    | NUMBER
        {$$ = Number(yytext);}
    | E
        {$$ = 'E';}
    | PI
        {$$ = 'PI';}
    ;


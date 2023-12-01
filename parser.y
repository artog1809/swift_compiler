%token PRIVATE
%token PUBLIC
%token CLASS
%token ENUM
%token STATIC
%token RETURN

%token REPEAT
%token REPEAT
%token IF
%token ELSE
%token FOR
%token IN
%token WHILE
%token BREAK
%token CONTINUE
%token DEFAULT

%token SWITCH
%token CASE
%token TRY
%token CATCH
%token THROW

%token VAR
%token LET
%token FUNC

%token INT
%token BOOL
%token STRING
%token FLOAT
%token DOUBLE

%token INT_LITERAL
%token TRUE_LITERAL FALSE_LITERAL
%token STRING_LITERAL
%token FLOAT_LITERAL
%token DOUBLE_LITERAL

%token ID
%nonassoc ENDL

%nonassoc INCREMENT DECREMENT
%nonassoc '{' ':' '}'
%right '=' PLUS_ASSIGNMENT MINUS_ASSIGNMENT MUL_ASSIGNMENT DIV_ASSIGNMENT MOD_ASSIGNMENT
%left '[' ']'
%left OPERATOR_RETURN_VALUE
%left OR
%left AND
%left EQUAL NOT_EQUAL
%left '>' '<' GREATER_EQUAL LESS_EQUAL IS AS
%left IN
%left RANGE
%left '+' '-'
%left '*' '/' '%'
%left NOT UMINUS UPLUS
%right PREF_INCREMENT PREF_DECREMENT '!'
%left POST_INCREMENT POST_DECREMENT '.'
%nonassoc '(' ')'

%start program

%%
program: programElem
    | program programElem
    ;

programElem: classDeclaration
    | functionDeclaration
    ;

endl: ENDL
    | endl ENDL
    ;

endlOpt: /* empty */
    | endl
    ;

exprList: expr
    | exprList endlOpt ',' endlOpt expr
    ;

exprtListOpt: /* empty */
    | exprList
    ;

expr: expr POST_DECREMENT
    | PREF_DECREMENT endlOpt expr
    | expr POST_INCREMENT
    | PREF_INCREMENT endlOpt expr 
    | ID AS endlOpt type
    | '-' endlOpt expr %prec UMINUS
    | '+' endlOpt expr %prec UPLUS
    | INT_LITERAL
    | FLOAT_LITERAL
    | DOUBLE_LITERAL
    | STRING_LITERAL
    | TRUE_LITERAL
    | FALSE_LITERAL
    | ID
    | '(' endlOpt expr endlOpt ')'
    | ID endlOpt '(' endlOpt exprtListOpt ')'
    | expr '+' endlOpt expr
    | expr '-' endlOpt expr 
    | expr '*' endlOpt expr 
    | expr '/' endlOpt expr
    | expr '%' endlOpt expr
    | expr '<' endlOpt expr
    | expr '>' endlOpt expr 
    | expr LESS_EQUAL endlOpt expr
    | expr GREATER_EQUAL endlOpt expr 
    | expr EQUAL endlOpt expr
    | expr NOT_EQUAL endlOpt expr
    | expr '=' endlOpt expr
    | expr PLUS_ASSIGNMENT endlOpt expr
    | expr MINUS_ASSIGNMENT endlOpt expr
    | expr MUL_ASSIGNMENT endlOpt expr
    | expr DIV_ASSIGNMENT endlOpt expr
    | expr MOD_ASSIGNMENT endlOpt expr
    | NOT endlOpt expr
    | expr AND endlOpt expr
    | expr OR endlOpt expr
    | expr '?' endlOpt expr endlOpt ':' endlOpt expr
    | expr '[' endlOpt expr endlOpt ']'
    | expr '.' endlOpt ID endlOpt '(' endlOpt expr exprtListOpt ')'
    | expr '.' endlOpt ID
    ;

stmtListOpt: /* empty */
| stmtList endlOpt
;

blockStatement: '{' endlOpt stmtListOpt '}'
;

ifStmt: IF endlOpt '(' endlOpt expr endlOpt ')' endlOpt blockStatement
| IF endlOpt expr endlOpt blockStatement
| IF endlOpt '(' endlOpt expr endlOpt ')' endlOpt blockStatement endlOpt ELSE endlOpt blockStatement
| IF endlOpt expr endlOpt blockStatement endlOpt ELSE endlOpt blockStatement
;

whileStmt: WHILE endlOpt '(' endlOpt expr endlOpt ')' endlOpt blockStatement
| WHILE endlOpt expr endlOpt blockStatement
;

repeatWhileStmt: REPEAT endlOpt '(' endlOpt blockStatement endlOpt ')' endlOpt WHILE endlOpt '(' endlOpt expr endlOpt ')'
| REPEAT endlOpt '(' endlOpt blockStatement endlOpt ')' endlOpt WHILE endlOpt expr 
| REPEAT endlOpt blockStatement endlOpt WHILE endlOpt '(' endlOpt expr endlOpt ')'
| REPEAT endlOpt blockStatement endlOpt WHILE endlOpt expr 
;

forInStmt: FOR endlOpt expr endlOpt IN endlOpt expr endlOpt blockStatement
| FOR endlOpt '(' endlOpt expr endlOpt ')' endlOpt '(' endlOpt expr endlOpt ')' endlOpt blockStatement
| FOR endlOpt '(' endlOpt expr endlOpt ')' endlOpt expr endlOpt blockStatement
| FOR endlOpt expr endlOpt '(' endlOpt expr endlOpt ')' endlOpt blockStatement
;

switchStmt: SWITCH endlOpt '(' endlOpt expr endlOpt ')' endlOpt '{' endlOpt caseList '}'
    ;

caseList: caseStmt
        | caseList caseStmt
        ;

caseStmt: CASE endlOpt expr endlOpt ':' endlOpt stmtListOpt breakOpt
        | DEFAULT endlOpt ':' endlOpt stmtListOpt breakOpt
        ;

breakOpt: /* empty */
        | BREAK endlOpt
        ;

returnStatement: RETURN expr endlOpt
    ;

type: INT     | BOOL
    | STRING
    | FLOAT
    | DOUBLE
    ;
%%
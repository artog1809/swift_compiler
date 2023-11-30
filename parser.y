

%token PRIVATE
%token PUBLIC
%token CLASS
%token ENUM
%token STATIC
%token RETURN

%token DO
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
%token TRUE FALSE
%token STRING
%token FLOAT
%token DOUBLE

%token INT_LITERAL
%token TRUE_LITERAL FALSE_LITERAL
%token STRING_LITERAL
%token FLOAT_LITERAL
%token DOUBLE_LITERAL


%token ID


%nonassoc INCREMENT DECREMENT
%nonassoc '{' ':'
%right '=' PLUS_ASSIGNMENT MINUS_ASSIGNMENT MUL_ASSIGNMENT DIV_ASSIGNMENT MOD_ASSIGNMENT
%left '[' ']'
%left OR
%left AND
%left EQUAL NOT_EQUAL
%left '>' '<' GREATER_EQUAL LESS_EQUAL 
%left IN
%left RANGE
%left '+' '-'
%left '*' '/' '%'
%left UMINUS UPLUS
%right PREF_INCREMENT PREF_DECREMENT '!'
%left POST_INCREMENT POST_DECREMENT '.'
%nonassoc '(' ')'

%start program

%%

%%









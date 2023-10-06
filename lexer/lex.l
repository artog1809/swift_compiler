%option noyywrap
%option never-interactive

%x MULTILINE_COMMENT
%x STRING
%x CHAR

DIGIT [0-9]
LETTER [A-Za-z] // Доюавляем нижнее подчеркивание
HEX_DIGIT [0-9A-Fa-f]
OCT_DIGIT [0-7]
BIN_DIGIT [01]

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <ctype.h>
%}

%{
    char str[1024]; // Сделать лоакльной переменной
    int lineNumber = 1; // Сделать локальной переменной
    void convertCharacterCodeToString(char charCode[], int pos, char *str);
    void removeChar(const char * str, char * dest, char deletedChar);
%}

%%
\n { lineNumber++; }
[ \t]+ { }

associatedtype {printf("(%s) - ASSOCIATEDTYPE_KEY_WORD\n", yytext);}
class {printf("(%s) - CLASS_KEY_WORD\n", yytext);}
deinit {printf("(%s) - DEINIT_KEY_WORD\n", yytext);}
enum {printf("(%s) - ENUM_KEY_WORD\n", yytext);}
extension {printf("(%s) - EXTENSION_KEY_WORD\n", yytext);}
fileprivate {printf("(%s) - FILEPRIVATE_KEY_WORD\n", yytext);}
import {printf("(%s) - IMPORT_KEY_WORD\n", yytext);}
init {printf("(%s) - INIT_KEY_WORD\n", yytext);}
inout {printf("(%s) - INOUT_KEY_WORD\n", yytext);}
internal {printf("(%s) - INTERNAL_KEY_WORD\n", yytext);}
let {printf("(%s) - LET_KEY_WORD\n", yytext);}
open {printf("(%s) - OPEN_KEY_WORD\n", yytext);}
operator {printf("(%s) - OPERATOR_KEY_WORD\n", yytext);}
private {printf("(%s) - PRIVATE_KEY_WORD\n", yytext);}
precedencegroup {printf("(%s) - PRECEDENCEGROUP_KEY_WORD\n", yytext);}
protocol {printf("(%s) - PROTOCOL_KEY_WORD\n", yytext);}
public {printf("(%s) - PUBLIC_KEY_WORD\n", yytext);}
rethrows {printf("(%s) - RETHROWS_KEY_WORD\n", yytext);}
static {printf("(%s) - STATIC_KEY_WORD\n", yytext);}
struct {printf("(%s) - STRUCT_KEY_WORD\n", yytext);}
subscript {printf("(%s) - SUBSCRIPT_KEY_WORD\n", yytext);}
typealias {printf("(%s) - TYPEALIAS_KEY_WORD\n", yytext);}
var {printf("(%s) - VAR_KEY_WORD\n", yytext);}


break {printf("(%s) - BREAK_KEY_WORD\n", yytext);}
case {printf("(%s) - CASE_KEY_WORD\n", yytext);}
catch {printf("(%s) - CATCH_KEY_WORD\n", yytext);}
continue {printf("(%s) - CONTINUE_KEY_WORD\n", yytext);}
default {printf("(%s) - DEFAULT_KEY_WORD\n", yytext);}
defer {printf("(%s) - DEFER_KEY_WORD\n", yytext);}
do {printf("(%s) - DO_KEY_WORD\n", yytext);}
else {printf("(%s) - ELSE_KEY_WORD\n", yytext);}
fallthrough {printf("(%s) - FALLTHROUGH_KEY_WORD\n", yytext);}
for {printf("(%s) - FOR_KEY_WORD\n", yytext);}
guard {printf("(%s) - GUARD_KEY_WORD\n", yytext);}
if {printf("(%s) - IF_KEY_WORD\n", yytext);}
in {printf("(%s) - IN_KEY_WORD\n", yytext);}
repeat {printf("(%s) - REPEAT_KEY_WORD\n", yytext);}
return {printf("(%s) - RETURN_KEY_WORD\n", yytext);}
throw {printf("(%s) - THROW_KEY_WORD\n", yytext);}
switch {printf("(%s) - SWITCH_KEY_WORD\n", yytext);}
where {printf("(%s) - WHERE_KEY_WORD\n", yytext);}
while {printf("(%s) - WHILE_KEY_WORD\n", yytext);}

Any {printf("(%s) - ANY_KEY_WORD\n", yytext);}
as {printf("(%s) - AS_KEY_WORD\n", yytext);}
false {printf("(%s) - FALSE_KEY_WORD\n", yytext);}
is {printf("(%s) - IS_KEY_WORD\n", yytext);}
nil {printf("(%s) - NIL_KEY_WORD\n", yytext);}
self {printf("(%s) - SELF_KEY_WORD\n", yytext);}
Self {printf("(%s) - SELF_KEY_WORD\n", yytext);}
super {printf("(%s) - SUPER_KEY_WORD\n", yytext);}
throws {printf("(%s) - THROWS_KEY_WORD\n", yytext);}
true {printf("(%s) - TRUE_KEY_WORD\n", yytext);}
try {printf("(%s) - TRY_KEY_WORD\n", yytext);}


associativity {printf("(%s) - ASSOCIATIVITY_KEY_WORD\n", yytext);}
convenience {printf("(%s) - CONVENIENCE_KEY_WORD\n", yytext);}
didSet {printf("(%s) - DIDSET_KEY_WORD\n", yytext);}
dynamic {printf("(%s) - DYNAMIC_KEY_WORD\n", yytext);}
final {printf("(%s) - FINAL_KEY_WORD\n", yytext);}
get {printf("(%s) - GET_KEY_WORD\n", yytext);}
indirect {printf("(%s) - INDIRECT_KEY_WORD\n", yytext);}
infix {printf("(%s) - INFIX_KEY_WORD\n", yytext);}
lazy {printf("(%s) - LAZY_KEY_WORD\n", yytext);}
left {printf("(%s) - LEFT_KEY_WORD\n", yytext);}
mutating {printf("(%s) - MUTATING_KEY_WORD\n", yytext);}
none {printf("(%s) - NONE_KEY_WORD\n", yytext);}
nonmutating {printf("(%s) - NONMUTATING_KEY_WORD\n", yytext);}
optional {printf("(%s) - OPTIONAL_KEY_WORD\n", yytext);}
override {printf("(%s) - OVERRIDE_KEY_WORD\n", yytext);}
postfix {printf("(%s) - POSTFIX_KEY_WORD\n", yytext);}
precedence {printf("(%s) - PRECEDENCE_KEY_WORD\n", yytext);}
prefix {printf("(%s) - PREFIX_KEY_WORD\n", yytext);}
Protocol {printf("(%s) - PROTOCOL_KEY_WORD\n", yytext);}
required {printf("(%s) - REQUIRED_KEY_WORD\n", yytext);}
right {printf("(%s) - RIGHT_KEY_WORD\n", yytext);}
set {printf("(%s) - SET_KEY_WORD\n", yytext);}
some {printf("(%s) - SOME_KEY_WORD\n", yytext);}
Type {printf("(%s) - TYPE_KEY_WORD\n", yytext);}
unowned {printf("(%s) - UNOWNED_KEY_WORD\n", yytext);}
weak {printf("(%s) - WEAK_KEY_WORD\n", yytext);}
willSet {printf("(%s) - WILLSET_KEY_WORD\n", yytext);}


\#available {printf("(%s) - #AVAILABLE_KEY_WORD\n", yytext);}
\#colorLiteral {printf("(%s) - #COLORLITERAL_KEY_WORD\n", yytext);}
\#column {printf("(%s) - #COLUMN_KEY_WORD\n", yytext);}
\#dsohandle {printf("(%s) - #DSOHANDLE_KEY_WORD\n", yytext);}
\#elseif {printf("(%s) - #ELSEIF_WORD\n", yytext);}
\#else {printf("(%s) - #ELSE_WORD\n", yytext);}
\#endif {printf("(%s) - #ENDIF_KEY_WORD\n", yytext);}
\#error {printf("(%s) - #ERROR_KEY_WORD\n", yytext);}
\#fileID {printf("(%s) - #FILEID_KEY_WORD\n", yytext);}
\#fileLiteral {printf("(%s) - #FILELITERAL_KEY_WORD\n", yytext);}
\#filePath {printf("(%s) - #FILEPATH_KEY_WORD\n", yytext);}
\#file {printf("(%s) - #FILE_KEY_WORD\n", yytext);}
\#function {printf("(%s) - #FUNCTION_KEY_WORD\n", yytext);}
\#if {printf("(%s) - #IF_WORD\n", yytext);}
\#imageLiteral {printf("(%s) - #IMAGELITERAL_KEY_WORD\n", yytext);}
\#keyPath {printf("(%s) - #KEYPATH_KEY_WORD\n", yytext);}
\#line {printf("(%s) - #LINE_KEY_WORD\n", yytext);}
\#selector {printf("(%s) - #SELECTOR_KEY_WORD\n", yytext);}
\#sourceLocation {printf("(%s) - #SOURCELOCATION_KEY_WORD\n", yytext);}
\#warning {printf("(%s) - #WARNING_KEY_WORD\n", yytext);}


"+" { printf("Found OPERATOR_PLUS: %s\n", yytext); }
"-" { printf("Found OPERATOR_MINUS: %s\n", yytext); }
"/" { printf("Found OPERATOR_DIVISION: %s\n", yytext); }
"*" { printf("Found OPERATOR_MULTIPLICATION: %s\n", yytext); }
"%" { printf("Found OPERATOR_MODULUS: %s\n", yytext); }


"=" { printf("Found OPERATOR_ASSIGNMENT: %s\n", yytext); }
"+=" { printf("Found OPERATOR_PLUS_ASSIGNMENT: %s\n", yytext); }
"-=" { printf("Found OPERATOR_MINUS_ASSIGNMENT: %s\n", yytext); }
"/=" { printf("Found OPERATOR_DIVIDE_ASSIGNMENT: %s\n", yytext); }
"*=" { printf("Found OPERATOR_MUTIPLY_ASSIGNMENT: %s\n", yytext); }
"%=" { printf("Found OPERATOR_MODULUS_ASSIGNMENT: %s\n", yytext); }


"<<" { printf("Found OPERATOR_LEFT_SHIFT: %s\n", yytext); }
">>" { printf("Found OPERATOR_RIGHT_SHIFT: %s\n", yytext); }
"&" { printf("Found OPERATOR_BINARY_AND: %s\n", yytext); }
"|" { printf("Found OPERATOR_BINARY_OR: %s\n", yytext); }
"^" { printf("Found OPERATOR_BINARY_XOR: %s\n", yytext); }
"~" { printf("Found OPERATOR_TILDE: %s\n", yytext); }


"<" { printf("Found OPERATOR_LESS: %s\n", yytext); }
">" { printf("Found OPERATOR_GREATER: %s\n", yytext); }
"==" { printf("Found OPERATOR_EQUAL: %s\n", yytext); }
"<=" { printf("Found OPERATOR_LESS_OR_EQUAL: %s\n", yytext); }
">=" { printf("Found OPERATOR_GREATER_OR_EQUAL: %s\n", yytext); }
"!=" { printf("Found OPERATOR_NOT_EQUAL: %s\n", yytext); }


"&&" { printf("Found OPERATOR_LOGICAL_AND: %s\n", yytext); }
"||" { printf("Found OPERATOR_LOGICAL_OR: %s\n", yytext); }
"!" { printf("Found OPERATOR_LOGICAL_NOT: %s\n", yytext); }


"??" { printf("Found OPERATOR_NIL_COALESCING: %s\n", yytext); }
"++" { printf("Found OPERATOR_INCREMENT: %s\n", yytext); }
"--" { printf("Found OPERATOR_DECREMENT: %s\n", yytext); }


"." { printf("Found OPERATOR_POINT: %s\n", yytext); }
"..." { printf("Found OPERATOR_CLOSED_RANGE: %s\n", yytext); }
"..<" { printf("Found OPERATOR_HALF_OPEN_RANGE: %s\n", yytext); }
"[[A-Za-z0-9]...[A-Za-z0-9]?]" { printf("Found OPERATOR_ONE_SIDED_RANGE: %s\n", yytext); } // Зачем неужны ковычки в регулярках, во флекс, именно тут убрать

":" { printf("Found OPERATOR_COLON: %s\n", yyt); }

"(" { printf("Found LEFT_ROUND_BRACKET: %s\n", yytext); }
")" { printf("Found RIGHT_ROUND_BRACKET: %s\n", yytext); }
"[" { printf("Found LEFT_SQUARE_BRACKET: %s\n", yytext); }
"]" { printf("Found RIGHT_SQUARE_BRACKET: %s\n", yytext); }
"{" { printf("Found LEFT_FIGURE_BRACKET: %s\n", yytext); }
"}" { printf("Found RIGHT_FIGURE_BRACKET: %s\n", yytext); }

Bool { printf("Found TYPE_BOOL: %s\n", yytext); }
String { printf("Found TYPE_STRING: %s\n", yytext); }
Character { printf("Found TYPE_CHARACTER: %s\n", yytext); }
Int8 { printf("Found TYPE_INT8: %s\n", yytext); }
Int16 { printf("Found TYPE_INT16: %s\n", yytext); }
Int32 { printf("Found TYPE_INT32: %s\n", yytext); }
Int64 { printf("Found TYPE_INT64: %s\n", yytext); }
Int { printf("Found TYPE_INT: %s\n", yytext); }
UInt8 { printf("Found TYPE_UINT8: %s\n", yytext); }
UInt16 { printf("Found TYPE_UINT16: %s\n", yytext); }
UInt32 { printf("Found TYPE_UINT32: %s\n", yytext); }
UInt64 { printf("Found TYPE_UINT64: %s\n", yytext); }
UInt { printf("Found TYPE_UINT: %s\n", yytext); }
Float { printf("Found TYPE_FLOAT: %s\n", yytext); }
Float80 { printf("Found TYPE_FLOAT80: %s\n", yytext); }
Double { printf("Found TYPE_DOUBLE: %s\n", yytext); }

"/*" {strcpy(str, ""); BEGIN(MULTILINE_COMMENT);}
<MULTILINE_COMMENT>[^*\n]* { strcat(str, yytext); }
<MULTILINE_COMMENT>\n { lineNumber++; }
<MULTILINE_COMMENT>"*"+[^/]* { strcat(str, yytext); }
<MULTILINE_COMMENT>"*"+"/" { printf("Found MULTILINE_COMMENT: %s\n", str); BEGIN(INITIAL); }
<MULTILINE_COMMENT><<EOF>> { printf("MULTILINE_COMMENT ERROR in line %d: comment are not closed\n"); BEGIN(INITIAL); }

\/\/[^\n]* { printf("Found ONELINE_COMMENT: %s\n", yytext); } // [^\n] поменять на точку (проверить)?

\" { strcpy(str, ""); BEGIN(STRING); }
<STRING>[^\\\"\n]+ { strcat(str, yytext); }
<STRING>\n { lineNumber++; }
<STRING>\\n { strcat(str, "\n"); }
<STRING>\\b { strcat(str, "\b"); }
<STRING>\\0 { strcat(str, "\0"); } // Разобраться с нулевым символом! (убрать тут)
<STRING>\\\\ { strcat(str, "\\"); }
<STRING>\\f { strcat(str, "\f"); }
<STRING>\\r { strcat(str, "\r"); }
<STRING>\\t { strcat(str, "\t"); }
<STRING>\\v { strcat(str, "\v"); }
<STRING>\\\' { strcat(str, "\'"); }
<STRING>\\\" { strcat(str, "\""); }
<STRING>\\u\{(({HEX_DIGIT}){5})\} { // Проверить
    char *a;
    int x = strtol(yytext + 3, &a, 16);
    if (x <= 127) {
        char buf[2];
        buf[0] = x;
        buf[1] = 0;
        strcat(str, buf);
    } else {
        printf("Eror in %d: unicode not supported\n", lineNumber);
    }
 } 
<STRING>\" { printf("STRING: %s\n", str); BEGIN(INITIAL); }
<STRING>\\[^(] { printf("Error in %d: unterminated string literal\n", lineNumber); BEGIN(INITIAL); } // Хорошо подумать над реализацией интерполяцией в строке (подменна переменной)! Нужно использовать какое-то подвыражение)))
<STRING><<EOF>> { printf("Error in %d:  no closing quotation mark\n", lineNumber); BEGIN(INITIAL); }

[0-9][_0-9]* {
	removeChar(yytext, str, '_');
	printf("DECIMAL_NUMBER: %d\n", atoi(str));
}

0b[_0-1]+ {

    if(strlen(yytext) > 2)
    {
		removeChar(yytext, str, '_');
        printf("BIN_NUMBER: %d\n", strtol(str + 2, NULL, 2));
    }
    else
    {
       printf("Error: incorrect format for DECIMAL_NUMBER\n");
    }
}

0o[_0-7]+ {

    if(strlen(yytext) > 2)
    {
		removeChar(yytext, str, '_');
        printf("OCTAL_NUMBER: %d\n", strtol(str + 2, NULL, 8));
    }
    else
    {
        printf("Error: incorrect format for OCTAL_NUMBER\n");
    }
}

0x[_0-9a-fA-F]+ {

    if(strlen(yytext) > 2)
    {
		removeChar(yytext, str, '_');
        printf("HEXADEMICAL_NUMBER: %d\n", strtol(str + 2, NULL, 16));
    }
    else
    {
        printf("Error: incorrect format for HEXADEMICAL_NUMBER\n");
    }
}

[0-9]\.[_0-9]*[eE]?[+-]?[_0-9]* { // Добавить плюс к первой части числа и исправить звездочку, а вообще перепроверить регулярку (поиграться со Swift)
	removeChar(yytext, str, '_');
    printf("DECIMAL_FLOATINGPOINT_NUMBER: %f\n", atof(str));
}

0x[_0-9a-fA-F]+\.[_0-9a-fA-F]*p?[_0-9]* { // Смотри выше 
	removeChar(yytext, str, '_');
    printf("HEXADECIMAL_FLOATINGPOINT_NUMBER: %f\n", atof(str));
}

{LETTER}({LETTER}|{DIGIT}|_)* { printf("Found IDENTIFIER: %s\n", yytext); }
%%

void convertCharacterCodeToString(char charCode[], int pos, char *str)
{
    str[0] = strtol(charCode + pos, NULL, 16);
    str[1] = '\0';
}

void removeChar(const char * str, char * dest, char deletedChar) 
{
    int j = 0;

    for (int i = 0; i < strlen(yytext); i++) {
        if (str[i] != deletedChar) {
            dest[j++] = str[i];
        }
    }

    dest[j] = '\0';
}

int main( int argc, char** argv)
{
    if (argc == 2)
    {
        FILE *file = fopen(argv[1], "r");
        if (file == NULL) 
        {
            printf("File opening error");
            return 1;
        }
        yyin = file;
        yylex();
        fclose(file);
        return 0;
    }
    else
    {
        printf("missed commandline argument");
        return 1;
    }
}
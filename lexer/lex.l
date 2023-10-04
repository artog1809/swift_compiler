%option noyywrap
%option never-interactive

%x STRING
%x CHAR

DIGIT [0-9]

%{
    #include <stdio.h>
    #include <string.h>
%}

%{
    char bufferString[20480]; // Массив символов - буфер для строковых выражений.
%}

%%

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

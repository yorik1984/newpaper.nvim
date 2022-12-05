; extends

;;; Keywords

[
 "def"
 ] @keyword.function

((identifier) @keyword.function
 (#any-of? @keyword.function "alias" "undef"))

((identifier) @keyword.function
 (#any-of? @keyword.function "extend" "include" "prepend" "refine" "using"))

((identifier) @keyword.function
 (#vim-match? @keyword.function "^(alias|define|define_singleton|remove|undef)_method$"))

((identifier) @type.qualifier
 (#any-of? @type.qualifier "module_function"))

((identifier) @type.qualifier
 (#vim-match? @type.qualifier "^(public|private)_class_method$"))

((identifier) @type.qualifier
 (#vim-match? @type.qualifier "^(public|private)_constant$"))

((identifier) @exception
 (#any-of? @exception "catch" "throw"))

((identifier) @exception
 (#any-of? @exception "abort" "at_exit" "exit" "fork" "loop" "trap"))

((identifier) @keyword
 (#any-of? @keyword "callcc" "caller" "lambda" "proc" "eval"))

((identifier) @keyword
 (#vim-match? @keyword "^(class|instance|module)_eval$"))

;;; Function calls

"defined?" @keyword.operator

(call
   receiver: (constant)? @definition.type
   method: [
            (identifier)
            (constant)
            ] @definition.function
   )

(program
 (call
  (identifier) @include)
 (#any-of? @include "require" "require_relative" "load" "autoload" "gem"))

;;; Function definitions

((identifier) @include
 (#vim-match? @include "^attr_(accessor|reader|writer)$"))

((identifier) @include
 (#vim-match? @include "^\%(\%(\^|;)\\s*)\@<=attr\>(\\s*[.=])\@!$"))

((identifier) @constant.builtin
 (#any-of? @constant.builtin "initialize" "new"))

(superclass (constant) @storageclass)

;;; Identifiers

(class_variable) @constant

[
 (self)
 (super)
 ] @constant.builtin

;;; rubyPredefinedConstant

((constant) @constant
 (#any-of? @constant "ARGF" "ARGV" "ENV" "DATA" "STDERR" "STDIN" "STDOUT" "TOPLEVEL_BINDING"))

((constant) @constant
 (#vim-match? @constant "^RUBY_(VERSION|RELEASE_DATE|PLATFORM|PATCHLEVEL|REVISION|DESCRIPTION|COPYRIGHT|ENGINE)$"))

;;; rubyPredefinedVariable

((global_variable) @variable.builtin
 (#vim-match? @variable.builtin "^\\\$[!\$&\\\"\'*+,.0:;<>?@`~_]$"))

((global_variable) @variable.builtin
 (#vim-match? @variable.builtin "^\\\$\\d+$"))

((global_variable) @variable.builtin
 (#vim-match? @variable.builtin "^\\\$-[0FIWadilpvw]$"))

((global_variable) @variable.builtin
 (#vim-match? @variable.builtin "^\\\$(stderr|stdin|stdout)$"))

((global_variable) @variable.builtin
 (#vim-match? @variable.builtin "^\\\$(DEBUG|FILENAME|LOADED_FEATURES|LOAD_PATH|PROGRAM_NAME|SAFE|VERBOSE)$"))

;;; Operators

;;; rubyLambdaOperator

[
 "->"
 ] @punctuation.delimiter

; rubyScopeOperator

[
 "::"
 ] @punctuation.delimiter

;;; rubyBooleanOperator

[
 "!"
 "&&"
 "||"
 "and"
 "or"
 "not"
 "&."
 ] @boolean

;;; rubyTernaryOperator

[
 "?"
 ":"
 ] @keyword

;;; rubyEqualityOperator

[
 "==="
 "=="
 "!="
 "!~"
 "=~"
 ] @punctuation.special

;;; rubyRangeOperator

[
 ".."
 "..."
 ] @text.math

;;; rubyBitwiseOperator

[
 "|"
 "&"
 "^"
 "~"
 "<<"
 ">>"
 ] @exception

;;; rubyComparisonOperator

[
 ">"
 "<"
 ">="
 "<="
 "<=>"
 ] @constructor

;;; rubyArithmeticOperator

[
 "+"
 "-"
 "*"
 "**"
 "/"
 "%"
 ] @text.math

;;; rubyAssignmentOperator

[
 "="
 ">>="
 "<<="
 "||="
 "|="
 "&="
 "&&="
 "%="
 "+="
 "-="
 "*="
 "**="
 "/="
 "^="
 ] @operator

(pair key: (hash_key_symbol) ":" @symbol)

;;; From locals.scm

(module name: (constant) @definition.namespace)
(class name: (constant) @definition.type)
(method name: [(identifier) (constant)] @definition.function)
(singleton_method name: [(identifier) (constant)] @definition.function)

(scope_resolution
   scope: (constant) @definition.type
   name: (constant) @type
)

(method_parameters (identifier) @definition.var)

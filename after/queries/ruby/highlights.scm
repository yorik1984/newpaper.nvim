;; extends

;;; From locals.scm
(method_parameters (identifier) @definition.var)
(method_parameters
  (keyword_parameter name: [(identifier) @symbol]
    ":" @symbol))
(splat_parameter (identifier) @definition.var)
(hash_splat_parameter (identifier) @definition.var)
(argument_list (identifier) @definition.parameter)
(parenthesized_statements(identifier) @definition.var)

;;; Keywords

((identifier) @keyword.function
 (#any-of? @keyword.function "alias"))

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

((identifier) @exception
 (#any-of? @exception "fail" "raise"))

;;; Function calls
"defined?" @keyword.operator

(call receiver: (constant)? @definition.type)
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

((identifier) @constant.builtin
 (#vim-match? @constant.builtin "^__(callee|dir|id|method|send|ENCODING|FILE|LINE)__$"))

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
(conditional ["?" ":"] @conditional.ternary)

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
(binary ["+" "-" "*" "**" "/" "%"] @text.math)

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
 "."
 "::"
 ] @operator

;; rubyDotOperator
[
"."
 ] @include

; rubyScopeOperator
[
 "::"
 ] @include

(block_parameters "|" @constant.builtin)

(pair key: (hash_key_symbol) ":" @symbol)

;;; From locals.scm
(module name: (constant) @definition.namespace)
(class name: (constant) @definition.type)
(method name: [
               (identifier) @definition.function
               (constant) @definition.type
               ])
(singleton_method name: [
                         (identifier) @definition.function
                         (constant) @definition.type
                         ])

(scope_resolution scope: (constant) @definition.type)
(scope_resolution name: (constant) @definition.type)

((scope_resolution name: (constant) @type)
  (#vim-match? @type "^[A-Z0-9_]+$"))

(splat_parameter "*" @number)
(splat_argument "*" @number)
(hash_splat_parameter "**" @number)
(hash_splat_argument "**" @number)
(hash ["{" "}"] @symbol)
(pair "=>" @symbol)
(block_parameter "&" @punctuation.delimiter)
(block_argument "&" @punctuation.delimiter)

;;; rubySuperClassOperator
(superclass "<" @storageclass)

;;; rubyEigenClassOperator
(singleton_class "<<" @constant.builtin)

;;; regex
(regex "/" @string.regex)

(interpolation
  "#{" @include
  "}" @include) @text.emphasis

(class
  (comment)+ @comment.documentation
  (body_statement (singleton_method)))

(body_statement
  (comment)+ @comment.documentation
  (singleton_method))

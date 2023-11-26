;; extends

;;; From locals.scm
(method_parameters
  (keyword_parameter name: [(identifier) @symbol]
    ":" @symbol))
(method_parameters (identifier) @parameter.var)
(splat_parameter (identifier) @parameter.var)
(hash_splat_parameter (identifier) @parameter.var)
(parenthesized_statements(identifier) @parameter.var)
(argument_list (identifier) @definition.parameter)

;;; Keywords

((identifier) @keyword.function
 (#any-of? @keyword.function "alias"))

((identifier) @keyword.function
 (#any-of? @keyword.function "extend" "include" "prepend" "refine" "using"))

((identifier) @keyword.function
 (#match? @keyword.function "^(alias|define|define_singleton|remove|undef)_method$"))

((identifier) @type.qualifier
 (#any-of? @type.qualifier "module_function"))

((identifier) @type.qualifier
 (#match? @type.qualifier "^(public|private)_class_method$"))

((identifier) @type.qualifier
 (#match? @type.qualifier "^(public|private)_constant$"))

((identifier) @exception
 (#any-of? @exception "catch" "throw"))

((identifier) @exception
 (#any-of? @exception "abort" "at_exit" "exit" "fork" "loop" "trap"))

((identifier) @keyword
 (#any-of? @keyword "callcc" "caller" "lambda" "proc" "eval"))

((identifier) @keyword
 (#match? @keyword "^(class|instance|module)_eval$"))

((identifier) @exception
 (#any-of? @exception "fail" "raise"))

;;; Function calls
"defined?" @keyword.operator

(call receiver: (constant)? @storageclass)

(program
 (call
  (identifier) @include)
 (#any-of? @include "require" "require_relative" "load" "autoload" "gem"))

;;; Function definitions
((identifier) @include
 (#match? @include "^attr_(accessor|reader|writer)$"))

((identifier) @include
 (#vim-match? @include "^\%(\%(\^|;)\\s*)\@<=attr\>(\\s*[.=])\@!$"))

((identifier) @constant.builtin
 (#any-of? @constant.builtin "initialize" "new"))

(superclass (constant) @storageclass.super)

;;; Identifiers
(class_variable) @constant

((identifier) @constant.builtin
 (#match? @constant.builtin "^__(callee|dir|id|method|send|ENCODING|FILE|LINE)__$"))

;;; rubyPredefinedConstant
((constant) @constant.predef
 (#any-of? @constant.predef "ARGF" "ARGV" "ENV" "DATA" "STDERR" "STDIN" "STDOUT" "TOPLEVEL_BINDING"))

((constant) @constant.predef
 (#match? @constant.predef "^RUBY_(VERSION|RELEASE_DATE|PLATFORM|PATCHLEVEL|REVISION|DESCRIPTION|COPYRIGHT|ENGINE)$"))

;;; rubyPredefinedVariable
((global_variable) @variable.global.predef
 (#vim-match? @variable.global.predef "^\\\$[!\$&\\\"\'*+,.0:;<>?@`~_]$"))

((global_variable) @variable.global.predef
 (#vim-match? @variable.global.predef "^\\\$\\d+$"))

((global_variable) @variable.global.predef
 (#vim-match? @variable.global.predef "^\\\$-[0FIWadilpvw]$"))

((global_variable) @variable.global.predef
 (#vim-match? @variable.global.predef "^\\\$(stderr|stdin|stdout)$"))

((global_variable) @variable.global.predef
 (#vim-match? @variable.global.predef "^\\\$(DEBUG|FILENAME|LOADED_FEATURES|LOAD_PATH|PROGRAM_NAME|SAFE|VERBOSE)$"))

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
(binary ["+" "-" "*" "**" "/" "%"] @text.math.operator)

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
(class name: (constant) @storageclass)
(method name: [
               (identifier) @definition.function
               (constant) @storageclass
               ])
(singleton_method name: [
                         (identifier) @definition.function
                         (constant) @storageclass
                         ])

((scope_resolution scope: (constant) @storageclass)
  (#lua-match? @storageclass "^[%u][%u%l%d]+$"))

((scope_resolution name: (constant) @storageclass)
  (#lua-match? @storageclass "^[%u][%u%l%d]+$"))

((scope_resolution name: (constant) @constant)
  (#lua-match? @constant "^[%u][%u%d_]+$"))

(splat_parameter "*" @float)
(splat_argument "*" @float)
(hash_splat_parameter "**" @symbol)
(hash_splat_argument "**" @symbol)
(hash ["{" "}"] @symbol)
(pair "=>" @symbol)
(block_parameter "&" @punctuation.delimiter)
(block_argument "&" @punctuation.delimiter)

;;; rubySuperClassOperator
(superclass "<" @storageclass.super)

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

;; extends

(global_variable) @variable.global

(instance_variable) @variable.member.instance

; Keywords
"module" @keyword.type

((call
  !receiver
  method: (identifier) @keyword.function)
  (#any-of? @keyword.function "alias" "include" "extend" "prepend" "refine" "using"))

((identifier) @keyword.function
  (#match? @keyword.function "^(alias|define|define_singleton|remove|undef)_method$"))

((identifier) @keyword.modifier
  (#match? @keyword.modifier "^(public|private)_(constant|class_method)$"))

((identifier) @keyword.exception
  (#any-of? @keyword.exception "abort" "at_exit" "exit" "fork" "loop" "trap"))

((identifier) @keyword
  (#any-of? @keyword "callcc" "caller" "lambda" "proc" "eval"))

((identifier) @keyword.type
  (#match? @keyword.type "^(class|instance|module)_eval$"))

; Function calls
"defined?" @keyword.operator

(call
  receiver: (constant)? @local.definition.type)

(program
  (call
    (identifier) @keyword.import)
  (#any-of? @keyword.import "autoload" "gem"))

; Function definitions
((identifier) @constant.builtin
  (#any-of? @constant.builtin "initialize" "new"))

(superclass
  (constant) @local.definition.type.super)

; rubyPredefinedConstant
((constant) @constant.predef
  (#any-of? @constant.predef "ARGF" "ARGV" "ENV" "DATA" "STDERR" "STDIN" "STDOUT" "TOPLEVEL_BINDING"))

((constant) @constant.predef
  (#match? @constant.predef
    "^RUBY_(VERSION|RELEASE_DATE|PLATFORM|PATCHLEVEL|REVISION|DESCRIPTION|COPYRIGHT|ENGINE)$"))

; rubyPredefinedVariable
((global_variable) @variable.global.predef
  (#vim-match? @variable.global.predef "^\\$[!$&\"'*+,.0:;<>?@`~_]$"))

((global_variable) @variable.global.predef
  (#vim-match? @variable.global.predef "^\\$\\d+$"))

((global_variable) @variable.global.predef
  (#vim-match? @variable.global.predef "^\\$-[0FIWadilpvw]$"))

((global_variable) @variable.global.predef
  (#vim-match? @variable.global.predef "^\\$(stderr|stdin|stdout)$"))

((global_variable) @variable.global.predef
  (#vim-match? @variable.global.predef
    "^\\$(DEBUG|FILENAME|LOADED_FEATURES|LOAD_PATH|PROGRAM_NAME|SAFE|VERBOSE)$"))

; Operators
; rubyLambdaOperator
"->" @punctuation.delimiter

; rubyBooleanOperator
[
  "and"
  "or"
  "not"
] @boolean

[
  "!"
  "&&"
  "||"
  "&."
] @operator.boolean

; rubyTernaryOperator
(conditional
  [
    "?"
    ":"
  ] @keyword.conditional.ternary)

; rubyEqualityOperator
[
  "==="
  "=="
  "!="
  "!~"
  "=~"
] @operator.special

; rubyRangeOperator
[
  ".."
  "..."
] @punctuation.delimiter

; rubyBitwiseOperator
[
  "|"
  "&"
  "^"
  "~"
  "<<"
  ">>"
] @keyword.exception

; rubyComparisonOperator
[
  ">"
  "<"
  ">="
  "<="
  "<=>"
] @constructor

; rubyArithmeticOperator
(binary
  [
    "+"
    "-"
    "*"
    "**"
    "/"
    "%"
  ] @operator.math)

; rubyAssignmentOperator
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

[
  "."
  "::"
] @punctuation.dot

(block_parameters
  "|" @constant.builtin)

(pair
  key: (hash_key_symbol)
  ":" @string.special.symbol)

; From locals.scm
(module
  name: (constant) @local.definition.namespace)

(class
  name: (constant) @local.definition.type)

(method
  name: [
    (identifier) @local.definition.function
    (constant) @local.definition.type
  ])

(singleton_method
  name: [
    (identifier) @local.definition.function
    (constant) @local.definition.type
  ])

(scope_resolution
  [
    scope: (constant) @local.definition.type
    name: (constant) @local.definition.type
    name: (constant) @constant
  ]
  (#lua-match? @constant "^[%u][%u%d_]+$")
  (#lua-match? @local.definition.type "^[%u][%u%l%d]+$"))

(splat_parameter
  "*" @number.float)

(splat_argument
  "*" @number.float)

(hash_splat_parameter
  "**" @string.special.symbol)

(hash_splat_argument
  "**" @string.special.symbol)

(hash
  [
    "{"
    "}"
  ] @string.special.symbol)

(pair
  "=>" @string.special.symbol)

(block_parameter
  "&" @punctuation.delimiter)

(block_argument
  "&" @punctuation.delimiter)

(method_parameters
  (keyword_parameter
    name: (identifier) @string.special.symbol
    ":" @string.special.symbol))

((identifier) @local.definition.var
  (#has-parent? @local.definition.var
    method_parameters lambda_parameters block_parameters splat_parameter hash_splat_parameter
    optional_parameter destructured_parameter block_parameter keyword_parameter
    parenthesized_statements))

; rubySuperClassOperator
(superclass
  "<" @local.definition.type.super)

; rubyEigenClassOperator
(singleton_class
  "<<" @constant.builtin)

; regexp
(regex
  "/" @string.regexp)

(interpolation
  "#{" @keyword.import
  "}" @keyword.import) @markup.italic

(class
  (comment)+ @comment.documentation
  (body_statement
    (singleton_method)))

(body_statement
  (comment)+ @comment.documentation
  (singleton_method))

(heredoc_body) @comment.documentation

; debugger command strings
(call
  receiver: (identifier)
  method: (identifier)
  arguments: (argument_list
    (pair
      key: (hash_key_symbol)
      value: (string
        (string_content) @markup.italic))))

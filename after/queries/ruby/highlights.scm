; Keywords

[
 "def"
 ] @keyword.function

((identifier) @keyword.function
 (#vim-match? @keyword.function "^(alias|undef)$"))

((identifier) @keyword.function
 (#vim-match? @keyword.function "^(extend|include|prepend|refine|using)$"))

((identifier) @keyword.function
 (#vim-match? @keyword.function "^(alias|define|define_singleton|remove|undef)_method$"))

((identifier) @function.macro
 (#vim-match? @function.macro "^(private|protected|public|module_function)$"))

((identifier) @function.macro
 (#vim-match? @function.macro "^(public|private)_class_method$"))

((identifier) @function.macro
 (#vim-match? @function.macro "^(public|private)_constant$"))

((identifier) @exception
 (#vim-match? @exception "^(catch|throw)$"))

((identifier) @exception
 (#vim-match? @exception "^(abort|at_exit|exit|fork|loop|trap)$"))

((identifier) @keyword
 (#vim-match? @keyword "^(callcc|caller|lambda|proc|eval)$"))

((identifier) @keyword
 (#vim-match? @keyword "^(class|instance|module)_eval$"))

; Function calls

"defined?" @keyword.operator

(call
   receiver: (constant)? @storageclass
   method: [
            (identifier)
            (constant)
            ] @function
   )

((identifier) @exception
 (#vim-match? @exception "^(fail|raise)$"))

(program
 (call
  (identifier) @include)
 (#vim-match? @include "^(autoload|gem|require|require_relative|load)$"))

; Function definitions

((identifier) @include
 (#vim-match? @include "^attr_(accessor|reader|writer)$"))

((identifier) @include
 (#vim-match? @include "^\%(\%(\^|;)\\s*)\@<=attr\>(\\s*[.=])\@!$"))

((identifier) @constant.builtin
 (#vim-match? @constant.builtin "^(initialize|new)$"))

(class name: (constant) @storageclass)
(module name: (constant) @constructor)
(superclass (constant) @operator)

; Identifiers

(class_variable) @constant
(global_variable) @type.qualifier

[
 (self)
 (super)
 ] @constant.builtin

; rubyPredefinedConstant

((constant) @constant
 (#vim-match? @constant "^(ARGF|ARGV|ENV|DATA|STDERR|STDIN|STDOUT|TOPLEVEL_BINDING)$"))

((constant) @constant
 (#vim-match? @constant "^RUBY_(VERSION|RELEASE_DATE|PLATFORM|PATCHLEVEL|REVISION|DESCRIPTION|COPYRIGHT|ENGINE)$"))

; rubyPredefinedVariable

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

; Operators

; rubyLambdaOperator

[
 "->"
 ] @punctuation.delimiter

; rubyScopeOperator

[
 "::"
 ] @punctuation.delimiter

; rubyBooleanOperator

[
 "!"
 "&&"
 "||"
 "and"
 "or"
 "not"
 ] @boolean

; rubyTernaryOperator

[
 "?"
 ":"
 ] @keyword

; rubyEqualityOperator

[
 "==="
 "=="
 "!="
 "!~"
 "=~"
 ] @punctuation.special

; rubyRangeOperator

[
 ".."
 "..."
 ] @text.math

; rubyBitwiseOperator

[
 "|"
 "&"
 "^"
 "~"
 "<<"
 ">>"
 ] @exception

; rubyComparisonOperator

[
 ">"
 "<"
 ">="
 "<="
 "<=>"
 ] @constructor

; rubyArithmeticOperator

[
 "+"
 "-"
 "*"
 "**"
 "/"
 "%"
 ] @text.math

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

(interpolation
  "#{" @symbol
  "}" @symbol) @none

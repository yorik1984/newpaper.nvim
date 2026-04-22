; extends

(decorator
  "@" @attribute.operator)

(template_string) @string.documentation

(regex_flags) @character.special.regexp

(regex
  "/" @string.regexp) ; Regex delimiters

; Punctuation
"..." @label

; Arithmetic
[
  "+"
  "++"
  "-"
  "--"
  "*"
  "**"
  "^"
  "%"
] @operator.math

(binary_expression
  "/" @operator.math)

(unary_expression
  "!" @operator.boolean)

(unary_expression
  "~" @keyword.exception)

(unary_expression
  [
    "-"
    "+"
  ] @operator.math)

[
  "{"
  "}"
] @constructor.bracket

(template_substitution
  [
    "${"
    "}"
  ] @keyword.import) @none

; Relational Operators
[
  "<"
  "<="
  ">"
  ">="
  "=="
  "==="
  "!="
  "!=="
] @operator.special

; Bitwise Operators
[
  "&"
  "|"
  "<<"
  ">>"
  ">>>"
  "&="
  "|="
  "^="
  "<<="
  ">>="
  ">>>="
] @keyword.exception

; booleans
[
  "&&"
  "||"
  "??"
  "&&="
  "||="
  "??="
] @operator.boolean

"=>" @string.special.symbol

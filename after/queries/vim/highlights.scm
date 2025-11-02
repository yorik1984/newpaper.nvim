; extends

(syntax_argument
  name: _ @keyword.operator)

(syntax_argument
  [
    "start"
    "skip"
    "end"
  ] @keyword.modifier)

; Operators
[
  "+"
  "-"
  "*"
  "/"
  "%"
  "+="
  "-="
  "*="
  "/="
  "%="
] @operator.math

[
  ".."
  "..="
] @character.special

[
  "=<<"
  "->"
] @punctuation.delimiter

[
  "=="
  "!="
  "!~"
  "=~"
] @punctuation.special

[
  ">"
  "<"
  ">="
  "<="
] @constructor

[
  "&&"
  "||"
] @operator.boolean

(inv_option
  "!" @operator.special)

(match_case) @operator.special

(unary_operation
  "!" @operator.boolean)

[
  "<<"
] @keyword.exception

(binary_operation
  "." @punctuation.dot)

(hl_attribute
  key: _ @property
  val: _ @number.float)

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

(hl_attribute
  key: _ @property
  val: _ @number.float)

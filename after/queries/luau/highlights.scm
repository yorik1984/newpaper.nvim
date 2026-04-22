; extends

; Operators
[
  "=="
  "~="
  ">"
  "<"
  ">="
  "<="
] @operator.special

[
  "&"
  "|"
] @operator.boolean

[
  "+"
  "-"
  "*"
  "^"
  "%"
  "/"
  "//"
] @operator.math

".." @character.special

; Literals
(vararg_expression) @label

; Tables
(field
  name: (identifier) @local.definition.field)

(table_constructor
  [
    "{"
    "}"
  ] @constructor.bracket)

;; extends

;; Operators

[
  "=="
  "~="
  ">"
  "<"
  ">="
  "<="
] @punctuation.special

[
  "&"
  "|"
] @boolean

[
  "+"
  "-"
  "*"
  "^"
  "%"
  "/"
  "//"
] @operator.math

[
  ".."
] @character.special

;; Literals

(vararg_expression) @label

;; Tables

(field name: (identifier) @local.definition.field)

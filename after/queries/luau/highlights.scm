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
  "~"
] @exception

[
  "+"
  "-"
  "*"
  "^"
  "%"
  "/"
  "//"
] @text.math.operator

[
  ".."
] @character.special

;; Literals

(vararg_expression) @label

;; Tables

(field name: (identifier) @definition.field)

;; extends

;; Operators

;; Relational Operators

[
 "=="
 "~="
 ">"
 "<"
 ">="
 "<="
 ] @punctuation.special

;; Bitwise Operators

[
 "&"
 "|"
 "~"
 "<<"
 ">>"
 ] @exception

;; Arithmetic

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

;; Constants

(vararg_expression) @label

;; Tables

(field name: (identifier) @definition.field)

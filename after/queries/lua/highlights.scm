; extends

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

[
 ".."
 ] @punctuation.bracket

;; Constants

(vararg_expression) @label

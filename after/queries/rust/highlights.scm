;; extends

;; Operators & Punctuation

[
  "=>"
 ] @debug

[
  "..="
 ] @punctuation.delimiter

;; Bitwise

[
  "&="
  "^"
  "^="
  "|="
 ] @exception

;; Arithmetic

[
  "+"
  "-"
  "%"
  "/"
] @text.math.operator

[
  ".."
] @character.special

;; Short-circuiting logical

[
 "&&"
 "||"
 ] @boolean

;; Comparison

[
  "!="
  "=="
  "@"
 ] @punctuation.special

[
  "<"
  "<="
  ">"
  ">="
 ] @constructor

;; Shift

[
  "<<"
  "<<="
  ">>"
  ">>="
 ] @character.special

;; Other

[
 "::"
 "."
 ] @label

 (dynamic_type "dyn" @keyword.operator)

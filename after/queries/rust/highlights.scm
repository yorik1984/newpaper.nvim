;; extends

;; Operators & Punctuation

[
  "=>"
 ] @debug

[
  "..="
 ] @variable.builtin

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
  ".."
 ] @text.math

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

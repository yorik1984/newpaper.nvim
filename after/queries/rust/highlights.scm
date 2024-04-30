;; extends

;; Operators & Punctuation

[
  "=>"
 ] @keyword.debug

[
  "..="
 ] @punctuation.delimiter

;; Bitwise

[
  "&="
  "^"
  "^="
  "|="
 ] @keyword.exception

;; Arithmetic

[
  "+"
  "-"
  "%"
  "/"
] @operator.math

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

(for_lifetimes
  [
    "<"
    ">"
  ] @punctuation.bracket.lifetime)

 (dynamic_type "dyn" @keyword.operator)

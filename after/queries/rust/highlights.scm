; extends

;; Operators & Punctuation

[
 "->"
 ] @punctuation.delimiter

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

(type_arguments ["<" ">"] @punctuation.bracket)
(type_parameters ["<" ">"] @punctuation.bracket)
(bracketed_type ["<" ">"] @punctuation.bracket)
(for_lifetimes ["<" ">"] @punctuation.bracket)

[
 "ref"
 (mutable_specifier)
] @keyword.operator

 (dynamic_type "dyn" @keyword.operator)

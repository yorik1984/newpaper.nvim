; extends

(syntax_argument name: _ @keyword.operator)

(syntax_argument [
  "start"
  "skip"
  "end"
] @type.qualifier)

;; Operators

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
 ]@constructor

[
 "&&"
 "||"
 ] @boolean

(hl_attribute
  key: _ @property
  val: _ @preproc)

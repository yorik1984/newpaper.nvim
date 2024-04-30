;; extends

; Tokens

[
  "+"
  "-"
  "*"
  "/"
  "%"
  "**"
  "//"
] @operator.math

[
  ">"
  "<"
  ">="
  "<="
] @constructor

[
  "=="
  "!="
] @punctuation.special

[
  "&"
  "|"
  "^"
  "~"
  "<<"
  ">>"
] @keyword.exception

; Keywords

[
  "and"
  "or"
  "not"
] @boolean

(interpolation
  "{" @keyword.import
  "}" @keyword.import)

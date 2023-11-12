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
] @text.math.operator

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
] @exception

; Keywords

[
  "and"
  "or"
  "not"
] @boolean

(interpolation
  "{" @include
  "}" @include)
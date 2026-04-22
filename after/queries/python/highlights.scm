; extends

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
] @operator.special

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

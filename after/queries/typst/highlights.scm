; extends

; Operators
[
  "=="
  "!="
  ">"
  "<"
  ">="
  "<="
] @operator.special

"*" @markup.quote.marker

[
  "+"
  "-"
] @markup.list

[
  "and"
  "or"
  "not"
] @operator.boolean

"in" @keyword.operator

; special case: #for (ident) in (expr)
(for
  "in" @keyword.repeat)

; punctuation
"#" @punctuation.special

":" @punctuation.dot

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

; MATH
"/" @operator.math

(mul
  "*" @operator.math)

(add
  "+" @operator.math)

(sub
  "-" @operator.math)

(symbol) @operator.math

(attach
  "^" @operator.math.sub)

(code
  (group
    [
      "("
      ")"
      "{"
      "}"
      "["
      "]"
    ] @operator))

(math
  "$" @markup.math.delim)

; CONCEAL
(heading
  ("=" @markup.heading.1) @markup.heading.1
  (#set! conceal "󰚟"))

(heading
  ("==" @markup.heading.2) @markup.heading.2
  (#set! conceal "󰚟"))

(heading
  ("===" @markup.heading.3) @markup.heading.3
  (#set! conceal "󰚟"))

(heading
  ("====" @markup.heading.4) @markup.heading.4
  (#set! conceal "󰚟"))

(heading
  ("=====" @markup.heading.5) @markup.heading.5
  (#set! conceal "󰚟"))

(heading
  ("======" @markup.heading.6) @markup.heading.6
  (#set! conceal "󰚟"))

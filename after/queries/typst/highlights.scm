; extends

[
  "=="
  "!="
  ">"
  "<"
  ">="
  "<="
] @operator.special

([
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket.code
  (#has-ancestor? @punctuation.bracket.code code))

[
  "and"
  "or"
  "not"
] @operator.boolean

"in" @keyword.operator

(for
  "in" @keyword.repeat)

"#" @punctuation.special

(":" @punctuation.dot
  (#not-has-parent? @punctuation.dot symbol)
	(#set! priority 125))

(field
  "." @punctuation.delimiter)

([
  "("
  ")"
] @function.call.math.operator
  (#any-of? @function.call.math.operator "(" ")")
  (#has-ancestor? @function.call.math.operator math))

(add
  "+" @operator)

(sub
  "-" @operator)

(mul
  "*" @operator)

(div
  "/" @operator)

(sign
  [
    "+"
    "-"
  ] @number)

(elude
  ".." @punctuation.dot)

(shorthand) @character.special.ligatures

(term) @comment.verb

(term
  [
    term: (_) @markup.heading
    "/" @punctuation.special
    ":" @punctuation.dot
  ]
  (#set! @punctuation.special conceal "")
  (#set! @punctuation.dot conceal ""))

; #link("https://example.com")
(code
  "#" @punctuation.special
  (call
    item: (ident) @_link
    (#eq? @_link "link")
    (group
      "(" @punctuation.bracket.markup
      .
      (string) @markup.link.url
      .
      ")" @punctuation.bracket.markup)
    (#offset! @markup.link.url 0 1 0 -1)
    (#set! @markup.link.url url @markup.link.url))
  (#set! @_link conceal "")
  (#set! @punctuation.bracket.markup conceal "")
  (#set! @punctuation.special conceal ""))

; #link("https://example.com")[See example.com]
(code
  "#" @punctuation.special
  (call
    item: (call
      item: (ident) @_link
      (#eq? @_link "link")
      (group
        "(" @punctuation.bracket.markup
        .
        (string) @markup.link.url
        .
        ")" @punctuation.bracket.markup))
    (content
      "[" @punctuation.bracket.markup.square
      (text) @string
      "]" @punctuation.bracket.markup.square))
  (#offset! @markup.link.url 0 1 0 -1)
  (#set! @markup.link.url url @markup.link.url)
  (#set! @_link conceal "")
  (#set! @punctuation.bracket.markup conceal "")
  (#set! @punctuation.special conceal ""))

; #link(<label>)[text]
(code
  "#" @punctuation.special
  (call
    item: (call
      item: (ident) @_link
      (#eq? @_link "link")
      (group
        "(" @punctuation.bracket.markup
        .
        (label)
        .
        ")" @punctuation.bracket.markup))
    (content
      "[" @punctuation.bracket.markup.square
      (text) @string
      "]" @punctuation.bracket.markup.square))
  (#set! @_link conceal "")
  (#set! @punctuation.bracket.markup conceal "")
  (#set! @punctuation.special conceal ""))

; MATH AND CONCEAL
(math
  "$" @markup.math.delim)

(call
  item: (ident) @function.call.math
  (#has-ancestor? @function.call.math math))

(call
  item: (ident) @function.call.math.operator
  (#has-ancestor? @function.call.math.operator math)
  (#any-of? @function.call.math.operator "frac" "abs"))

(call
  item: (ident) @function.call.math.operator
  (#eq? @function.call.math.operator "frac")
  "," @operator.math.slash
  (#set! priority 125))

(attach
  [
    [
      "^"
      "_"
    ] @operator.math.sub
    [
      sub: (letter)
      sup: (letter)
    ] @conceal
    [
      sub: (group
        [
          "("
          ")"
        ] @punctuation.bracket.math.sub)
      sup: (group
        [
          "("
          ")"
        ] @punctuation.bracket.math.sub)
    ]
  ])

(symbol) @operator.math

((symbol) @operator.math
  (#eq? @operator.math "+")
  (#set! @operator.math conceal "＋"))

((symbol) @operator.math
  (#eq? @operator.math "-")
  (#set! @operator.math conceal "－"))

((symbol) @operator.math
  (#eq? @operator.math "*")
  (#set! @operator.math conceal "·"))

((symbol) @operator.math
  (#eq? @operator.math "<")
  (#set! @operator.math conceal "ᐸ"))

((symbol) @operator.math
  (#eq? @operator.math ">")
  (#set! @operator.math conceal "ᐳ"))

((symbol) @operator.math
  (#eq? @operator.math "=")
  (#set! @operator.math conceal "＝"))

((symbol) @operator.math
  (#eq? @operator.math ":")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "∶")
	(#set! priority 125))

(fac
  "!" @operator.math
  (#set! @operator.math conceal "󰈅"))

(fraction
  "/" @operator.math
  (#set! @operator.math conceal "⧸"))

((shorthand) @operator.math
  (#has-ancestor? @operator.math math))

; CONCEAL
((linebreak) @punctuation.special
  (#lua-match? @punctuation.special "^\\$")
  (#set! conceal "↲"))

((quote) @markup.quote.marker
  (#lua-match? @markup.quote.marker "^\"$")
  (#set! @markup.quote.marker conceal "”"))

((quote) @markup.quote.marker
  (#lua-match? @markup.quote.marker "^'$")
  (#set! @markup.quote.marker conceal "’"))

(label
  [
    "<"
    ">"
  ] @markup.link.ref)

(raw_span
  "`" @markup.raw.delimiter
  (#set! @markup.raw.delimiter conceal ""))

(raw_blck
  [
    lang: (ident) @label
    "```" @markup.raw.delimiter
  ]
  (#set! @label conceal "")
  (#set! @markup.raw.delimiter conceal ""))

(heading
  ("=" @markup.heading.1) @markup.heading.1
  (#set! @markup.heading.1 conceal "󰚟"))

(heading
  ("==" @markup.heading.2) @markup.heading.2
  (#set! @markup.heading.2 conceal "󰚟"))

(heading
  ("===" @markup.heading.3) @markup.heading.3
  (#set! @markup.heading.3 conceal "󰚟"))

(heading
  ("====" @markup.heading.4) @markup.heading.4
  (#set! @markup.heading.4 conceal "󰚟"))

(heading
  ("=====" @markup.heading.5) @markup.heading.5
  (#set! @markup.heading.5 conceal "󰚟"))

(heading
  ("======" @markup.heading.6) @markup.heading.6
  (#set! @markup.heading.6 conceal "󰚟"))

; ------------------------------------------------------------------------------
;                               CONCEAL SYMBOLS
; ------------------------------------------------------------------------------
(strong
  "*" @markup.quote.marker
  (#set! @markup.quote.marker conceal ""))

(emph
  "_" @markup.quote.marker
  (#set! @markup.quote.marker conceal ""))

(item
  "-" @markup.list
  (#set! @markup.list conceal "•"))

((shorthand) @character.special.ligatures
  (#eq? @character.special.ligatures "...")
  (#set! @character.special.ligatures conceal "…"))

((shorthand) @character.special.ligatures
  (#eq? @character.special.ligatures "--")
  (#set! @character.special.ligatures conceal "–"))

((shorthand) @character.special.ligatures
  (#eq? @character.special.ligatures "---")
  (#set! @character.special.ligatures conceal "—"))

((shorthand) @character.special.ligatures
  (#eq? @character.special.ligatures "-?")
  (#set! @character.special.ligatures conceal ""))

((shorthand) @character.special.ligatures
  (#eq? @character.special.ligatures "~")
  (#set! @character.special.ligatures conceal "␣"))

; ------------------------------------------------------------------------------
;                             CONCEAL MATH SYMBOLS
; ------------------------------------------------------------------------------
; fix original small dots
((field) @function.math.operator
  (#any-of? @function.math.operator "dot.c" "dot.op")
  (#has-ancestor? @function.math.operator math)
  (#set! @function.math.operator conceal "·")
  (#set! priority 125))

((ident) @function.math.operator
  (#eq? @function.math.operator "dot")
  (#has-ancestor? @function.math.operator math)
  (#not-has-parent? @function.math.operator field)
  (#set! @function.math.operator conceal "·")
  (#set! priority 125))

; arrow right
; '==>', '=>', '->', '|->', '->>', '-->', '~>', '~~>'
((shorthand) @operator.math
  (#eq? @operator.math "==>")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "⟹"))

((shorthand) @operator.math
  (#eq? @operator.math "=>")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "⇒"))

((shorthand) @operator.math
  (#eq? @operator.math "->")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "→"))

((shorthand) @operator.math
  (#eq? @operator.math "|->")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "↦"))

((shorthand) @operator.math
  (#eq? @operator.math "->>")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "↠"))

((shorthand) @operator.math
  (#eq? @operator.math "-->")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "⟶"))

((shorthand) @operator.math
  (#eq? @operator.math "~>")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "⇝"))

((shorthand) @operator.math
  (#eq? @operator.math "~~>")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "⇝"))

; arrow left
; '<==', '<-', '<<-', '<--'
((shorthand) @operator.math
  (#eq? @operator.math "<==")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "⟸"))

((shorthand) @operator.math
  (#eq? @operator.math "<-")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "←"))

((shorthand) @operator.math
  (#eq? @operator.math "<<-")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "↞"))

((shorthand) @operator.math
  (#eq? @operator.math "<--")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "⟵"))

; arrow both
; '<->', '<-->', '<=>', '<==>'
((shorthand) @operator.math
  (#eq? @operator.math "<->")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "↔"))

((shorthand) @operator.math
  (#eq? @operator.math "<-->")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "⟷"))

((shorthand) @operator.math
  (#eq? @operator.math "<=>")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "⇔"))

((shorthand) @operator.math
  (#eq? @operator.math "<==>")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "⟺"))

; cmp eq
; ':=', '::=', '=:', '!='
((shorthand) @operator.math
  (#eq? @operator.math ":=")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "≔"))

((shorthand) @operator.math
  (#eq? @operator.math "::=")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "⩴"))

((shorthand) @operator.math
  (#eq? @operator.math "=:")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "≕"))

((shorthand) @operator.math
  (#eq? @operator.math "!=")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "≠"))

; cmp less
; '<=', '<<', '<<<'
((shorthand) @operator.math
  (#eq? @operator.math "<=")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "⩽"))

((shorthand) @operator.math
  (#eq? @operator.math "<<")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "≪"))

((shorthand) @operator.math
  (#eq? @operator.math "<<<")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "⋘"))

; cmp greater
; '>=', '>>', '>>>'
((shorthand) @operator.math
  (#eq? @operator.math ">=")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "⩾"))

((shorthand) @operator.math
  (#eq? @operator.math ">>")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "≫"))

((shorthand) @operator.math
  (#eq? @operator.math ">>>")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "⋙"))

; other
; '...'
((shorthand) @operator.math
  (#eq? @operator.math "...")
  (#has-ancestor? @operator.math math)
  (#set! @operator.math conceal "…"))

(call
  item: (ident) @_func_name
  (#eq? @_func_name "frac")
  "(" @left_paren
  .
  [
    (formula
      .
      (letter) .)
    (formula
      .
      (number) .)
    (formula
      .
      (group) .)
  ]
  .
  "," @punctuation.comma
  .
  [
    (formula
      .
      (letter) .)
    (formula
      .
      (number) .)
    (formula
      .
      (group) .)
  ]
  .
  ")" @right_paren
  (#set! @punctuation.comma conceal "⧸")
  (#set! @left_paren conceal "")
  (#set! @right_paren conceal "")
  (#set! priority 105))

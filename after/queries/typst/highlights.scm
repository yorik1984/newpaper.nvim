; extends

([
  "=="
  "!="
  ">"
  "<"
  ">="
  "<="
] @operator.special
  (#has-ancestor? @operator.special code))

([
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket.code
  (#has-ancestor? @punctuation.bracket.code code)
  (#not-has-ancestor? @punctuation.bracket.code math))

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
  (#not-has-parent? @punctuation.dot symbol))

(field
  "." @punctuation.delimiter)

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

; ------------------------------------------------------------------------------
;                                    TEXT
; ------------------------------------------------------------------------------
; conceal commands with tagged. Conceal only text string present
; text(fill: blue, "typst") -> typst
(code
  "#" @punctuation.special
  (call
    item: (ident) @function.call
    (group
      (string) .))
  (#any-of? @function.call "text")
  (#set! @punctuation.special conceal ""))

(call
  item: (ident) @function.call
  (group
    (tagged) @_conceal
    "," @_conceal
    (string) .) @_group
  (#has-parent? @_group call)
  (#any-of? @function.call "text")
  (#set! @_conceal conceal ""))

(call
  item: (ident) @function.call
  (group
    (string
      "\"" @string))
  (#any-of? @function.call "text")
  (#set! @string conceal ""))

(call
  item: (ident) @function.call
  (group
    "(" @punctuation.bracket
    (string)
    .
    ")" @punctuation.bracket)
  (#any-of? @function.call "text")
  (#set! @function.call conceal "")
  (#set! @punctuation.bracket conceal ""))

(code
  "#" @punctuation.special
  (call
    item: (ident) @function.call
    (group
      [
        "("
        ")"
      ] @function.call.bracket))
  (#any-of? @function.call "divider")
  (#set! @punctuation.special conceal "")
  (#set! @function.call conceal "―")
  (#set! @function.call.bracket conceal "―"))

(code
  "#" @punctuation.special
  (call
    item: (ident) @function.call
    (content
      "[" @punctuation.bracket.markup.square
      (text) @markup.italic
      "]" @punctuation.bracket.markup.square))
  (#any-of? @function.call "emph")
  (#set! @punctuation.special conceal "")
  (#set! @function.call conceal "")
  (#set! @punctuation.bracket.markup.square conceal ""))

(code
  "#" @punctuation.special
  (call
    item: (ident) @function.call
    (content
      "[" @punctuation.bracket.markup.square
      (text) @markup.strong
      "]" @punctuation.bracket.markup.square))
  (#any-of? @function.call "strong")
  (#set! @punctuation.special conceal "")
  (#set! @function.call conceal "")
  (#set! @punctuation.bracket.markup.square conceal ""))

(code
  "#" @punctuation.special
  (call
    item: (call
      item: (ident) @function.call
      (group) @_conceal)
    (content
      "[" @punctuation.bracket.markup.square
      (text) @markup.strong
      "]" @punctuation.bracket.markup.square))
  (#any-of? @function.call "strong")
  (#set! @punctuation.special conceal "")
  (#set! @_conceal conceal "")
  (#set! @function.call conceal "")
  (#set! @punctuation.bracket.markup.square conceal ""))

(code
  "#" @punctuation.special
  (call
    item: (ident) @function.call
    (group
      "(" @function.call.bracket
      (tagged) @_conceal
      "," @_conceal
      (content
        "[" @punctuation.bracket.markup.square
        (text) @markup.strong
        "]" @punctuation.bracket.markup.square)
      ")" @function.call.bracket))
  (#any-of? @function.call "strong")
  (#set! @punctuation.special conceal "")
  (#set! @_conceal conceal "")
  (#set! @function.call conceal "")
  (#set! @function.call.bracket conceal "")
  (#set! @punctuation.bracket.markup.square conceal ""))

(code
  "#" @punctuation.special
  (call
    item: (ident) @function.call
    (content
      "[" @punctuation.bracket.markup.square
      (text) @markup.strikethrough
      "]" @punctuation.bracket.markup.square))
  (#any-of? @function.call "strike")
  (#set! @punctuation.special conceal "")
  (#set! @function.call conceal "")
  (#set! @punctuation.bracket.markup.square conceal ""))

(code
  "#" @punctuation.special
  (call
    item: (call
      item: (ident) @function.call
      (group) @_conceal)
    (content
      "[" @punctuation.bracket.markup.square
      (text) @markup.strikethrough
      "]" @punctuation.bracket.markup.square))
  (#any-of? @function.call "strike")
  (#set! @punctuation.special conceal "")
  (#set! @_conceal conceal "")
  (#set! @function.call conceal "")
  (#set! @punctuation.bracket.markup.square conceal ""))

(code
  "#" @punctuation.special
  (call
    item: (ident) @function.call
    (group
      "(" @function.call.bracket
      (tagged) @_conceal
      "," @_conceal
      (content
        "[" @punctuation.bracket.markup.square
        (text) @markup.strikethrough
        "]" @punctuation.bracket.markup.square)
      ")" @function.call.bracket))
  (#any-of? @function.call "strike")
  (#set! @punctuation.special conceal "")
  (#set! @_conceal conceal "")
  (#set! @function.call conceal "")
  (#set! @function.call.bracket conceal "")
  (#set! @punctuation.bracket.markup.square conceal ""))

(code
  "#" @punctuation.special
  (call
    item: (ident) @function.call
    (content
      "[" @punctuation.bracket.markup.square
      (text) @markup.underline
      "]" @punctuation.bracket.markup.square))
  (#any-of? @function.call "underline")
  (#set! @punctuation.special conceal "")
  (#set! @function.call conceal "")
  (#set! @punctuation.bracket.markup.square conceal ""))

(code
  "#" @punctuation.special
  (call
    item: (call
      item: (ident) @function.call
      (group) @_conceal)
    (content
      "[" @punctuation.bracket.markup.square
      (text) @markup.underline
      "]" @punctuation.bracket.markup.square))
  (#any-of? @function.call "underline")
  (#set! @punctuation.special conceal "")
  (#set! @_conceal conceal "")
  (#set! @function.call conceal "")
  (#set! @punctuation.bracket.markup.square conceal ""))

(code
  "#" @punctuation.special
  (call
    item: (ident) @function.call
    (group
      "(" @function.call.bracket
      (tagged) @_conceal
      "," @_conceal
      (content
        "[" @punctuation.bracket.markup.square
        (text) @markup.underline
        "]" @punctuation.bracket.markup.square)
      ")" @function.call.bracket))
  (#any-of? @function.call "underline")
  (#set! @punctuation.special conceal "")
  (#set! @_conceal conceal "")
  (#set! @function.call conceal "")
  (#set! @function.call.bracket conceal "")
  (#set! @punctuation.bracket.markup.square conceal ""))

(code
  "#" @operator.math.sub
  (call
    item: (ident) @function.call
    (content
      "[" @punctuation.bracket.math.sub
      (text)
      "]" @punctuation.bracket.math.sub))
  (#any-of? @function.call "super")
  (#set! @function.call conceal "")
  (#set! @operator.math.sub conceal "^"))

(code
  "#" @operator.math.sub
  (call
    item: (call
      item: (ident) @function.call
      (group) @_conceal)
    (content
      "[" @punctuation.bracket.math.sub
      (text)
      "]" @punctuation.bracket.math.sub))
  (#any-of? @function.call "super")
  (#set! @function.call conceal "")
  (#set! @_conceal conceal "")
  (#set! @operator.math.sub conceal "^"))

(code
  "#" @operator.math.sub
  (call
    item: (ident) @function.call
    (content
      "[" @punctuation.bracket.math.sub
      (text)
      "]" @punctuation.bracket.math.sub))
  (#any-of? @function.call "sub")
  (#set! @function.call conceal "")
  (#set! @operator.math.sub conceal "_"))

(code
  "#" @operator.math.sub
  (call
    item: (call
      item: (ident) @function.call
      (group) @_conceal)
    (content
      "[" @punctuation.bracket.math.sub
      (text)
      "]" @punctuation.bracket.math.sub))
  (#any-of? @function.call "sub")
  (#set! @function.call conceal "")
  (#set! @_conceal conceal "")
  (#set! @operator.math.sub conceal "_"))

; ------------------------------------------------------------------------------
;                                    MATH
; ------------------------------------------------------------------------------
([
  (ident)
  (field)
] @function.call.greek
  (#any-of? @function.call.greek
    "Alpha" "Beta" "Chi" "Delta" "Digamma" "Epsilon" "Eta" "Gamma" "Iota" "Kappa" "Lambda" "Mu" "Nu"
    "Omega" "Omega.inv" "Omicron" "Phi" "Pi" "Psi" "Rho" "Sigma" "Tau" "Theta" "Theta.alt" "Upsilon"
    "Xi" "Zeta" "alpha" "beta" "beta.alt" "chi" "delta" "digamma" "epsilon" "epsilon.alt"
    "epsilon.alt.rev" "epsilon.rev" "epsilon.rev.alt" "eta" "gamma" "iota" "iota.inv" "kappa"
    "kappa.alt" "lambda" "mu" "nu" "omega" "omicron" "phi" "phi.alt" "pi" "pi.alt" "psi" "rho"
    "rho.alt" "sigma" "sigma.alt" "tau" "theta" "theta.alt" "upsilon" "xi" "zeta")
  (#has-ancestor? @function.call.greek math)
  (#not-has-parent? @function.call.greek field call))

(call
  item: [
    (ident)
    (field)
  ] @function.call.greek
  (#any-of? @function.call.greek
    "Alpha" "Beta" "Chi" "Delta" "Digamma" "Epsilon" "Eta" "Gamma" "Iota" "Kappa" "Lambda" "Mu" "Nu"
    "Omega" "Omega.inv" "Omicron" "Phi" "Pi" "Psi" "Rho" "Sigma" "Tau" "Theta" "Theta.alt" "Upsilon"
    "Xi" "Zeta" "alpha" "beta" "beta.alt" "chi" "delta" "digamma" "epsilon" "epsilon.alt"
    "epsilon.alt.rev" "epsilon.rev" "epsilon.rev.alt" "eta" "gamma" "iota" "iota.inv" "kappa"
    "kappa.alt" "lambda" "mu" "nu" "omega" "omicron" "phi" "phi.alt" "pi" "pi.alt" "psi" "rho"
    "rho.alt" "sigma" "sigma.alt" "tau" "theta" "theta.alt" "upsilon" "xi" "zeta")
  (#has-ancestor? @function.call.greek math))

([
  ":"
  ";"
  ","
] @string
  (#not-has-parent? @string call)
  (#has-ancestor? @string math))

("(" @punctuation.bracket.delim
  (#any-of? @punctuation.bracket.delim "[" "{" "[|")
  (#has-ancestor? @punctuation.bracket.delim math))

(")" @punctuation.bracket.delim
  (#any-of? @punctuation.bracket.delim "]" "}")
  (#has-ancestor? @punctuation.bracket.delim math))

((symbol) @punctuation.bracket.delim
  (#any-of? @punctuation.bracket.delim "|" "||" "|]")
  (#has-ancestor? @punctuation.bracket.delim math))

(math
  "$" @markup.math.delim)

(call
  item: (ident) @function.call.math
  (#has-ancestor? @function.call.math math))

(call
  item: (ident) @function.call.math.operator
  (#has-ancestor? @function.call.math.operator math)
  (#any-of? @function.call.math.operator "frac"))

(call
  item: (ident) @function.call.delim
  (#has-ancestor? @function.call.delim math)
  (#any-of? @function.call.delim "abs" "binom" "ceil" "floor" "lr" "mat" "norm" "round" "vec"))

(attach
  [
    "^" @operator.math.sub
    sup: (letter) @conceal
    sup: (group
      [
        "("
        ")"
      ] @punctuation.bracket.math.sub)
  ]
  (#match? @conceal
    "^([0-9a-z]|[A-Z]|[*+=()\\-]|alpha|beta|gamma|delta|epsilon|theta|iota|phi|chi)$"))

(attach
  [
    "_" @operator.math.sub
    sub: (letter) @conceal
    sub: (group
      [
        "("
        ")"
      ] @punctuation.bracket.math.sub)
  ]
  (#match? @conceal "^([0-9aehijklmnoprstuvx]|[+\\-()=]|beta|gamma|rho|phi|chi)$"))

(attach
  sub: (letter) @conceal
  (#has-ancestor? @conceal math)
  (#match? @conceal "^[b-df-gqwyzA-Z]$"))

(attach
  "^" @operator.math.sub
  (symbol) @number
  (#eq? @number "*")
  (#set! @operator.math.sub conceal ""))

((symbol) @operator.math
  (#any-of? @operator.math "+" "-" "=")
  (#has-parent? @operator.math attach))

((call
  item: (ident) @function.call.math
  "("
  (formula
    (symbol) @operator.math)
  ")")
  (#eq? @operator.math "+")
  (#not-eq? @function.call.math "tensor")
  (#set! @operator.math conceal "＋"))

((call
  item: (ident) @function.call.math
  "("
  (formula
    (symbol) @operator.math)
  ")")
  (#eq? @operator.math "-")
  (#not-eq? @function.call.math "tensor")
  (#set! @operator.math conceal "－"))

((call
  item: (ident) @function.call.math
  "("
  (formula
    (symbol) @operator.math)
  ")")
  (#eq? @operator.math "=")
  (#not-eq? @function.call.math "tensor")
  (#set! @operator.math conceal "＝"))

((formula
  (symbol) @operator.math) @_formula
  (#eq? @operator.math "+")
  (#not-has-parent? @_formula call)
  (#set! @operator.math conceal "＋"))

((formula
  (symbol) @operator.math) @_formula
  (#eq? @operator.math "-")
  (#not-has-parent? @_formula call)
  (#set! @operator.math conceal "－"))

((formula
  (symbol) @operator.math) @_formula
  (#eq? @operator.math "=")
  (#not-has-parent? @_formula call)
  (#set! @operator.math conceal "＝"))

((symbol) @operator.math
  (#eq? @operator.math "+")
  (#not-has-parent? @operator.math attach formula)
  (#set! @operator.math conceal "＋"))

((symbol) @operator.math
  (#eq? @operator.math "-")
  (#not-has-parent? @operator.math attach formula)
  (#set! @operator.math conceal "－"))

((symbol) @operator.math
  (#eq? @operator.math "=")
  (#not-has-parent? @operator.math attach formula)
  (#set! @operator.math conceal "＝"))

((symbol) @operator.math
  (#eq? @operator.math "<")
  (#set! @operator.math conceal "ᐸ"))

((symbol) @operator.math
  (#eq? @operator.math ">")
  (#set! @operator.math conceal "ᐳ"))

((symbol
  ":" @operator.math)
  (#eq? @operator.math ":")
  (#has-ancestor? @operator.math math))

(fac
  "!" @operator.math
  (#set! @operator.math conceal "󰈅"))

(fraction
  "/" @operator.math)

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

(strong
  "*" @markup.quote.marker)

(emph
  "_" @markup.quote.marker)

(align
  "&" @function.call.delim)

(raw_span
  "`" @markup.raw.delimiter)

(raw_blck
  "```" @markup.raw.delimiter)

(raw_blck
  lang: (ident) @label
  (#set! @label conceal ""))

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
;                                  SYMBOLS
; ------------------------------------------------------------------------------
((shorthand) @character.special.ligatures
  (#any-of? @character.special.ligatures "..." "--" "---" "-?" "~"))

((letter) @conceal
  (#has-ancestor? @conceal math)
  (#not-has-parent? @conceal field call attach attach)
  (#match? @conceal "^[a-zA-Z]$"))

; only singe `i`
((attach
  .
  (letter) @character.special.ligatures)
  (#any-of? @character.special.ligatures "i"))

((formula
  .
  (letter) @character.special.ligatures .)
  (#any-of? @character.special.ligatures "i"))

((escape) @punctuation.special
  (#any-of? @punctuation.special
    "\\#" "\\$" "\\\\" "\\[" "\\]" "\\{" "\\}" "\\\"" "\\'" "\\`" "\\=" "\\-" "\\*" "\\+" "\\@"
    "\\<" "\\>" "\\/" "\\~" "\\_" "\\^" "\\&" "\\," "\\:" "\\;" "\\?" "\\!" "\\\\"))

; K Ω ℃  ℉  ㎐ ㎭ ㏛ ㎩ ㎏ ㏖ ㏝ ㏐ ㏓ ㏃ ㏉ ㏜ µ
([
  (ident)
  (field)
] @character.special.ligatures
  (#any-of? @character.special.ligatures
    "dif" "partial" "angstrom" "degree" "percent" "permille" "permyriad" "prime" "prime.double"
    "prime.double.rev" "prime.quad" "prime.rev" "prime.rev.double" "prime.rev.triple" "prime.triple"
    "prime.triple.rev" "ell" "planck" "Re" "Im")
  (#has-ancestor? @character.special.ligatures math)
  (#not-has-parent? @character.special.ligatures field call)
  (#set! priority 101))

(call
  item: (ident) @character.special.ligatures
  (#any-of? @character.special.ligatures "dif" "partial" )
  (#has-ancestor? @character.special.ligatures math formula))

([
  (ident)
  (field)
] @punctuation.bracket.delim
  (#any-of? @punctuation.bracket.delim
    "bar" "bar.broken" "bar.broken.v" "bar.double" "bar.double.v" "bar.triple" "bar.triple.v"
    "bar.v" "bar.v.broken" "bar.v.double" "bar.v.triple" "brace" "brace.l" "brace.l.stroked"
    "brace.r" "brace.r.stroked" "brace.stroked" "brace.stroked.l" "brace.stroked.r" "bracket"
    "bracket.l" "bracket.l.stroked" "bracket.r" "bracket.r.stroked" "bracket.stroked"
    "bracket.stroked.l" "bracket.stroked.r" "ceil" "ceil.l" "ceil.r" "chevron" "chevron.closed"
    "chevron.closed.l" "chevron.closed.r" "chevron.curly" "chevron.curly.l" "chevron.curly.r"
    "chevron.dot" "chevron.dot.l" "chevron.dot.r" "chevron.double" "chevron.double.l"
    "chevron.double.r" "chevron.l" "chevron.l.closed" "chevron.l.curly" "chevron.l.dot"
    "chevron.l.double" "chevron.r" "chevron.r.closed" "chevron.r.curly" "chevron.r.dot"
    "chevron.r.double" "fence" "fence.dotted" "fence.double" "fence.double.l" "fence.double.r"
    "fence.l" "fence.l.double" "fence.r" "fence.r.double" "floor" "floor.l" "floor.r" "mustache"
    "mustache.l" "mustache.r" "paren" "paren.closed" "paren.closed.l" "paren.closed.r" "paren.flat"
    "paren.flat.l" "paren.flat.r" "paren.l" "paren.l.closed" "paren.l.flat" "paren.l.stroked"
    "paren.r" "paren.r.closed" "paren.r.flat" "paren.r.stroked" "paren.stroked" "paren.stroked.l"
    "paren.stroked.r" "shell" "shell.filled" "shell.filled.l" "shell.filled.r" "shell.l"
    "shell.l.filled" "shell.l.stroked" "shell.r" "shell.r.filled" "shell.r.stroked" "shell.stroked"
    "shell.stroked.l" "shell.stroked.r")
  (#not-has-parent? @punctuation.bracket.delim field call)
  (#has-ancestor? @punctuation.bracket.delim math))

; ------------------------------------------------------------------------------
;                                   PHISICS
; ------------------------------------------------------------------------------
([
  (ident)
  (field)
] @character.special.ligatures
  (#any-of? @character.special.ligatures "curl" "div" "grad" "hbar" "laplacian")
  (#has-ancestor? @character.special.ligatures math)
  (#not-has-parent? @character.special.ligatures field call)
  (#set! priority 101))

(call
  item: (ident) @function.call.special
  (#any-of? @function.call.special
    "Order" "curl" "dd" "difference" "div" "dv" "grad" "laplacian" "order" "pdv" "scripts" "va"
    "var")
  (#has-ancestor? @function.call.special math formula))

(call
  item: (ident) @function.call.delim
  (#any-of? @function.call.delim
    "Set" "admat" "bra" "braket" "dmat" "evaluated" "expval" "grammat" "hmat" "imat" "iprod" "jmat"
    "ket" "ketbra" "mdet" "mel" "op" "rot2mat" "rot3xmat" "rot3ymat" "rot3zmat" "vecrow" "xmat"
    "zmat")
  (#has-ancestor? @function.call.delim math formula))

(call
  item: (ident) @function.call.special
  "("
  (formula
    (_) @markup.strong .)
  ")"
  (#has-ancestor? @function.call.special math formula)
  (#any-of? @function.call.special "vb" "vu"))

(attach
  (_)
  sup: (_) @function.call.special
  (#has-ancestor? @function.call.special math formula)
  (#any-of? @function.call.special "dagger" "TT"))

((call
  item: (ident) @function.call.math
  "("
  .
  (formula
    [
      (ident)
      (letter)
      (symbol)
    ] @character.special.ligatures)
  ")")
  (#has-ancestor? @function.call.math math formula)
  (#eq? @function.call.math "tensor"))

((call
  item: (ident) @function.call.math
  "("
  (formula
    .
    (symbol) @operator.math.sub)
  ")")
  (#has-ancestor? @function.call.math math formula)
  (#eq? @function.call.math "tensor")
  (#eq? @operator.math.sub "+"))

((call
  item: (ident) @function.call.math
  "("
  (formula
    .
    (symbol) @operator.math.sub)
  ")")
  (#has-ancestor? @function.call.math math formula)
  (#eq? @function.call.math "tensor")
  (#eq? @operator.math.sub "-"))

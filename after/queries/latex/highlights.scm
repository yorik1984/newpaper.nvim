; extends

(ERROR) @error

;
; Special thanks to [VimTeX](https://github.com/lervag/vimtex) for the regular expressions used for syntax highlighting.
;
(key_value_pair
  key: (text) @variable.parameter)

(key_value_pair
  key: (text
    word: (operator) @variable.parameter @nospell))

(value
  (text
    [
      word: (word) @number
      word: (operator) @function
    ])
  (#match? @number "^[0-9]+([.,][0-9]+)?[ ]*(true)?[ ]*(bp|cc|cm|dd|em|ex|in|mm|pc|pt|sp)$"))

(generic_command
  (curly_group
    (text
      [
        word: (word) @number
        word: (operator) @function
      ])
    (#match? @number "^[0-9]+([.,][0-9]+)?[ ]*(true)?[ ]*(bp|cc|cm|dd|em|ex|in|mm|pc|pt|sp)$")))

(key_value_pair
  [
    "=" @function
    (operator) @function
  ])

(brack_group_key_value
  [
    "," @punctuation.dot
    "=" @function
    (operator) @function
  ])

(brack_group
  (text
    word: (word) @variable.parameter))

(class_include
  command: "\\documentclass" @keyword
  path: (curly_group_path) @function)

(package_include
  command: [
    "\\usepackage"
    "\\RequirePackage"
  ] @module
  paths: (curly_group_path_list) @string)

(author_declaration
  command: "\\author" @keyword)

(author
  (text) @function)

(title_declaration
  command: _ @keyword.type)

(verbatim_include
  command: [
    "\\verbatiminput"
    "\\VerbatimInput"
  ] @keyword.import.verb)

(verbatim_environment
  verbatim: (comment) @comment.verb)

; MATH
(generic_command
  (command_name) @markup.math.delim
  arg: (curly_group
    [
      "{"
      "}"
    ] @function.math.bracket)
  (#not-has-ancestor? @markup.math.delim displayed_equation inline_formula math_environment)
  (#eq? @markup.math.delim "\\ensuremath"))

(generic_command
  (command_name) @function.math
  (#has-ancestor? @function.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math text_mode))

(generic_command
  (command_name) @character.special
  (#lua-match? @character.special "^\\[%$&%%#{}%/_,;:!>%@|\\]$"))

(theorem_definition
  title: (curly_group
    (_) @label.math @nospell))

((letter) @number
  (#lua-match? @number "^%d+$"))

(text
  word: (word) @number
  (#has-ancestor? @number displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @number text_mode)
  (#lua-match? @number "^%d+$"))

(text
  word: (word) @number.float
  (#has-ancestor? @number.float displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @number.float text_mode)
  (#lua-match? @number.float "^%d+%.%d+$"))

; CYRILLIC
; highlight cyrillic (U+0400-U+052F, 304 symbols) when mixed with latin
; error in math and highlight full token
(text
  word: (word) @string.special.cyrmath
  (#has-ancestor? @string.special.cyrmath displayed_equation inline_formula math_environment)
  (#match? @string.special.cyrmath "[\\u0400-\\u052F]"))

; not an error in text, just visual accent
(text
  word: (word) @string.special.cyrtext @spell
  (#match? @string.special.cyrtext "[\\u0400-\\u052F]")
  (#has-ancestor? @string.special.cyrtext text_mode))

; UNICODE
; highlight all unicode except cyrillic when mixed with latin
; not an error, just visual accent
(text
  word: (word) @string.special.unicodemath
  (#match? @string.special.unicodemath "[^\\x00-\\x7F\\x09\\x0D\\x0A\\u0400-\\u052F]+")
  (#has-ancestor? @string.special.unicodemath displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @string.special.unicodemath text_mode))

(text
  word: (word) @string.special.unicodetext @spell
  (#match? @string.special.unicodetext "[^\\x00-\\x7F\\x09\\x0D\\x0A\\u0400-\\u052F]+")
  (#has-ancestor? @string.special.unicodetext text_mode))

(math_environment
  (begin
    name: (curly_group_text
      (text) @label.math @nospell))
  (end
    name: (curly_group_text
      (text) @label.math @nospell)))

; ============================ CONCEAL IN COMMANDS =============================
([
  (part
    [
      command: _ @keyword.type
      command: _ @keyword.type.section
    ])
  (chapter
    [
      command: _ @keyword.type
      command: _ @keyword.type.section
    ])
  (section
    [
      command: _ @keyword.type
      command: _ @keyword.type.section
    ])
  (subsection
    [
      command: _ @keyword.type
      command: _ @keyword.type.section
    ])
  (subsubsection
    [
      command: _ @keyword.type
      command: _ @keyword.type.section
    ])
  (paragraph
    [
      command: _ @keyword.type
      command: _ @keyword.type.section
    ])
  (subparagraph
    [
      command: _ @keyword.type
      command: _ @keyword.type.section
    ])
]
  (#match? @keyword.type "[^*]$")
  (#match? @keyword.type.section "[*]$")
  (#set! @keyword.type conceal "󰚟")
  (#set! @keyword.type.section conceal "§"))

((brack_group) @_bark_group
  (#has-parent? @_bark_group part chapter section subsection subsubsection paragraph subparagraph)
  (#set! conceal ""))

((curly_group
  [
    "{"
    "}"
  ] @punctuation.bracket) @_curly_group
  (#has-parent? @_curly_group part chapter section subsection subsubsection paragraph subparagraph)
  (#set! @punctuation.bracket conceal " "))

(enum_item
  [
    command: "\\item" @punctuation.special
    command: "\\item*" @punctuation.special.others
  ]
  (#eq? @punctuation.special "\\item")
  (#eq? @punctuation.special.others "\\item*")
  (#set! @punctuation.special conceal "○")
  (#set! @punctuation.special.others conceal "●"))

; Citation and others reference
(label_definition
  command: _ @markup.link.ref
  name: (curly_group_label
    [
      "{"
      "}"
    ] @punctuation.bracket.ref)
  (#set! @markup.link.ref conceal "󰓼")
  (#set! @punctuation.bracket.ref conceal " "))

(label_reference_range
  from: (curly_group_label
    [
      "{"
      "}"
    ] @punctuation.bracket.ref)
  to: (curly_group_label
    [
      "{"
      "}"
    ] @punctuation.bracket.ref))

(label_reference_range
  command: _ @markup.link.ref
  from: (curly_group_label
    "{" @_space_conceal
    "}" @_dash_conceal)
  to: (curly_group_label
    "{" @_empty_conceal
    "}" @_space_conceal)
  (#set! @markup.link.ref conceal "󱋷")
  (#set! @_dash_conceal conceal "–")
  (#set! @_space_conceal conceal " ")
  (#set! @_empty_conceal conceal ""))

(label_reference
  command: _ @markup.link.ref
  [
    names: (curly_group_label_list
      [
        "{"
        "}"
      ] @punctuation.bracket.ref)
    names: (curly_group_label_list
      "," @punctuation.dot)
  ]
  (#set! @markup.link.ref conceal "")
  (#set! @punctuation.bracket.ref conceal " "))

(label_number
  command: _ @markup.link.ref
  name: (curly_group_label
    [
      "{"
      "}"
    ] @punctuation.bracket.ref)
  [
    number: (curly_group
      [
        "{"
        "}"
      ] @punctuation.bracket.ref)
    number: (curly_group
      (curly_group
        [
          "{" @_left_conceal
          "}" @_right_conceal
        ]))
  ]
  (#set! @markup.link.ref conceal "󱈢")
  (#set! @_left_conceal conceal "[")
  (#set! @_right_conceal conceal "]")
  (#set! @punctuation.bracket.ref conceal " "))

(citation
  command: _ @function.macro.cite
  keys: (curly_group_text_list
    [
      "{"
      "}"
    ] @punctuation.bracket.cite))

(citation
  command: _ @_com_conceal
  [
    (brack_group
      "[" @_left_conceal
      "]" @_right_conceal)
    keys: (curly_group_text_list
      "{" @_empty_conceal
      "}" @_conceal)
  ]
  (#set! @_com_conceal conceal "«")
  (#set! @_left_conceal conceal "[")
  (#set! @_right_conceal conceal "]")
  (#set! @_empty_conceal conceal "")
  (#set! @_conceal conceal "»"))

(caption
  command: _ @_com_conceal
  [
    short: (brack_group) @_empty_conceal
    long: (curly_group
      [
        "{"
        "}"
      ] @_space_conceal)
    (text) @comment.verb
  ]
  (#set! @_empty_conceal conceal "")
  (#set! @_space_conceal conceal " ")
  (#set! @_com_conceal conceal ""))

; MATH
(displayed_equation
  [
    "$$" @_empty_conceal
    "\\[" @_conceal
    "\\]" @_empty_conceal
  ] @markup.math.delim
  (#set! @_empty_conceal conceal "")
  (#set! @_conceal conceal "󱖦"))

(inline_formula
  [
    "$"
    "\\("
    "\\)"
  ] @markup.math.delim
  (#set! conceal ""))

; ============================== CONCEAL COMMENTS ==============================
([
  (line_comment)
  (block_comment)
  (comment_environment)
] @comment
  (#set! conceal "⋯"))

; ------------------------------------------------------------------------------
;                         CONCEAL IN TEXT AND MATH MODE
; ------------------------------------------------------------------------------
; COMMANDS
(generic_command
  (command_name) @function
  (#any-of? @function "\\smallskip" "\\medskip" "\\bigskip" "\\hfill" "\\vfill" "\\fill")
  (#set! conceal ""))

(generic_command
  (command_name) @function
  (#any-of? @function "\\hspace" "\\vspace")
  (curly_group) @function
  (#set! conceal ""))

(generic_command
  (command_name) @function
  (curly_group
    (text) @none.comment)
  (#any-of? @function "\\phantom" "\\hphantom" "\\vphantom"))

(generic_command
  (command_name) @function
  (curly_group
    (text) @none.accent)
  (#eq? @function "\\fbox"))

(generic_command
  (command_name) @function
  (curly_group
    (text) @none.fill)
  (#eq? @function "\\mbox"))

(generic_command
  (command_name) @function
  (curly_group
    [
      "{"
      "}"
    ] @function)
  (#any-of? @function "\\phantom" "\\hphantom" "\\vphantom" "\\fbox" "\\mbox")
  (#set! conceal ""))

; ------------------------------------------------------------------------------
;                             CONCEAL IN TEXT MODE
; ------------------------------------------------------------------------------
; WARN: conceal in math mode too. Treesitter not a linter!
(text_mode
  command: [
    "\\text"
    "\\intertext"
    "\\shortintertext"
  ] @function.math.markup
  content: (curly_group
    [
      "{"
      "}"
    ] @function.math.bracket)
  (#has-ancestor? @function.math.markup displayed_equation inline_formula math_environment)
  (#set! conceal ""))

; COMMANDS
(generic_command
  (command_name) @function
  (#any-of? @function
    "\\centering" "\\raggedleft" "\\raggedright" "\\clearpage" "\\newpage" "\\linebreak"
    "\\pagebreak" "\\nolinebreak" "\\nopagebreak" "\\indent" "\\noindent" "\\enlargethispage")
  (#set! conceal ""))

(generic_command
  (command_name) @function
  (curly_group
    [
      "{"
      "}"
    ] @function.bracket)
  (#any-of? @function
    "\\textbf" "\\textit" "\\textlf" "\\textmd" "\\textrm" "\\textsc" "\\textsl" "\\textsf"
    "\\texttc" "\\texttt" "\\textulc" "\\textup" "\\textnormal" "\\emph" "\\rmfamily" "\\sffamily"
    "\\ttfamily" "\\itshape" "\\scshape" "\\slshape" "\\upshape" "\\bfseries" "\\mdseries")
  (#set! conceal ""))

(generic_command
  (command_name) @function
  (#any-of? @function
    "\\tiny" "\\scriptsize" "\\footnotesize" "\\normalsize" "\\small" "\\large" "\\Large" "\\LARGE"
    "\\huge" "\\Huge" "\\normalfont")
  (#set! conceal ""))

; ------------------------------------------------------------------------------
;                              CONCEAL IN MATH MODE
; ------------------------------------------------------------------------------
(generic_command
  command: (command_name) @function.math.markup
  (curly_group
    [
      "{"
      "}"
    ] @function.math.bracket)
  (#any-of? @function.math.markup
    "\\mathrm" "\\mathtt" "\\mathsf" "\\mathnormal" "\\mathbf" "\\mathit" "\\mathcal" "\\mathbfit"
    "\\mathbb" "\\mathfrak" "\\mathscr" "\\mathds" "\\mathbbm" "\\mathbbb")
  (#has-ancestor? @function.math.markup displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.markup text_mode)
  (#set! conceal ""))

(generic_command
  command: (command_name) @punctuation.delimiter
  (#match? @punctuation.delimiter "^\\\\[bB]igg?m?$")
  (#has-ancestor? @punctuation.delimiter displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @punctuation.delimiter text_mode)
  (#set! conceal ""))

(generic_command
  command: (command_name) @function.math.markup
  (#any-of? @function.math.markup "\\quad" "\\qquad" "\\thinspace" "\\medspace" "\\thickspace")
  (#has-ancestor? @function.math.markup displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.markup text_mode)
  (#set! conceal ""))

; SUPER AND SUBSCRIPT
(superscript
  (command_name) @function.math)

(superscript
  "^" @operator.math.sub)

(superscript
  (curly_group
    "{" @punctuation.bracket.math.sub)
  (#set! conceal "("))

(superscript
  (curly_group
    "}" @punctuation.bracket.math.sub)
  (#set! conceal ")"))

(superscript
  (curly_group
    "{" @_conceal
    .
    [
      (text_mode)
      (generic_command
        (command_name) .)
      (text
        .
        word: (word) .)
    ]
    .
    "}" @_conceal)
  (#set! @_conceal conceal ""))

(subscript
  (command_name) @function.math)

(subscript
  "_" @operator.math.sub
  (#has-ancestor? @operator.math.sub displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math.sub text_mode))

(subscript
  (curly_group
    "{" @punctuation.bracket.math.sub)
  (#set! conceal "("))

(subscript
  (curly_group
    "}" @punctuation.bracket.math.sub)
  (#set! conceal ")"))

(subscript
  (curly_group
    "{" @_conceal
    .
    [
      (text_mode)
      (generic_command
        (command_name) .)
      (text
        .
        word: (word) .)
    ]
    .
    "}" @_conceal)
  (#set! @_conceal conceal ""))

; FRAC FUNCTIONS
; convert from
; \frac{expression_1}{expression_2}
; to
; expression_1expression_2
; hide \frac when with ``, `(` and `)`
((generic_command
  (command_name) @function.math.operator
  (curly_group
    "{" @punctuation.bracket.math
    .
    [
      ((generic_command
        (command_name) .)
        .
        (text
          word: (subscript))?
        .
        (text
          word: (superscript))? .)
      (text
        .
        word: (word) .)
      (text
        .
        word: (word)
        .
        [
          word: (subscript)
          word: (superscript)
        ] .)
      (curly_group)
    ]
    .
    "}" @punctuation.bracket.math)
  .
  (curly_group
    "{" @operator.math.slash
    .
    [
      ((generic_command
        (command_name) .)
        .
        (text
          word: (subscript))?
        .
        (text
          word: (superscript))? .)
      (text
        .
        word: (word) .)
      (text
        .
        word: (word)
        .
        [
          word: (subscript)
          word: (superscript)
        ] .)
      (curly_group)
    ]
    .
    "}" @punctuation.bracket.math) .)
  (#any-of? @function.math.operator "\\frac" "\\dfrac" "\\tfrac" "\\cfrac")
  (#has-ancestor? @function.math.operator displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.operator text_mode)
  (#set! @punctuation.bracket.math conceal "")
  (#set! @operator.math.slash conceal "")
  (#set! @function.math.operator conceal ""))

; \command{{long_expression}}
;          ^               ^
; conceal inner to
; {(long_expression)}
(generic_command
  (command_name) @_com
  (curly_group
    .
    (curly_group
      "{" @punctuation.bracket.math.left
      "}" @punctuation.bracket.math.right) .)
  (#has-ancestor? @_com displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @_com text_mode)
  (#set! @punctuation.bracket.math.left conceal "(")
  (#set! @punctuation.bracket.math.right conceal ")"))

; TRIGONOMETRIC
(generic_command
  command: (command_name) @function.math.trig
  (#any-of? @function.math.trig
    "\\sin" "\\cos" "\\tan" "\\cot" "\\sec" "\\csc" "\\sinh" "\\cosh" "\\tanh" "\\coth" "\\arcsin"
    "\\arccos" "\\arctan" "\\exp" "\\ker" "\\deg" "\\gcd" "\\lg" "\\ln" "\\max" "\\min" "\\Pr"
    "\\sup" "\\arg" "\\det" "\\dim" "\\hom" "\\log" "\\lim" "\\liminf" "\\limsup")
  (#has-ancestor? @function.math.trig displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.trig text_mode))

; Halfwidth and Fullwidth Forms
; ＝＋－＊／ ＜ ＞！：￨
; ？；，．･＂ ＃ ＄ ％ ＆（ ） ０１２３４５６７８９＠［］＼＾＿｛｝～｟｠￢￣￤
; ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ
; ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ
; ￠￡￥￦
;
; OPERATORS
((operator
  "*" @punctuation.dot)
  (#set! @punctuation.dot conceal "＊"))

([
  (operator)
  "="
] @operator.math
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode))

("=" @operator.math
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "＝"))

((operator
  "+" @operator.math)
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "＋"))

((operator
  "-" @operator.math)
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "－"))

((operator
  "*" @operator.math)
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "✕"))

((operator
  "/" @operator.math)
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal ""))

((operator
  "<" @operator.math)
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "ᐸ"))

((operator
  ">" @operator.math)
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "ᐳ"))

((operator
  "!" @operator.math)
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "！"))

((operator
  "|" @operator.math)
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "│"))

((operator
  ":" @operator.math)
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "："))

((operator
  "'" @operator.math)
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "ˈ"))

; ------------------------------------------------------------------------------
;                                CONCEAL SYMBOLS
; ------------------------------------------------------------------------------
; Special keys
(generic_command
  (command_name) @function.math.operator
  (#eq? @function.math.operator "\\cdot")
  (#has-ancestor? @function.math.operator displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.operator text_mode)
  (#set! @function.math.operator conceal "⋅"))

(generic_command
  (command_name) @function.math.operator
  (#eq? @function.math.operator "\\cdots")
  (#has-ancestor? @function.math.operator displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.operator text_mode)
  (#set! @function.math.operator conceal "⋯"))

(generic_command
  (command_name) @function.math.operator
  (#any-of? @function.math.operator "\\ldots" "\\dots")
  (#has-ancestor? @function.math.operator displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.operator text_mode)
  (#set! @function.math.operator conceal "…"))

(generic_command
  (command_name) @function.math.operator
  (#eq? @function.math.operator "\\colon")
  (#has-ancestor? @function.math.operator displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.operator text_mode)
  (#set! @function.math.operator conceal "："))

; All modes
(generic_command
  command: (command_name) @_conceal
  (#lua-match? @_conceal "^\\\\$")
  (#set! conceal "⏎"))

(generic_command
  (command_name) @_conceal
  (#lua-match? @_conceal "^\\[>@ ]$")
  (#set! conceal " "))

(generic_command
  (command_name) @_conceal
  (#eq? @_conceal "\\$")
  (#set! conceal "＄"))

(generic_command
  (command_name) @_conceal
  (#eq? @_conceal "\\&")
  (#set! conceal "＆"))

(generic_command
  (command_name) @_conceal
  (#eq? @_conceal "\\%")
  (#set! conceal "％"))

(generic_command
  (command_name) @_conceal
  (#eq? @_conceal "\\#")
  (#set! conceal "＃"))

(generic_command
  (command_name) @_conceal
  (#eq? @_conceal "\\_")
  (#set! conceal "_"))

(generic_command
  command: (command_name) @_conceal
  (#eq? @_conceal "\\slash")
  (#set! conceal ""))

; --------------------------------- TEXT MODE ----------------------------------
; WARN: conceal works in both modes, but the commands work only in text mode
; Math and technical symbols
(generic_command
  (command_name) @function
  (#eq? @function "\\textdegree")
  (#set! conceal "°"))

(generic_command
  (command_name) @function
  (#eq? @function "\\textcelsius")
  (#set! conceal "℃"))

(generic_command
  (command_name) @function
  (#eq? @function "\\textdiv")
  (#set! conceal "÷"))

(generic_command
  (command_name) @function
  (#eq? @function "\\texttimes")
  (#set! conceal "✕"))

(generic_command
  (command_name) @function
  (#eq? @function "\\textminus")
  (#set! conceal "－"))

(generic_command
  (command_name) @function
  (#eq? @function "\\textpm")
  (#set! conceal "󰦒"))

(generic_command
  (command_name) @function
  (#eq? @function "\\textsurd")
  (#set! conceal "√"))

(generic_command
  (command_name) @function
  (#eq? @function "\\textperthousand")
  (#set! conceal "‰"))

(generic_command
  (command_name) @function
  (#eq? @function "\\textpertenthousand")
  (#set! conceal "‱"))

(generic_command
  (command_name) @function
  (#eq? @function "\\textasciitilde")
  (#set! conceal "～"))

; Punctuation and special characters
(generic_command
  (command_name) @function
  (#eq? @function "\\textemdash")
  (#set! conceal "–"))

(generic_command
  (command_name) @function
  (#eq? @function "\\textendash")
  (#set! conceal "–"))

(generic_command
  (command_name) @function
  (#eq? @function "\\textquestiondown")
  (#set! conceal "¿"))

(generic_command
  (command_name) @function
  (#eq? @function "\\textexclamdown")
  (#set! conceal "¡"))

; --------------------------------- MATH MODE ----------------------------------
; WARN: conceal works in both modes, but the commands work only in math mode
;
; ============================ CONCEAL MATH SYMBOLS ============================
(generic_command
  command: (command_name) @_conceal
  (#eq? @_conceal "\\tilde")
  (#set! conceal "～"))

((command_name) @punctuation.delimiter
  (#any-of? @punctuation.delimiter "\\lvert" "\\rvert")
  (#set! conceal "│"))

((command_name) @punctuation.delimiter
  (#any-of? @punctuation.delimiter "\\lVert" "\\rVert")
  (#set! conceal "‖"))

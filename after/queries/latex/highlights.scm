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

; ================================ TEXT MODE ===================================
(generic_command
  command: (command_name) @function
  (#has-ancestor? @function text_mode))

; =================================== MATH =====================================
(generic_command
  command: (command_name) @markup.math.delim
  arg: (curly_group
    [
      "{"
      "}"
    ] @function.math.bracket)
  (#not-has-ancestor? @markup.math.delim displayed_equation inline_formula math_environment)
  (#eq? @markup.math.delim "\\ensuremath"))

(generic_command
  command: (command_name) @function.math
  (#has-ancestor? @function.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math text_mode)
  (#not-any-of? @function.math
    "\\frac" "\\dfrac" "\\tfrac" "\\cfrac" "\\sqrt" "\\mathnormal" "\\mathrm" "\\mathit" "\\mathbf"
    "\\mathsf" "\\mathtt" "\\mathbfup" "\\mathbfit" "\\mathsfup" "\\mathsfit" "\\mathbfsf"
    "\\mathbfsfup" "\\mathbfsfit" "\\mathcal" "\\mathbfcal" "\\mathscr" "\\mathbfscr" "\\mathbb"
    "\\mathbbit" "\\mathfrak" "\\mathbffrak" "\\bm" "\\symup" "\\symit" "\\symbf" "\\symsf"
    "\\symtt" "\\symbfup" "\\symbfit" "\\symsfup" "\\symsfit" "\\symbfsf" "\\symbfsfup"
    "\\symbfsfit" "\\symcal" "\\symbfcal" "\\symscr" "\\symbfscr" "\\symbb" "\\symbbit" "\\symfrak"
    "\\symbffrak" "\\tiny" "\\scriptsize" "\\footnotesize" "\\normalsize" "\\small" "\\large"
    "\\Large" "\\LARGE" "\\huge" "\\Huge" "\\normalfont" "\\centering" "\\raggedleft"
    "\\raggedright" "\\clearpage" "\\newpage" "\\linebreak" "\\pagebreak" "\\nolinebreak"
    "\\nopagebreak" "\\indent" "\\noindent" "\\enlargethispage" "\\quad" "\\qquad" "\\thinspace"
    "\\medspace" "\\thickspace" "\\smallskip" "\\medskip" "\\bigskip" "\\hfill" "\\vfill" "\\fill"
    "\\phantom" "\\hphantom" "\\vphantom" "\\fbox" "\\mbox" "\\hspace" "\\vspace" "\\sin" "\\cos"
    "\\tan" "\\cot" "\\sec" "\\csc" "\\sinh" "\\cosh" "\\tanh" "\\coth" "\\arcsin" "\\arccos"
    "\\arctan" "\\exp" "\\ker" "\\deg" "\\gcd" "\\lg" "\\ln" "\\max" "\\min" "\\Pr" "\\sup" "\\arg"
    "\\det" "\\dim" "\\hom" "\\log" "\\lim" "\\liminf" "\\limsup"))

(generic_command
  command: (command_name) @function.math.operator
  (curly_group
    [
      "{"
      "}"
    ] @punctuation.bracket.math)
  (#has-ancestor? @function.math.operator displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.operator text_mode)
  (#any-of? @function.math.operator "\\frac" "\\dfrac" "\\tfrac" "\\cfrac"))

(generic_command
  command: (command_name) @function.math.operator
  (#has-ancestor? @function.math.operator displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.operator text_mode)
  (#any-of? @function.math.operator "\\sqrt"))

(generic_command
  command: (command_name) @character.special
  (#lua-match? @character.special "^\\[ %$&%%#{}%/_,;:!>%@|\\]$"))

(theorem_definition
  title: (curly_group
    (_) @label.math @nospell))

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
  (#has-ancestor? @string.special.cyrtext text_mode)
  (#match? @string.special.cyrtext "[\\u0400-\\u052F]"))

; UNICODE
; highlight all unicode except cyrillic when mixed with latin
; not an error, just visual accent
(text
  word: (word) @string.special.unicodemath
  (#has-ancestor? @string.special.unicodemath displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @string.special.unicodemath text_mode)
  (#match? @string.special.unicodemath "[^\\x00-\\x7F\\x09\\x0D\\x0A\\u0400-\\u052F]+"))

(text
  word: (word) @string.special.unicodetext @spell
  (#has-ancestor? @string.special.unicodetext text_mode)
  (#match? @string.special.unicodetext "[^\\x00-\\x7F\\x09\\x0D\\x0A\\u0400-\\u052F]+"))

(math_environment
  (begin
    name: (curly_group_text
      (text) @label.math @nospell))
  (end
    name: (curly_group_text
      (text) @label.math @nospell)))

; SUPER AND SUBSCRIPT
(superscript
  "^" @operator.math.sub
  (#has-ancestor? @operator.math.sub displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math.sub text_mode))

(superscript
  (letter) @conceal
  (#has-ancestor? @conceal displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @conceal text_mode))

(superscript
  (letter) @number
  (#has-ancestor? @number displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @number text_mode)
  (#lua-match? @number "^%d+$"))

(superscript
  superscript: (curly_group
    [
      "{"
      "}"
    ]) @punctuation.bracket.math.sub
  (#has-ancestor? @punctuation.bracket.math.sub displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @punctuation.bracket.math.sub text_mode))

(subscript
  "_" @operator.math.sub
  (#has-ancestor? @operator.math.sub displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math.sub text_mode))

(subscript
  (letter) @conceal
  (#has-ancestor? @conceal displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @conceal text_mode))

(subscript
  (letter) @number
  (#has-ancestor? @number displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @number text_mode)
  (#lua-match? @number "^%d+$"))

(subscript
  subscript: (curly_group
    [
      "{"
      "}"
    ]) @punctuation.bracket.math.sub
  (#has-ancestor? @punctuation.bracket.math.sub displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @punctuation.bracket.math.sub text_mode))

; TRIGONOMETRIC
(generic_command
  command: (command_name) @function.math.trig
  (#has-ancestor? @function.math.trig displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.trig text_mode)
  (#any-of? @function.math.trig
    "\\sin" "\\cos" "\\tan" "\\cot" "\\sec" "\\csc" "\\sinh" "\\cosh" "\\tanh" "\\coth" "\\arcsin"
    "\\arccos" "\\arctan" "\\exp" "\\ker" "\\deg" "\\gcd" "\\lg" "\\ln" "\\max" "\\min" "\\Pr"
    "\\sup" "\\arg" "\\det" "\\dim" "\\hom" "\\log" "\\lim" "\\liminf" "\\limsup"))

(displayed_equation
  [
    "$$"
    "\\["
    "\\]"
  ] @markup.math.delim)

(inline_formula
  [
    "$"
    "\\("
    "\\)"
  ] @markup.math.delim)

; ============================ CONCEAL IN COMMANDS =============================
([
  (part
    [
      command: _ @keyword.type
      command: _ @keyword.type.section
      (brack_group) @_bark_group
      (curly_group
        [
          "{"
          "}"
        ] @punctuation.bracket)
    ])
  (chapter
    [
      command: _ @keyword.type
      command: _ @keyword.type.section
      (brack_group) @_bark_group
      (curly_group
        [
          "{"
          "}"
        ] @punctuation.bracket)
    ])
  (section
    [
      command: _ @keyword.type
      command: _ @keyword.type.section
      (brack_group) @_bark_group
      (curly_group
        [
          "{"
          "}"
        ] @punctuation.bracket)
    ])
  (subsection
    [
      command: _ @keyword.type
      command: _ @keyword.type.section
      (brack_group) @_bark_group
      (curly_group
        [
          "{"
          "}"
        ] @punctuation.bracket)
    ])
  (subsubsection
    [
      command: _ @keyword.type
      command: _ @keyword.type.section
      (brack_group) @_bark_group
      (curly_group
        [
          "{"
          "}"
        ] @punctuation.bracket)
    ])
  (paragraph
    [
      command: _ @keyword.type
      command: _ @keyword.type.section
      (brack_group) @_bark_group
      (curly_group
        [
          "{"
          "}"
        ] @punctuation.bracket)
    ])
  (subparagraph
    [
      command: _ @keyword.type
      command: _ @keyword.type.section
      (brack_group) @_bark_group
      (curly_group
        [
          "{"
          "}"
        ] @punctuation.bracket)
    ])
]
  (#match? @keyword.type "[^*]$")
  (#match? @keyword.type.section "[*]$")
  (#set! @_bark_group conceal "")
  (#set! @punctuation.bracket conceal " ")
  (#set! @keyword.type conceal "󰚟")
  (#set! @keyword.type.section conceal "§"))

; Citation and others reference
(label_definition
  command: _ @markup.link.ref
  name: (curly_group_label
    "{" @punctuation.bracket.ref
    (_) @markup.link.label
    "}" @punctuation.bracket.ref)
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
    [
      "{" @_space_conceal
      "}" @_dash_conceal
    ])
  to: (curly_group_label
    [
      "{" @_empty_conceal
      "}" @_space_conceal
    ])
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
    "{" @punctuation.bracket.ref
    (_) @markup.link.label
    "}" @punctuation.bracket.ref)
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
      [
        "[" @_left_conceal
        "]" @_right_conceal
      ])
    keys: (curly_group_text_list
      [
        "{" @_empty_conceal
        "}" @_conceal
      ])
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

; ============================== CONCEAL COMMENTS ==============================
([
  (line_comment)
  (block_comment)
  (comment_environment)
] @comment
  (#set! conceal "⋯"))

; ------------------------------------------------------------------------------
;                                   SPACE
; ------------------------------------------------------------------------------
; fill and space
(generic_command
  command: (command_name) @cmd
  (#any-of? @cmd "\\hfill")
  (#set! conceal ""))

(generic_command
  command: (command_name) @_cmd
  (#any-of? @_cmd
    "\\centering" "\\raggedleft" "\\raggedright" "\\clearpage" "\\newpage" "\\linebreak"
    "\\pagebreak" "\\nolinebreak" "\\nopagebreak" "\\indent" "\\noindent" "\\enlargethispage"
    "\\smallskip" "\\medskip" "\\bigskip" "\\vfill" "\\fill")
  (#not-has-ancestor? @_cmd displayed_equation inline_formula math_environment)
  (#set! conceal ""))

(generic_command
  command: (command_name) @_cmd
  (#any-of? @_cmd
    "\\centering" "\\raggedleft" "\\raggedright" "\\clearpage" "\\newpage" "\\linebreak"
    "\\pagebreak" "\\nolinebreak" "\\nopagebreak" "\\indent" "\\noindent" "\\enlargethispage"
    "\\smallskip" "\\medskip" "\\bigskip" "\\vfill" "\\fill")
  (#has-ancestor? @_cmd text_mode)
  (#set! conceal ""))

(generic_command
  command: (command_name) @_cmd
  (#any-of? @_cmd "\\quad" "\\qquad" "\\thinspace" "\\medspace" "\\thickspace")
  (#has-ancestor? @_cmd displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @_cmd text_mode)
  (#set! conceal ""))

(generic_command
  command: (command_name) @_func
  (#any-of? @_func "\\hspace" "\\vspace")
  (curly_group
    [
      "{"
      "}"
    ] @function.bracket) @_conceal
  (#set! @_func conceal "")
  (#set! @function.bracket conceal "")
  (#set! @_conceal conceal ""))

(generic_command
  command: (command_name) @_func
  (curly_group
    [
      "{"
      "}"
    ] @function.bracket)
  (#any-of? @_func "\\phantom" "\\hphantom" "\\vphantom" "\\fbox" "\\mbox")
  (#set! @function.bracket conceal "")
  (#set! @_func conceal ""))

(generic_command
  command: (command_name) @_func
  (curly_group
    (text) @none.comment)
  (#any-of? @_func "\\phantom" "\\hphantom" "\\vphantom"))

(generic_command
  command: (command_name) @_func
  (curly_group
    (text) @none.accent)
  (#eq? @_func "\\fbox"))

(generic_command
  command: (command_name) @_func
  (curly_group
    (text) @none.fill)
  (#eq? @_func "\\mbox"))

; ------------------------------------------------------------------------------
;                                    FONT
; ------------------------------------------------------------------------------
(generic_command
  command: (command_name) @_name
  arg: (curly_group
    [
      (_) @markup.italic
      (text
        word: (word) @markup.italic)
    ])
  (#any-of? @_name
    "\\itshape" "\\mathit" "\\mathsfit" "\\mathcal" "\\mathscr" "\\symit" "\\symsfit" "\\symcal"
    "\\symscr")
  (#not-lua-match? @markup.italic "^%d+$"))

(generic_command
  command: (command_name) @_name
  arg: (curly_group
    (_) @markup.strong)
  (#any-of? @_name
    "\\bfseries" "\\bm" "\\mathbf" "\\mathbfup" "\\mathbfsf" "\\mathbfsfup" "\\mathbb" "\\symbf"
    "\\symbfup" "\\symbfsf" "\\symbfsfup" "\\symbb"))

(generic_command
  command: (command_name) @_name
  arg: (curly_group
    [
      (_) @markup.strong
      (text
        word: (word) @markup.strong)
    ])
  (#any-of? @_name "\\mathbffrak" "\\symbffrak")
  (#not-lua-match? @markup.strong "^%d+$"))

(generic_command
  command: (command_name) @_name
  arg: (curly_group
    [
      (_) @markup.strong @markup.italic
      (text
        word: (word) @markup.strong @markup.italic)
    ])
  (#any-of? @_name
    "\\mathbfit" "\\mathbfsfit" "\\mathbfcal" "\\mathbfscr" "\\mathbbit" "\\symbfit" "\\symbfsfit"
    "\\symbfcal" "\\symbfscr" "\\symbbit")
  (#not-lua-match? @markup.italic "^%d+$")
  (#not-lua-match? @markup.strong "^%d+$"))

(text_mode
  command: "\\text" @function.math.markup
  content: (curly_group
    [
      "{"
      "}"
    ] @function.math.bracket)
  (#has-ancestor? @function.math.markup displayed_equation inline_formula math_environment))

(text_mode
  command: [
    "\\intertext"
    "\\shortintertext"
  ] @function.math.markup
  content: (curly_group
    [
      "{"
      "}"
    ] @function.math.bracket)
  (#has-ancestor? @function.math.markup math_environment))

(generic_command
  command: (command_name) @function.math.markup
  (curly_group
    "{" @function.math.bracket
    [
      (text
        word: (word) @conceal)
      (_)
    ]
    "}" @function.math.bracket)
  (#has-ancestor? @function.math.markup displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.markup text_mode)
  (#any-of? @function.math.markup
    "\\mathnormal" "\\mathrm" "\\mathit" "\\mathbf" "\\mathsf" "\\mathtt" "\\mathbfup" "\\mathbfit"
    "\\mathsfup" "\\mathsfit" "\\mathbfsf" "\\mathbfsfup" "\\mathbfsfit" "\\mathcal" "\\mathbfcal"
    "\\mathscr" "\\mathbfscr" "\\mathbb" "\\mathbbit" "\\mathfrak" "\\mathbffrak" "\\bm" "\\symup"
    "\\symit" "\\symbf" "\\symsf" "\\symtt" "\\symbfup" "\\symbfit" "\\symsfup" "\\symsfit"
    "\\symbfsf" "\\symbfsfup" "\\symbfsfit" "\\symcal" "\\symbfcal" "\\symscr" "\\symbfscr"
    "\\symbb" "\\symbbit" "\\symfrak" "\\symbffrak"))

(generic_command
  command: (command_name) @_func
  (curly_group
    [
      "{"
      "}"
    ] @function.bracket)
  (#any-of? @_func
    "\\bfseries" "\\emph" "\\itshape" "\\mdseries" "\\rmfamily" "\\scshape" "\\sffamily" "\\slshape"
    "\\textbf" "\\textit" "\\textlf" "\\textmd" "\\textnormal" "\\textrm" "\\textsc" "\\textsf"
    "\\textsl" "\\texttc" "\\texttt" "\\textulc" "\\textup" "\\ttfamily" "\\upshape"))

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

; ------------------------------------------------------------------------------
;                          OPERATORS IN MATH MODE
; ------------------------------------------------------------------------------
(generic_command
  command: (command_name) @punctuation.delimiter
  (#match? @punctuation.delimiter "^\\\\([bB]igg?m?|[lr](angle|ceil|floor|group|moustache))$")
  (#has-ancestor? @punctuation.delimiter displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @punctuation.delimiter text_mode))

(generic_command
  command: (command_name) @punctuation.delimiter
  (#has-ancestor? @punctuation.delimiter displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @punctuation.delimiter text_mode)
  (#any-of? @punctuation.delimiter "\\lvert" "\\rvert" "\\lVert" "\\rVert"))

((operator) @operator.math
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode))

(generic_command
  command: (command_name) @function.math
  arg: (curly_group
    "{" @punctuation.bracket
    (_) @markup.underline
    "}" @punctuation.bracket)
  (#has-ancestor? @function.math math_environment inline_formula displayed_equation)
  (#eq? @function.math "\\underline")
  (#set! @punctuation.bracket conceal "")
  (#set! @markup.underline conceal "")
  (#set! @function.math conceal ""))

; ------------------------------------------------------------------------------
;                               CONCEAL OPERATORS
; ------------------------------------------------------------------------------
; FULLWIDTH FORMS
;---MathOperators---
;＝＋－＊／＜＞￢￣￤￨
;---PunctuationandSpecialSymbols---
;＂＃＄％＆＇，．：；？！＠＼＾＿｀
;---BracketsandEnclosures---
;（）［］｛｝｟｠
;---Numbers---
;０１２３４５６７８９
;---LowercaseLatinAlphabet---
;ａｂｃｄｅｆｇｈｉ调ｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ
;---UppercaseLatinAlphabet---
;ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ
;---CurrencySymbols---
;￠￡￥￦
;---GeometricShapesandArrows---
;￩￪￫￬￭￮
(operator
  "*" @punctuation.dot
  (#not-has-ancestor? @punctuation.dot displayed_equation inline_formula math_environment))

(operator
  "/" @operator.math.slash
  (#has-ancestor? @operator.math.slash displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math.slash text_mode)
  (#set! @operator.math.slash conceal "∕"))

("=" @operator.math
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "＝"))

(operator
  "+" @operator.math
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "＋"))

(operator
  "-" @operator.math
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "－"))

(operator
  "<" @operator.math
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "ᐸ"))

(operator
  ">" @operator.math
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "ᐳ"))

(operator
  "!" @operator.math
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "󰈅"))

(operator
  "'" @operator.math
  (#has-ancestor? @operator.math displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @operator.math text_mode)
  (#set! @operator.math conceal "ˈ"))

; ------------------------------------------------------------------------------
;                                CONCEAL SYMBOLS
; ------------------------------------------------------------------------------
; Special keys
(generic_command
  command: (command_name) @function.math.operator
  (#has-ancestor? @function.math.operator displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.operator text_mode)
  (#eq? @function.math.operator "\\cdot")
  (#set! @function.math.operator conceal "·"))

(generic_command
  command: (command_name) @function.math.operator
  (#has-ancestor? @function.math.operator displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.operator text_mode)
  (#eq? @function.math.operator "\\cdots")
  (#set! @function.math.operator conceal "⋯"))

(generic_command
  command: (command_name) @function.math.operator
  (#has-ancestor? @function.math.operator displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.operator text_mode)
  (#any-of? @function.math.operator "\\ldots" "\\dots")
  (#set! @function.math.operator conceal "…"))

(generic_command
  command: (command_name) @function.math.operator
  (#has-ancestor? @function.math.operator displayed_equation inline_formula math_environment)
  (#not-has-ancestor? @function.math.operator text_mode)
  (#eq? @function.math.operator "\\colon")
  (#set! @function.math.operator conceal ":"))

(generic_command
  command: (command_name) @_conceal
  (#eq? @_conceal "\\\\")
  (#set! conceal "↲"))

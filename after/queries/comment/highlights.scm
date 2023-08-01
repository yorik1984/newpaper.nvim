;; extends

((tag
  (name) @text.note.test @nospell
  ("(" @punctuation.bracket (user) @constant ")" @punctuation.bracket)?
  ":" @punctuation.delimiter)
  (#any-of? @text.note.test "TEST" "TESTING" "PASSED" "FAILED"))

("text" @text.note.test @nospell
 (#any-of? @text.note.test "TEST" "TESTING" "PASSED" "FAILED"))

((tag
  (name) @text.note.perf @nospell
  ("(" @punctuation.bracket (user) @constant ")" @punctuation.bracket)?
  ":" @punctuation.delimiter)
  (#any-of? @text.note.perf "PERF" "OPTIM" "PERFORMANCE" "OPTIMIZE"))

("text" @text.note.perf @nospell
 (#any-of? @text.note.perf "PERF" "OPTIM" "PERFORMANCE" "OPTIMIZE"))

((tag
  (name) @text.warning @nospell
  ("(" @punctuation.bracket (user) @constant ")" @punctuation.bracket)?
  ":" @punctuation.delimiter)
  (#any-of? @text.warning "XXX"))

("text" @text.warning @nospell
 (#any-of? @text.warning "XXX"))

((tag
  (name) @text.danger @nospell
  ("(" @punctuation.bracket (user) @constant ")" @punctuation.bracket)?
  ":" @punctuation.delimiter)
  (#any-of? @text.danger "FIX" "FIXIT" "ISSUE"))

("text" @text.danger @nospell
 (#any-of? @text.danger "FIX" "FIXIT" "ISSUE"))

; Yardoc keyword in comment

("text" @keyword @nospell
 (#vim-match? @keyword "^[@](abstract|abstract|api|deprecated|example|note|option|overload|param|raise|see|since|todo|version|yield|yieldparam|yieldreturn)$"))

("text" @keyword.return @nospell
 (#eq? @keyword.return "@return"))

("text" @type.qualifier @nospell
 (#vim-match? @type.qualifier "^([@]private|private)$"))

("text" @keyword.function @nospell
 (#eq? @keyword.function "@author"))

;FIXIT: literal `@!` don't highlight together with atrribute name
("text" @keyword @nospell
 (#vim-match? @keyword "^(attribute|endgroup|group|macro|method|parse|scope|visibility)$"))

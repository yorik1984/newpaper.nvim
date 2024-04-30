;; extends

((tag
  (name) @comment.note.test @nospell
  ("(" @punctuation.bracket (user) @constant ")" @punctuation.bracket)?
  ":" @punctuation.delimiter)
  (#any-of? @comment.note.test "TEST" "TESTING" "PASSED" "FAILED"))

("text" @comment.note.test @nospell
 (#any-of? @comment.note.test "TEST" "TESTING" "PASSED" "FAILED"))

((tag
  (name) @comment.note.perf @nospell
  ("(" @punctuation.bracket (user) @constant ")" @punctuation.bracket)?
  ":" @punctuation.delimiter)
  (#any-of? @comment.note.perf "PERF" "OPTIM" "PERFORMANCE" "OPTIMIZE"))

("text" @comment.note.perf @nospell
 (#any-of? @comment.note.perf "PERF" "OPTIM" "PERFORMANCE" "OPTIMIZE"))

((tag
  (name) @comment.warning @nospell
  ("(" @punctuation.bracket (user) @constant ")" @punctuation.bracket)?
  ":" @punctuation.delimiter)
  (#any-of? @comment.warning "XXX"))

("text" @comment.warning @nospell
 (#any-of? @comment.warning "XXX"))

((tag
  (name) @comment.error @nospell
  ("(" @punctuation.bracket (user) @constant ")" @punctuation.bracket)?
  ":" @punctuation.delimiter)
  (#any-of? @comment.error "FIX" "FIXIT" "ISSUE"))

("text" @comment.error @nospell
 (#any-of? @comment.error "FIX" "FIXIT" "ISSUE"))

; Yardoc keyword in comment

("text" @keyword @nospell
 (#vim-match? @keyword "^[@](abstract|abstract|api|deprecated|example|note|option|overload|param|raise|see|since|todo|version|yield|yieldparam|yieldreturn)$"))

("text" @keyword.return @nospell
 (#eq? @keyword.return "@return"))

("text" @keyword.modifier @nospell
 (#vim-match? @keyword.modifier "^([@]private|private)$"))

("text" @keyword.function @nospell
 (#eq? @keyword.function "@author"))

;FIXIT: literal `@!` don't highlight together with atrribute name
; ("text" @keyword @nospell
;  (#vim-match? @keyword "^[@][!](attribute|endgroup|group|macro|method|parse|scope|visibility)$"))

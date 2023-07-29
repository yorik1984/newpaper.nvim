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

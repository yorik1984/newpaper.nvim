; extends

((tag
  (name) @comment.note.test @nospell
  ("(" @punctuation.bracket
    (user) @constant
    ")" @punctuation.bracket)?
  ":" @punctuation.delimiter)
  (#any-of? @comment.note.test "TEST" "TESTING" "PASSED" "FAILED"))

("text" @comment.note.test @nospell
  (#any-of? @comment.note.test "TEST" "TESTING" "PASSED" "FAILED"))

((tag
  (name) @comment.note.perf @nospell
  ("(" @punctuation.bracket
    (user) @constant
    ")" @punctuation.bracket)?
  ":" @punctuation.delimiter)
  (#any-of? @comment.note.perf "PERF" "OPTIM" "PERFORMANCE" "OPTIMIZE"))

("text" @comment.note.perf @nospell
  (#any-of? @comment.note.perf "PERF" "OPTIM" "PERFORMANCE" "OPTIMIZE"))

((tag
  (name) @comment.warning @nospell
  ("(" @punctuation.bracket
    (user) @constant
    ")" @punctuation.bracket)?
  ":" @punctuation.delimiter)
  (#any-of? @comment.warning "XXX"))

("text" @comment.warning @nospell
  (#any-of? @comment.warning "XXX"))

((tag
  (name) @comment.error @nospell
  ("(" @punctuation.bracket
    (user) @constant
    ")" @punctuation.bracket)?
  ":" @punctuation.delimiter)
  (#any-of? @comment.error "FIX" "FIXIT" "ISSUE"))

("text" @comment.error @nospell
  (#any-of? @comment.error "FIX" "FIXIT" "ISSUE"))

; Yardoc keyword in comment
("text" @keyword @nospell
  (#any-of? @keyword
    "@abstract" "@api" "@deprecated" "@example" "@note" "@option" "@overload" "@param" "@see"
    "@since" "@todo" "@version" "@yield" "@yieldparam" "@yieldreturn"))

("text" @keyword.function @nospell
  (#eq? @keyword.function "@author"))

("text" @keyword.modifier @nospell
  (#eq? @keyword.modifier "@private"))

("text" @keyword.exception @nospell
  (#eq? @keyword.exception "@raise"))

("text" @keyword.return @nospell
  (#eq? @keyword.return "@return"))

(("text" @keyword.symbol_at @nospell
  .
  "text" @keyword.symbol_ex @nospell
  .
  "text" @keyword @nospell)
  (#match? @keyword.symbol_at "^\\@$")
  (#match? @keyword.symbol_ex "^!$")
  (#match? @keyword "^(attribute|endgroup|group|method|parse|scope|visibility)$"))

(("text" @keyword.macro.symbol_at @nospell
  .
  "text" @keyword.macro.symbol_ex @nospell
  .
  "text" @keyword.macro @nospell)
  (#match? @keyword.macro.symbol_at "^\\@$")
  (#match? @keyword.macro.symbol_ex "^!$")
  (#match? @keyword.macro "^macro$"))

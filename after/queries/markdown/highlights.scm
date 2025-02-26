; extends

(link_label
  [
    "["
    "]"
  ] @punctuation.delimiter)

(fenced_code_block_delimiter) @markup.raw.delimiter

; Conceal backticks
(fenced_code_block
  (fenced_code_block_delimiter) @markup.raw.delimiter
  (#set! conceal "")
  (#set! conceal_lines ""))

; Conceal bullet points
([
  (list_marker_plus)
  (list_marker_star)
] @markup.list
  (#offset! @markup.list 0 0 0 -1)
  (#set! conceal "•"))

([
  (list_marker_plus)
  (list_marker_star)
] @markup.list
  (#any-of? @markup.list "+" "*")
  (#set! conceal "•"))

((list_marker_minus) @markup.list
  (#offset! @markup.list 0 0 0 -1)
  (#set! conceal "—"))

((list_marker_minus) @markup.list
  (#eq? @markup.list "-")
  (#set! conceal "—"))

(list_marker_dot) @number

(list_marker_parenthesis) @number.float

[
  (block_continuation)
  (block_quote_marker)
] @markup.quote.marker

;from https://raw.githubusercontent.com/megalithic/dotfiles/main/config/nvim/after/queries/markdown/highlights.scm
; Checkbox list items
((task_list_marker_unchecked) @markup.list.unchecked
  (#offset! @markup.list.unchecked 0 -2 0 0)
  (#set! conceal ""))

((task_list_marker_checked) @markup.list.checked
  (#offset! @markup.list.checked 0 -2 0 0)
  (#set! conceal ""))

(list_item
  (task_list_marker_unchecked)) @comment

; Tables
(pipe_table_header
  "|" @punctuation.special
  (#set! conceal "┃"))

(pipe_table_delimiter_row
  "|" @punctuation.special
  (#set! conceal "┃"))

(pipe_table_delimiter_cell
  "-" @punctuation.special
  (#set! conceal "━"))

((pipe_table_align_left) @punctuation.special
  (#set! conceal "┣"))

((pipe_table_align_right) @punctuation.special
  (#set! conceal "┫"))

(pipe_table_row
  "|" @punctuation.special
  (#set! conceal "┃"))

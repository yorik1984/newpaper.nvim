; extends

(link_label
  [
    "["
    "]"
  ] @punctuation.delimiter)

(fenced_code_block_delimiter) @markup.raw.delimiter

[
  (block_continuation)
  (block_quote_marker)
] @markup.quote.marker

(list_marker_dot) @number

(list_marker_parenthesis) @number.float

; CONCEAL
((atx_h1_marker) @markup.heading.1
  (#set! conceal "󰚟"))

((atx_h2_marker) @markup.heading.2
  (#set! conceal "󰚟"))

((atx_h3_marker) @markup.heading.3
  (#set! conceal "󰚟"))

((atx_h4_marker) @markup.heading.4
  (#set! conceal "󰚟"))

((atx_h5_marker) @markup.heading.5
  (#set! conceal "󰚟"))

((atx_h6_marker) @markup.heading.6
  (#set! conceal "󰚟"))

((list_marker_star) @markup.list
  (#offset! @markup.list 0 0 0 -1)
  (#set! conceal "◦"))

((list_marker_star) @markup.list
  (#eq? @markup.list "*")
  (#set! conceal "◦"))

((list_marker_plus) @markup.list
  (#offset! @markup.list 0 0 0 -1)
  (#set! conceal "▪"))

((list_marker_plus) @markup.list
  (#eq? @markup.list "+")
  (#set! conceal "▪"))

((list_marker_minus) @markup.list
  (#offset! @markup.list 0 0 0 -1)
  (#set! conceal "•"))

((list_marker_minus) @markup.list
  (#eq? @markup.list "-")
  (#set! conceal "•"))

;from https://github.com/delphinus/md-render.nvim/blob/main/lua/md-render/markdown.lua
; Checkbox list items
((task_list_marker_unchecked) @markup.list.unchecked
  (#set! conceal "󰄱"))

((task_list_marker_checked) @markup.list.checked
  (#set! conceal "󰄲"))

; Tables
(pipe_table_header
  "|" @punctuation.special
  (#set! conceal "│"))

(pipe_table_row
  "|" @punctuation.special
  (#set! conceal "│"))

(pipe_table_delimiter_row
  "|" @punctuation.special
  (#set! conceal "│"))

((pipe_table_delimiter_cell) @punctuation.special
  (#set! conceal "─"))

((pipe_table_align_left) @punctuation.special
  (#set! conceal "├"))

((pipe_table_align_right) @punctuation.special
  (#set! conceal "┤"))

;; extends

[
  (atx_h1_marker)
  (atx_h2_marker)
  (atx_h3_marker)
  (atx_h4_marker)
  (atx_h5_marker)
  (atx_h6_marker)
  (atx_heading)
  (setext_h1_underline)
  (setext_h2_underline)
] @text.title

(pipe_table_header (pipe_table_cell) @keyword)
(pipe_table_header "|" @punctuation.delimiter)
(pipe_table_row "|" @punctuation.delimiter)
(pipe_table_delimiter_row "|" @punctuation.delimiter)
(pipe_table_delimiter_cell) @punctuation.delimiter
(link_label ["[" "]"] @punctuation.delimiter)

[
  (info_string)
  (fenced_code_block_delimiter)
] @text.literal

[
  (link_destination)
] @text.underline

[
  (list_marker_plus)
  (list_marker_minus)
  (list_marker_star)
  (thematic_break)
] @keyword

[
  (list_marker_dot)
] @number

[
  (list_marker_parenthesis)
] @float

(task_list_marker_unchecked) @text.todo.unchecked
(task_list_marker_checked) @text.todo.checked

[
  (block_continuation)
  (block_quote_marker)
] @keyword

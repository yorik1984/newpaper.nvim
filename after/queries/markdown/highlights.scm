;; extends

[
  (atx_h1_marker)
  (atx_h2_marker)
  (atx_h3_marker)
  (atx_h4_marker)
  (atx_h5_marker)
  (atx_h6_marker)
  (setext_h1_underline)
  (setext_h2_underline)
] @keyword

(pipe_table_header "|" @punctuation.delimiter)
(pipe_table_row "|" @punctuation.delimiter)
(pipe_table_delimiter_row "|" @punctuation.delimiter)
(pipe_table_delimiter_cell) @punctuation.delimiter

[
  (fenced_code_block_delimiter)
] @text.literal

[
  (list_marker_plus)
  (list_marker_minus)
  (list_marker_star)
  (list_marker_dot)
  (list_marker_parenthesis)
  (thematic_break)
] @keyword

(task_list_marker_unchecked) @text.todo.unchecked
(task_list_marker_checked) @text.todo.checked

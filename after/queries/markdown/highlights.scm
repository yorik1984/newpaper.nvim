;; extends

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
] @keyword

[
  (list_marker_dot)
] @number

[
  (list_marker_parenthesis)
] @float

[
  (block_continuation)
  (block_quote_marker)
] @text.quote.bracket

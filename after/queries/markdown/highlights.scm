;; extends

(link_label ["[" "]"] @punctuation.delimiter)

[
  (info_string)
  (fenced_code_block_delimiter)
] @text.literal

;; Conceal backticks
(fenced_code_block
  (fenced_code_block_delimiter) @text.literal
  (#set! conceal ""))
(fenced_code_block
  (info_string (language) @text.literal
  (#set! conceal "")))

;; Conceal bullet points
([(list_marker_plus) (list_marker_star)]
  @keyword
  (#offset! @keyword 0 0 0 -1)
  (#set! conceal "•"))
([(list_marker_plus) (list_marker_star)]
  @keyword
  (#any-of? @keyword "+" "*")
  (#set! conceal "•"))
((list_marker_minus)
  @keyword
  (#offset! @keyword 0 0 0 -1)
  (#set! conceal "—"))
((list_marker_minus)
  @keyword
  (#eq? @keyword "-")
  (#set! conceal "—"))

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

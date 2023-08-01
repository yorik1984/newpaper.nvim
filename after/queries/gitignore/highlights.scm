;; extends

[
  (directory_separator)
  (bracket_negation)
] @keyword.operator

(wildcard_chars) @text.math

[
  (wildcard_chars_allow_slash)
] @keyword

[
  (wildcard_char_single)
  (directory_separator_escaped)
] @string.escape

;; bracket expressions
[
  (negation)
  "["
  "]"
] @punctuation.delimiter

(bracket_char) @number
(bracket_range
  "-" @number)
(bracket_char_class) @string.regex

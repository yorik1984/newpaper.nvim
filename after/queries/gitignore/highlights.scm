; extends

[
  (directory_separator)
  (bracket_negation)
] @string.special.path

(wildcard_chars) @markup.math

(wildcard_chars_allow_slash) @keyword

[
  (wildcard_char_single)
  (directory_separator_escaped)
] @string.escape

; bracket expressions
[
  "["
  "]"
] @punctuation.delimiter

(bracket_char) @number

(bracket_range
  "-" @number)

(bracket_char_class) @string.regexp

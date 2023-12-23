;;extends

[
  (anchor_begin)
  (anchor_end)
] @string.escape.assertion

[
  "[" "]"
] @punctuation.bracket.square

[
  "(" ")"
] @punctuation.bracket.group

(range
  from: (character) @constant
  "-" @punctuation.delimiter
  to: (character) @constant)

(negated_set "^" @punctuation.delimiter)

[
  (set)
  (negated_set)
] @string.set

(capture) @string.capture

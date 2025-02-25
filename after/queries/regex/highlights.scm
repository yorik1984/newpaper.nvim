; extends

[
  "("
  ")"
  "(?"
  "(?:"
  "(?<"
  ">"
  "|"
] @punctuation.bracket.group

[
  "{"
  "}"
] @punctuation.bracket.curly

[
  "["
  "]"
] @punctuation.bracket.square

[
  (lookaround_assertion)
  (named_capturing_group)
  (non_capturing_group)
  (anonymous_capturing_group)
] @string.group

(lookaround_assertion
  [
    "!"
    "="
  ] @punctuation.bracket.group)

(character_class) @string.class

(identity_escape) @string.escape

[
  (control_letter_escape)
  (character_class_escape)
  (control_escape)
] @string.escape.control

[
  (pattern_character)
  (class_character)
] @markup.heading

[
  (start_assertion)
  (end_assertion)
  (boundary_assertion)
  (non_boundary_assertion)
] @string.escape.assertion

(any_character) @punctuation.delimiter

(count_quantifier
  [
    (decimal_digits) @number
    "," @operator
  ])

(character_class
  [
    "^" @punctuation.delimiter
    (class_range
      "-" @punctuation.delimiter)
  ])

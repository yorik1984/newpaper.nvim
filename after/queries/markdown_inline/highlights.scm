; extends

(emphasis_delimiter) @markup.quote.marker

(code_span_delimiter) @markup.raw.delimiter

(image
  [
    "["
    "]"
    "("
    ")"
  ] @punctuation.delimiter)

(inline_link
  [
    "["
    "]"
    "("
    ")"
  ] @punctuation.delimiter)

(shortcut_link
  [
    "["
    "]"
  ] @punctuation.delimiter)

(full_reference_link
  [
    "["
    "]"
  ] @punctuation.delimiter)

(collapsed_reference_link
  [
    "["
    "]"
  ] @punctuation.delimiter)

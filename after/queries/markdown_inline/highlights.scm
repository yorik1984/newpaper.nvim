;; extends

(full_reference_link [(link_label)] @text.underline)

[
  (link_destination)
] @text.underline

[
  (emphasis_delimiter)
] @text.quote

[
  (code_span_delimiter)
] @text.literal

(image ["[" "]" "(" ")"] @punctuation.delimiter)
(inline_link ["[" "]" "(" ")"] @punctuation.delimiter)
(shortcut_link ["[" "]"] @punctuation.delimiter)
(full_reference_link ["[" "]"] @punctuation.delimiter)
(collapsed_reference_link ["[" "]"] @punctuation.delimiter)

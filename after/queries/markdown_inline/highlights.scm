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

; CONCEAL
; from https://github.com/delphinus/md-render.nvim
((shortcut_link
  (link_text) @markup.list.progress)
  (#eq? @markup.list.progress "-")
  (#set! conceal "󰡖"))

; from https://github.com/bngarren/checkmate.nvim
((shortcut_link
  (link_text) @markup.list.inprogress)
  (#eq? @markup.list.inprogress ".")
  (#set! conceal "◐"))

((shortcut_link
  (link_text) @markup.list.cancelled)
  (#eq? @markup.list.cancelled "c")
  (#set! conceal "✘"))

((shortcut_link
  (link_text) @markup.list.onhold)
  (#eq? @markup.list.onhold "/")
  (#set! conceal "⏸"))

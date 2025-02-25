;extends

("\"" @string
  (#set! conceal ""))

((escape_sequence) @string.escape
  (#eq? @string.escape "\\\"")
  (#set! conceal "\""))

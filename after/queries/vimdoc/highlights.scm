; extends

(tag
  text: (_) @markup.link.label)

(optionlink
  text: (_) @property)

(codespan
  "`" @markup.raw.delimiter
  (#set! conceal ""))

(codeblock
  ">" @markup.raw.delimiter
  (#set! conceal ""))

(codeblock
  (language) @markup.raw
  (#set! conceal ""))

(block
  "<" @markup.raw.delimiter
  (#set! conceal ""))

(column_heading
  (delimiter) @markup.raw.delimiter
  (#set! conceal ""))

(tag
  "*" @markup.raw.delimiter
  (#set! conceal ""))

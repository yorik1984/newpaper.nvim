;; extends

(regex
  (escape_sequence) @injection.content
  (#set! injection.language "regex"))
(regex
  (interpolation) @injection.content
  (#set! injection.language "regex"))
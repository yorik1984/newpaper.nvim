;; extends

; Buitin constants and Keywords

[
  "alias"
] @keyword.function

[
  "attr_reader"
  "attr_writer"
  "attr_accessor"
] @keyword.import

(class_name (constant) @local.definition.type)
(module_name (constant) @local.definition.namespace)
((namespace) @keyword.import
  (#any-of? "::")
  (#set! "priority" 90))
(namespace (constant) @local.definition.namespace)

(global_name) @variable.global

; Operators

[
 "->"
 ] @punctuation.delimiter

[
 "<"
 ] @local.definition.type.super

[
 "&"
 "|"
 ] @boolean

; Punctuation

(record_type ["{" "}"] @string.special.symbol)

[
"."
 ] @keyword.import

;; New

(builtin_type "bool" @boolean)
(builtin_type "nil" @constant.builtin)
((superclass (class_name[(constant)] @local.definition.type.super))
 (#set! "priority" 125))

((optional_type) @keyword.operator
  (#set! "priority" 125))

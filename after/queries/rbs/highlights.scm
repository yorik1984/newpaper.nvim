;; extends

; Buitin constants and Keywords

"nil" @type.qualifier

[
  "alias"
] @keyword.function

[
  "attr_reader"
  "attr_writer"
  "attr_accessor"
] @include

(class_name (constant) @storageclass)
(module_name (constant) @definition.namespace)
((namespace) @include
  (#any-of? "::")
  (#set! "priority" 90))
(namespace (constant) @definition.namespace)

(global_name) @variable.global

; Operators

[
 "->"
 ] @punctuation.delimiter

[
 "<"
 ] @storageclass.super

[
 "&"
 "|"
 ] @boolean

; Punctuation

(record_type ["{" "}"] @symbol)

[
"."
 ] @include

;; New

(builtin_type "bool" @boolean)
(builtin_type "nil" @type.qualifier)
((superclass (class_name[(constant)] @storageclass.super))
 (#set! "priority" 125))

((optional_type) @keyword.operator
  (#set! "priority" 125))

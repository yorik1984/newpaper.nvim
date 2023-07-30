;; extends

; Types

(table_type "table" @function.macro)

(builtin_type "boolean") @boolean
(builtin_type "string") @type.builtin.string
(builtin_type "nil") @constant.builtin
(builtin_type "number") @type.builtin.number
(builtin_type "table") @constructor
(builtin_type "function") @keyword.function

((type) @boolean
 (#any-of? @boolean "true" "false"))

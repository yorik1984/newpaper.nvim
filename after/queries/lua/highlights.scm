; extends

;; Operators

;; Relational Operators

[
 "=="
 "~="
 ">"
 "<"
 ">="
 "<="
 ] @punctuation.special

;; Bitwise Operators

[
 "&"
 "|"
 "~"
 "<<"
 ">>"
 ] @exception

[
 ".."
 ] @punctuation.bracket

(unary_expression
  [
  "#"
] @definition.macro.lua)

;; Constants

((identifier) @variable.global
 (#lua-match? @variable.global "^[_][A-Z][A-Z_0-9]*$"))

(vararg_expression) @label

;; Tables

(field name: (identifier) @definition.field)

;; From locals.scm

(assignment_statement
  (variable_list
    (identifier) @definition))

(variable_declaration
  (variable_list
    (identifier) @definition.var))

(variable_declaration
  (assignment_statement
    (variable_list
      (identifier) @definition.var)))

((function_declaration
  name: (identifier) @definition.function)
  (#set! definition.function.scope "parent"))

((function_declaration
  name: (dot_index_expression
    . (_) @definition.associated (identifier) @definition.function))
  (#set! definition.method.scope "parent"))

(arguments (identifier) @definition.parameter)

(bracket_index_expression field: (identifier) @definition.enum)

;; extends

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
 ] @keyword.exception

;; Arithmetic

[
  "+"
  "-"
  "*"
  "^"
  "%"
  "/"
  "//"
 ] @operator.math

[
 ".."
 ] @character.special

(unary_expression
  [
  "#"
] @constructor)

;; Constants

(vararg_expression) @label

;; Variables

((identifier) @constant.builtin
  (#eq? @constant.builtin "_ENV"))

;; Tables

(field name: (identifier) @local.definition.field)

;; From locals.scm

(assignment_statement
  (variable_list
    (identifier) @local.definition))

(variable_declaration
  (variable_list
    (identifier) @local.definition.var))

(variable_declaration
  (assignment_statement
    (variable_list
      (identifier) @local.definition.var)))

((function_declaration
  name: (identifier) @local.definition.function)
  (#set! definition.function.scope "parent"))

;; Functions

(dot_index_expression
  table: (identifier) @variable.global
    (#any-of? @variable.global
      "vim" ))

(arguments (identifier) @local.definition.parameter)

(bracket_index_expression field: (identifier) @local.definition.enum)

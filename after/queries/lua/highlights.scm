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

;; Arithmetic

[
  "+"
  "-"
  "^"
  "%"
  "/"
  "//"
 ] @text.math

[
 ".."
 ] @character.special

(unary_expression
  [
  "#"
] @definition.macro.lua)

;; Constants

(vararg_expression) @label

;; Variables

((identifier) @variable.builtin
 (#eq? @variable.builtin "_ENV"))

((identifier) @function.builtin
 (#eq? @function.builtin "_VERSION"))

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

((function_declaration
  name: (method_index_expression
    . (_) @definition.associated (identifier) @definition.method))
  (#set! definition.method.scope "parent"))

;; Functions

(function_call
  name: (dot_index_expression
   table: (identifier) @definition.associated))

(function_call
  name: (method_index_expression
   table: (identifier) @definition.associated))

(dot_index_expression
  table: (identifier) @variable.global
    (#any-of? @variable.global
      "vim" ))

(arguments (identifier) @definition.parameter)

(bracket_index_expression field: (identifier) @definition.enum)

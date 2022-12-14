;; extends

; Conceal inline links
(inline_link (link_destination) @text.uri)

; Conceal image links
(image (link_destination) @text.uri)

; Conceal full reference links
(full_reference_link (link_label) @text.uri)



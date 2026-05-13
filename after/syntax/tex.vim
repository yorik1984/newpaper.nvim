" for \usepackage[babelshorthands=true]{polyglossia}
syntax match texSymbolCustom +"-+                conceal ""
syntax match texSymbolCustom +"=+                conceal cchar=-
syntax match texSymbolCustom +"\~+               conceal cchar=-
syntax match texSymbolCustom +"|+                conceal ""
syntax match texSymbolCustom +""+                conceal ""
syntax match texSymbolCustom +"---+              conceal cchar=
syntax match texSymbolCustom +"--\~+             conceal cchar=
syntax match texSymbolCustom +"--\*+             conceal cchar=

syntax match texSymbolTilde  "\%(\\\@<!\)\@<=\~" conceal cchar=␣
syntax match texSymbolQuotes +<<+                conceal cchar=«
syntax match texSymbolQuotes +>>+                conceal cchar=»
syntax match texMathSymbol   +\\cdot+            conceal cchar=•
syntax match texMathSymbol   +\\bullet+          conceal cchar=

" highlight cyrillic symbols in Math
syntax match texCyrillicZone    "[\u0400-\u052F]\+" contained containedin=texMathGroup,texMathArg,texMathZoneLI,texMathZoneLD,texMathZoneTI,texMathZoneTD,texMathZoneEnsured,texMathZoneEnv,texMathZoneEnvStarred
syntax match texCyrillicTextArg "[\u0400-\u052F]\+" contained containedin=texMathTextConcArg,texMathTextArg,texNewcmdArgBody,texStyleArgConc

" highlight unicode except cyrillic symbols in Math
syntax match texUnicodeZone    "[^\x20-\x7E\x09\x0D\x0A\u0400-\u052F]\+" contained containedin=texMathGroup,texMathArg,texMathZoneLI,texMathZoneLD,texMathZoneTI,texMathZoneTD,texMathZoneEnsured,texMathZoneEnv,texMathZoneEnvStarred
syntax match texUnicodeTextArg "[^\x20-\x7E\x09\x0D\x0A\u0400-\u052F]\+" contained containedin=texMathTextConcArg,texMathTextArg,texNewcmdArgBody,texStyleArgConc

" conceal sectioning commands with a special character
syntax match texCmdPart "\\part\>"                    nextgroup=texPartArgTitle conceal cchar=󰚟
syntax match texCmdPart "\\chapter\>\*\?"             nextgroup=texPartArgTitle conceal cchar=󰚟
syntax match texCmdPart "\v\\%(sub)*section>\*?"      nextgroup=texPartArgTitle conceal cchar=󰚟
syntax match texCmdPart "\v\\%(sub)?paragraph>"       nextgroup=texPartArgTitle conceal cchar=󰚟
syntax match texCmdPart "\v\\add%(part|chap|sec)>\*?" nextgroup=texPartArgTitle conceal cchar=󰚟

hi def link texSymbolTilde         texSpecialChar
hi def link texSymbolQuotes        texSpecialChar
hi def link texCyrillicZone        texSymbol
hi def link texUnicodeZone         texSymbolUnicode

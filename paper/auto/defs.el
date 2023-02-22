(TeX-add-style-hook
 "defs"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (add-to-list 'LaTeX-verbatim-environments-local "alltt")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "amsmath"
    "amssymb"
    "supertabular"
    "geometry"
    "ifthen"
    "alltt"
    "color")
   (TeX-add-symbols
    '("ottdrule" ["argument"] 3)
    '("ottdefnreduce" 1)
    '("ottdrulectxXXappXXarg" 1)
    '("ottdrulectxXXappXXfun" 1)
    '("ottdruleaxXXapp" 1)
    '("ottdefnGtT" 1)
    '("ottdruleGtTXXlambda" 1)
    '("ottdruleGtTXXapply" 1)
    '("ottdruleGtTXXvalueXXname" 1)
    '("ottbindspecprodline" 6)
    '("ottfirstlongprodline" 2)
    '("ottlongprodline" 2)
    '("ottfirstprodline" 6)
    '("ottprodline" 6)
    '("ottrulehead" 3)
    '("ottmetavartabular" 1)
    '("ottgrammartabular" 1)
    '("ottcomp" 2)
    '("ottcompu" 3)
    '("ottcomplu" 5)
    '("ottdrulename" 1)
    '("ottcom" 1)
    '("ottsym" 1)
    '("ottkw" 1)
    '("ottmv" 1)
    '("ottnt" 1)
    '("ottfunclause" 2)
    '("ottpremise" 1)
    '("ottusedrule" 1)
    "ottprodnewline"
    "ottinterrule"
    "ottafterlastrule"
    "ottmetavars"
    "ottt"
    "ottv"
    "ottT"
    "ottG"
    "ottterminals"
    "ottformula"
    "ottJtype"
    "ottJop"
    "ottjudgement"
    "ottuserXXsyntax"
    "ottgrammar"
    "ottdefnsJtype"
    "ottdefnsJop"
    "ottdefnss"
    "ottall")
   (LaTeX-add-environments
    '("ottfundefnblock" LaTeX-env-args ["argument"] 2)
    '("ottdefnblock" LaTeX-env-args ["argument"] 2)))
 :latex)


(TeX-add-style-hook
 "grammar"
 (lambda ()
   (LaTeX-add-environments
    '("ottfundefnblock" LaTeX-env-args ["argument"] 2)
    '("ottdefnblock" LaTeX-env-args ["argument"] 2)))
 :latex)


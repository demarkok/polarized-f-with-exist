(TeX-add-style-hook
 "ord-and-norm-completeness"
 (lambda ()
   (LaTeX-add-labels
    "lemma:ord-completeness")
   (LaTeX-add-environments
    '("ottfundefnblock" LaTeX-env-args ["argument"] 2)
    '("ottdefnblock" LaTeX-env-args ["argument"] 2)))
 :latex)


(TeX-add-style-hook
 "prelude"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("enumitem" "inline") ("xcolor" "dvipsnames" "usenames")))
   (TeX-run-style-hooks
    "lscape"
    "amsmath"
    "amsthm"
    "amssymb"
    "booktabs"
    "multicol"
    "supertabular"
    "enumitem"
    "cleveref"
    "mathabx"
    "color"
    "xcolor"
    "scalerel")
   (TeX-add-symbols
    '("mathcoloraux" 3)
    '("ilyam" 1)
    "niton"
    "mathcolor")
   (LaTeX-add-environments
    '("ottfundefnblock" LaTeX-env-args ["argument"] 2)
    '("ottdefnblock" LaTeX-env-args ["argument"] 2))
   (LaTeX-add-amsthm-newtheorems
    "definition"
    "lemma"))
 :latex)


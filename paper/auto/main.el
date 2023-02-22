(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "a4" "natbib=false")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "a4paper" "total={8in, 10in}") ("enumitem" "inline")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "_build/_gen/included"
    "article"
    "art10"
    "geometry"
    "lscape"
    "amsmath"
    "amsthm"
    "amssymb"
    "booktabs"
    "multicol"
    "supertabular"
    "enumitem"
    "cleveref")
   (TeX-add-symbols
    '("ilyam" 1)
    "niton")
   (LaTeX-add-labels
    "def:half"
    "def:full"
    "lemma:ext-app")
   (LaTeX-add-environments
    '("ottfundefnblock" LaTeX-env-args ["argument"] 2)
    '("ottdefnblock" LaTeX-env-args ["argument"] 2)
    "definition"
    "lemma"))
 :latex)


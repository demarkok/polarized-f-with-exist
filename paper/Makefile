.SUFFIXES: .tex .pdf .dia .eps
.PHONY: default all clean distclean view FORCE

export TEXINPUTS := .:../sav-science/:${TEXINPUTS}
export BSTINPUTS := .:../sav-science/:${BSTINPUTS}
export SHELL := /bin/bash

PAPERS=main.pdf
SOURCES=main.tex

all: $(PAPERS)

main.pdf: $(SOURCES)
	latexmk -pdf -f main.tex

continuous:
	latexmk -pdf -pvc -f main.tex

clean:
	@$(RM) *.aux *.lof *.log *.lot *.out *.toc *.nav *.snm *.bbl *.blg
	@$(RM) *~ \#*\# *.spl *.fls *.fdb_latexmk *.bcf

distclean: clean
	@$(RM) $(PAPERS)

.SUFFIXES: .tex .pdf .dia .eps
.PHONY: continuous default all clean distclean
SHELL:=/bin/bash

# Directories
ROOT := ..
TEX := tex
GEN := _gen
GEN_TEX := $(GEN)/$(TEX)
OTT := $(ROOT)/ott
OTT_GEN := $(OTT)/_gen


# Files
OTTS := $(OTT)/*.ott
PDFS := paper.pdf
TEXS := paper.tex $(wildcard $(TEX)/*.tex)
GEN_TEXS := $(addprefix $(GEN)/,$(TEXS))

INCLUDED := $(OTT_GEN)/included.tex
CACHE := $(OTT_GEN)/ott.cache
STY := *.sty

all: $(PDFS)

# MAKE DIRECTORIES
$(GEN) $(GEN_TEX): %:
	mkdir -p $@

# MAKE OTT DEFITIONS

$(CACHE): $(OTTS) 
	make -C $(OTT)

$(INCLUDED): $(OTTS) $(CACHE)

# MAKE PROCESSED TEX FILES
$(GEN_TEXS): $(TEXS) $(CACHE) $(INCLUDED) | $(GEN_TEX)
	ott -generate_aux_rules false  -readsys $(CACHE) -tex_filter $(@:$(GEN)/%=%) $@

# MAIN

paper.pdf: $(GEN_TEXS)
	latexmk -silent --pdf $(GEN)/paper.tex

continuous:
	make & fswatch -o .. | xargs -n1 -I{} make

# CLEAN
clean:
	rm -f *.aux *.lof *.log *.lot *.out *.toc *.nav *.snm *.bcf *.bbl *.blg *.xml *.tdo *.dvi
	rm -f *~ \#*\# *.spl *.fls *.fdb_latexmk *.bcf

distclean: clean
	rm $(PDFS)
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

CACHE := $(OTT_GEN)/ott.cache
DEFS := $(OTT_GEN)/defs.tex
RENEW_DEFS := $(OTT_GEN)/renew-ott.tex
STY := $(ROOT)/*.sty
BIBLIO := $(ROOT)/bibliography.sty $(ROOT)/biblio.bib

all: $(PDFS)

# MAKE DIRECTORIES
$(GEN) $(GEN_TEX): %:
	mkdir -p $@

# MAKE OTT DEFITIONS

$(CACHE): $(OTTS) 
	make -C $(OTT)

$(DEFS): $(CACHE)
	make -C $(OTT)

$(RENEW_DEFS) : $(DEFS) $(OTT)/renew-ott.tex
	make -C $(OTT)

# MAKE PROCESSED TEX FILES
$(GEN_TEXS): $(TEXS) $(CACHE) $(DEFS) $(ROOT)/prelude.tex | $(GEN_TEX)
	ott -generate_aux_rules false  -readsys $(CACHE) -tex_filter $(@:$(GEN)/%=%) $@

# MAIN

paper.pdf: $(GEN_TEXS) $(BIBLIO)
	latexmk --pdf -f $(GEN)/paper.tex

continuous:
	make & fswatch -o .. | xargs -n1 -I{} make

# CLEAN
clean:
	rm -f *.aux *.lof *.log *.lot *.out *.toc *.nav *.snm *.bcf *.bbl *.blg *.xml *.tdo *.dvi
	rm -f *~ \#*\# *.spl *.fls *.fdb_latexmk *.bcf

distclean: clean
	rm $(PDFS)
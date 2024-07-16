.SUFFIXES: .tex .pdf .dia .eps
.PHONY: continuous default all clean distclean
SHELL:=/bin/bash

# Directories
ROOT_DIR := ..
ROOTPAPER_DIR := $(ROOT_DIR)/paper
ROOT_TEX_DIR := $(ROOTPAPER_DIR)/tex
ROOT_GEN_DIR := $(ROOTPAPER_DIR)/_gen
ROOT_GEN_TEX_DIR := $(ROOT_GEN_DIR)/tex
PROOFS_DIR := $(ROOT_DIR)/proofs
OTT_DIR := $(ROOT_DIR)/ott
OTT_GEN_DIR := $(OTT_DIR)/_gen

# Files
OTTS := $(OTT_DIR)/*.ott

CACHE := $(OTT_GEN_DIR)/ott.cache
DEFS := $(OTT_GEN_DIR)/defs.tex
RENEW_DEFS := $(OTT_GEN_DIR)/renew-ott.tex
STY := $(ROOT_DIR)/*.sty
BIBLIO := $(ROOT_DIR)/bibliography.sty $(ROOT_DIR)/biblio.bib

# Local files
PDFS := paper.pdf
LOCAL_TEXS := paper.tex
LOCAL_GEN_DIR := _gen
LOCAL_GEN_TEXS := $(addprefix $(LOCAL_GEN_DIR)/,$(LOCAL_TEXS))

all: $(PDFS)

ott:
	make -C $(OTT_DIR)

rootpaper:
	make -C $(ROOTPAPER_DIR)

proofs:
	make -C $(PROOFS_DIR)

# MAKE DIRECTORIES
# $(GEN_DIR) $(GEN_TEX_DIR): %:
# 	make -C $(ROOTPAPER_DIR)

$(LOCAL_GEN_DIR): %:
	mkdir -p $@

# MAKE OTT DEFITIONS

# MAKE PROCESSED TEX FILES
$(LOCAL_GEN_TEXS): ott $(LOCAL_TEXS) | $(LOCAL_GEN_DIR) 
	# make -C $(ROOTPAPER)
	ott -generate_aux_rules false  -readsys $(CACHE) -tex_filter $(@:$(LOCAL_GEN_DIR)/%=%) $@

# $(LOCAL_GEN_DIR)/%.tex: %.tex $(RENEW_DEFS) $(ROOT)/prelude.tex | $(GEN_TEX)
# 	ott -generate_aux_rules false  -readsys $(CACHE) -tex_filter $< $@

# MAIN

paper.pdf: rootpaper proofs ott $(LOCAL_GEN_TEXS)
	rubber --pdf -f  paper.tex

continuous:
	make & fswatch -o .. | xargs -n1 -I{} make

# CLEAN
clean:
	rm -f *.aux *.lof *.log *.lot *.out *.toc *.nav *.snm *.bcf *.bbl *.blg *.xml *.tdo *.dvi
	rm -f *~ \#*\# *.spl *.fls *.fdb_latexmk *.bcf
	rm -f *.rubbercache 

ottdistclean:
	make -C $(OTT_DIR) distclean
paperdistclean:
	make -C $(ROOTPAPER_DIR) distclean
proofsdistclean:
	make -C $(PROOFS_DIR) distclean

distclean: clean ottdistclean paperdistclean proofsdistclean
	rm $(PDFS)
	rm -r $(LOCAL_GEN_DIR)
	rm -r $(OTT_GEN_DIR)

printvars:
	@echo "ROOT_DIR: $(ROOT_DIR)"
	@echo "ROOTPAPER_DIR: $(ROOTPAPER_DIR)"
	@echo "ROOT_TEX_DIR: $(ROOT_TEX_DIR)"
	@echo "ROOT_GEN_DIR: $(ROOT_GEN_DIR)"
	@echo "ROOT_GEN_TEX_DIR: $(ROOT_GEN_TEX_DIR)"
	@echo "PROOFS_DIR: $(PROOFS_DIR)"
	@echo "OTT_DIR: $(OTT_DIR)"
	@echo "OTT_GEN_DIR: $(OTT_GEN_DIR)"
	@echo "CACHE: $(CACHE)"
	@echo "DEFS: $(DEFS)"
	@echo "RENEW_DEFS: $(RENEW_DEFS)"
	@echo "STY: $(STY)"
	@echo "BIBLIO: $(BIBLIO)"
	@echo "PDFS: $(PDFS)"
	@echo "LOCAL_TEXS: $(LOCAL_TEXS)"
	@echo "LOCAL_GEN_DIR: $(LOCAL_GEN_DIR)"
	@echo "LOCAL_GEN_TEXS: $(LOCAL_GEN_TEXS)"
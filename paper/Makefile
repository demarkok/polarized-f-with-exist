.SUFFIXES: .tex .pdf .dia .eps
.PHONY: continuous default all clean distclean ottdistclean clean_temp diff
SHELL:=/bin/bash

# Directories
ROOT := ..
TEX := tex
GEN := _gen
GEN_TEX := $(GEN)/$(TEX)
OTT := $(ROOT)/ott
OTT_GEN := $(OTT)/_gen
TEMP_DIR :=  $(ROOT)/temp
OLD_GEN := $(TEMP_DIR)/$(TEX)


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
$(GEN_TEXS): $(TEXS) $(CACHE) $(RENEW_DEFS) $(ROOT)/prelude.tex | $(GEN_TEX)
	ott -generate_aux_rules false  -readsys $(CACHE) -tex_filter $(@:$(GEN)/%=%) $@

# MAIN

paper.pdf: $(GEN_TEXS) $(BIBLIO)
	rubber --pdf -f $(GEN)/paper.tex

continuous:
	make & fswatch -o .. | xargs -n1 -I{} make

# DIFF
diff: $(GEN_TEXS) $(BIBLIO) clean_temp
	# Check out paper.tex and related files from the last commit into the temporary directory
	mkdir -p $(OLD_GEN)
	git --work-tree=$(TEMP_DIR) checkout HEAD~1 -- ./paper
	mv $(TEMP_DIR)/paper/* $(TEMP_DIR)

	make -C $(TEMP_DIR) 

    # Run latexdiff
	latexdiff --flatten $(TEMP_DIR)/$(GEN)/paper.tex $(GEN)/paper.tex > diff.tex

	# Compile the diff.tex to diff.pdf
	rubber --pdf -f diff.tex

# Clean the temporary directory
clean_temp:
	rm -rf $(TEMP_DIR)

# CLEAN
clean:
	rm -f *.aux *.lof *.log *.lot *.out *.toc *.nav *.snm *.bcf *.bbl *.blg *.xml *.tdo *.dvi
	rm -f *~ \#*\# *.spl *.fls *.fdb_latexmk *.bcf
	rm -f *.rubbercache 

ottdistclean:
	make -C $(OTT) distclean

distclean: clean ottdistclean clean_temp
	rm -r $(GEN)
	rm -r $(OTT_GEN)
	rm $(PDFS)
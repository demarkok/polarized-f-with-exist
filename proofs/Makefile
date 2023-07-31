.SUFFIXES: .tex .pdf .dia .eps

.PHONY: continuous default all clean distclea
SHELL:=/bin/bash


TEX := tex
BUILD  := ../_build
GEN := $(BUILD)/_gen
GEN_TEX := $(GEN)/$(TEX)
CACHE := $(BUILD)/ott.cache
OTT := ../ott

OTTS := $(OTT)/*.ott
PDFS := defs.pdf main.pdf
TEXS := main.tex $(wildcard $(TEX)/*.tex)
GEN_TEXS := $(addprefix $(GEN)/,$(TEXS))
PRELUDE := prelude.tex
STY := *.sty


all: $(PDFS)

defs.pdf: $(GEN)/defs.tex $(CACHE) | $(BUILD)
	rubber --pdf $(GEN)/defs.tex

$(GEN)/defs.tex: %: $(OTTS) | $(GEN)
	echo "embed {{ tex-preamble \input{../proofs/$(PRELUDE)} }}" | tee prelude.ott
	ott -i prelude.ott $(addprefix -i , $^) -merge true  -writesys $@ -o $(GEN)/defs.tex
	rm prelude.ott

$(BUILD) $(GEN) $(GEN_TEX): %:
	mkdir -p $@

$(CACHE): %: $(OTTS) | $(BUILD)
	ott -signal_parse_errors true $(addprefix -i , $^) -writesys $@

$(GEN)/included.tex: $(CACHE) | $(GEN)
	@ott -readsys $(CACHE) \
	    -o $@ \
	    -tex_wrap false \
	    -tex_show_categories false \
	    -tex_suppress_category S \
     	-tex_show_meta false \
		-merge true
  # For rubber
	touch $@.aux

$(GEN_TEXS): $(TEXS) $(CACHE) $(GEN)/included.tex $(PRELUDE) $(STY) | $(GEN_TEX)
	ott -generate_aux_rules false  -readsys $(CACHE) -tex_filter $(@:$(GEN)/%=%) $@

main.pdf: $(GEN_TEXS)
	rubber --pdf $(GEN)/main.tex

continuous:
	make & fswatch -o .. | xargs -n1 -I{} make

clean:
	rm -f *.aux *.lof *.log *.lot *.out *.toc *.nav *.snm *.bcf *.bbl *.blg *.xml *.tdo *.dvi
	rm -f *~ \#*\# *.spl *.fls *.fdb_latexmk *.bcf

distclean: clean
	rm $(PDFS)
	rm -r $(BUILD)


.SUFFIXES: .tex .pdf .dia .eps

.PHONY: continuous default all clean distclea
SHELL:=/bin/bash


BUILD  := ../_build
GEN := $(BUILD)/_gen
CACHE := $(BUILD)/ott.cache
OTT := ../ott

OTTS := $(OTT)/*.ott
PDFS := defs.pdf main.pdf
TEXS := main.tex tex/*.tex
PRELUDE := prelude.tex



all: $(PDFS)

defs.pdf: $(GEN)/defs.tex $(CACHE) | $(BUILD)
	rubber --pdf $(GEN)/defs.tex

$(GEN)/defs.tex: %: $(OTTS) | $(GEN)
	echo "embed {{ tex-preamble \input{../proofs/$(PRELUDE)} }}" | tee prelude.ott
	ott -i prelude.ott $(addprefix -i , $^)  -writesys $@ -o $(GEN)/defs.tex
	rm prelude.ott

$(BUILD) $(GEN): %:
	mkdir -p $@

$(CACHE): %: $(OTTS) | $(BUILD)
	ott -signal_parse_errors true $(addprefix -i , $^) -writesys $@

$(GEN)/included.tex: $(CACHE) | $(GEN)
	@ott -readsys $(CACHE) \
	    -o $@ \
	    -tex_wrap false \
	    -tex_show_categories true \
	    -tex_suppress_category X \
      -tex_show_meta false \
  # For rubber
	touch $@.aux

$(GEN)/main.tex : $(TEXS) $(CACHE) $(GEN)/included.tex | $(GEN)
	ott -generate_aux_rules false  -readsys $(CACHE) -tex_filter $< $@

main.pdf : $(GEN)/main.tex
	rubber --pdf $(GEN)/main.tex

continuous:
	make & fswatch -o .. | xargs -n1 -I{} make

clean:
	rm -f *.aux *.lof *.log *.lot *.out *.toc *.nav *.snm *.bcf *.bbl *.blg *.xml *.tdo *.dvi
	rm -f *~ \#*\# *.spl *.fls *.fdb_latexmk *.bcf

distclean: clean
	rm $(PDFS)
	rm -r $(BUILD)


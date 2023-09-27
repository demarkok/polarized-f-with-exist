GEN := $(BUILD)/_gen
TEXS := paper.tex $(wildcard tex/*.tex)

paper.pdf: $(TEXS)
	latexmk -silent --pdf paper.tex

continuous:
	make & fswatch -o . | xargs -n1 -I{} make
GEN := _gen

OTTS := *.ott
CACHE := $(GEN)/ott.cache
INCLUDED := $(GEN)/included.tex

all: $(INCLUDED)


$(GEN): %: 
	mkdir -p $@


$(CACHE): %: $(OTTS) | $(GEN)
	ott -merge true -signal_parse_errors true $(addprefix -i , $^) -writesys $@

$(INCLUDED): $(CACHE)
	@ott -readsys $(CACHE) \
	    -o $@ \
	    -tex_wrap false \
	    -tex_show_categories false \
	    -tex_suppress_category S \
     	-tex_show_meta false \
		-merge true

clean: 
	rm -f $(CACHE) $(INCLUDED)
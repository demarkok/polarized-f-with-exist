GEN := _gen

OTTS := *.ott
CACHE := $(GEN)/ott.cache
DEFS := $(GEN)/defs.tex


TEXS := renew-ott.tex 
GEN_TEXS := $(addprefix $(GEN)/,$(TEXS))

all: $(GEN_TEXS) $(DEFS)

$(GEN): %: 
	mkdir -p $@


$(CACHE): %: $(OTTS) | $(GEN)
	ott -merge true -signal_parse_errors true $(addprefix -i , $^) -writesys $@

$(DEFS): $(CACHE)
	@ott -readsys $(CACHE) \
	    -o $@ \
	    -tex_wrap false \
	    -tex_show_categories false \
	    -tex_suppress_category S \
     	-tex_show_meta false \
		-merge true


$(GEN_TEXS): $(TEXS) $(CACHE) | $(GEN)
	ott -generate_aux_rules false  -readsys $(CACHE) -tex_filter $(@:$(GEN)/%=%) $@

clean: 
	rm -f $(CACHE) $(GEN_TEXS) 

distclean: clean
	rm -rf $(GEN)
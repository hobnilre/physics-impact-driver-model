# Shared standalone translation build. Language/date/font overrides live in
# each language directory's metadata.yaml; root typography remains shared.
TRANSLATION_PDFS := $(TRANSLATION_ARTICLES:.md=.pdf)
TRANSLATION_DIRS := $(sort $(dir $(TRANSLATION_ARTICLES)))
TRANSLATION_FIG_SRC := $(shell grep -l '^\\documentclass.*{standalone}' $(addsuffix figures/*.tex,$(TRANSLATION_DIRS)) 2>/dev/null)
TRANSLATION_FIGURES := $(TRANSLATION_FIG_SRC:.tex=.pdf)

pdf: $(TRANSLATION_PDFS)
figures: $(TRANSLATION_FIGURES)

.SECONDEXPANSION:
$(TRANSLATION_PDFS): $$(patsubst %.pdf,%.md,$$@) $$(dir $$@)metadata.yaml $$(dir $$@)preamble-local.tex $(PREAMBLE) $(LOCAL_PREAMBLE) $(STYLE) $(FIGURES) $(FIG_ASSETS) Makefile translation-rules.mk $$(filter $$(dir $$@)%,$$(TRANSLATION_FIGURES)) $$(wildcard $$(dir $$@)figures/*)
	mkdir -p "$(BUILD_ABS)/$(@D)"
	printf '\\newcommand{\\pdfbuildtimestamp}{%s}\n' "$$(date -u '+%Y-%m-%d %H:%M:%S UTC')" > "$(BUILD_ABS)/$(@D)/pdf-build-time.tex"
	TMPDIR="$(BUILD_ABS)/$(@D)" pandoc "$<" --from markdown+tex_math_dollars \
		--resource-path="$(@D):." --metadata-file="$(abspath $(STYLE))" --metadata-file="$(abspath $(@D)/metadata.yaml)" \
		--pdf-engine=xelatex --include-in-header="$(abspath $(PREAMBLE))" --include-in-header="$(abspath $(LOCAL_PREAMBLE))" \
		--include-in-header="$(abspath $(@D)/preamble-local.tex)" \
		--include-in-header="$(BUILD_ABS)/$(@D)/pdf-build-time.tex" -o "$@"

$(TRANSLATION_FIGURES): %.pdf: %.tex $(FIG_INPUTS) $$(wildcard $$(dir $$@)*.tex $$(dir $$@)*.sty)
	mkdir -p "$(BUILD_ABS)/$(@D)"
	cd "$(@D)" && xelatex -interaction=nonstopmode -halt-on-error \
		-output-directory="$(BUILD_ABS)/$(@D)" "$(notdir $<)" > /dev/null
	cp "$(BUILD_ABS)/$(@D)/$(notdir $@)" "$@"

IN_MD_FILES = $(shell find content/ -type f -name '*.md')
OUT_HTML_FILES = $(patsubst content/%.md, build/%.html, $(IN_MD_FILES))

IN_PNG_FILES = $(shell find content/ -type f -name '*.png')
IN_CSS_FILES = $(shell find content/ -type f -name '*.css')
IN_ICO_FILES = $(shell find content/ -type f -name 'favicon.*')

IN_COPY_FILES = $(IN_PNG_FILES) $(IN_CSS_FILES) $(IN_ICO_FILES)
OUT_COPY_FILES = $(patsubst content/%, build/%, $(IN_COPY_FILES))

OUT_TARGETS = $(OUT_HTML_FILES) $(OUT_COPY_FILES)

HTML_HEADER = content/header.html
HTML_FOOTER = content/footer.html

all: $(OUT_TARGETS)

.PHONY: all clean watch deploy

.DELETE_ON_ERROR:

# Use `make V=1` to print commands.
$(V).SILENT:

clean:
	@rm -fv $(OUT_TARGETS)

build/%.html: content/%.md $(HTML_HEADER) $(HTML_FOOTER)
	@echo " [MD]  $<"
	mkdir -p $(shell dirname "$@")
	cat $(HTML_HEADER) > "$@"
	npx markdown-it < "$<" >> "$@"
	cat $(HTML_FOOTER) >> "$@"
	TITLE=`sed -n '/<!--@/,/-->/ { /^TITLE=/ { s/^[^=]\+=//; p; b } }' "$<"` ; \
	PREFIX=`realpath --relative-to="$(shell dirname "$<")" content/` ; \
		 sed -i 's|\$${TITLE}|'"$$TITLE"'|g; s|\$${PREFIX}|'"$$PREFIX"'|g; ' "$@"

build/%: content/%
	@echo " [CP]  $<"
	mkdir -p $(shell dirname "$@")
	cp "$<" "$@"

deploy: $(OUT_TARGETS)
	aws --profile malvineous s3 sync --delete build/ s3://www.shikadi.net/

# Watch source files for changes and build on any modifications.
watch:
	inotifywait -e close_write,moved_to -r -m content | \
		while read -r directory events filename; do $(MAKE) --no-print-directory; done

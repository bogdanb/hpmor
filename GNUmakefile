# Make a PDF release

PROJECT=hpmor

TAG := $(shell git describe --tags)
VERSION := $(shell echo $(TAG) | sed -e 's/^v//')
EBOOKS = ebook/output/$(PROJECT).epub ebook/output/$(PROJECT).mobi
ZIPFILE = $(PROJECT)-$(VERSION).zip

all: ebooks pdf

pdf:
	latexmk

ebooks: pdf
	cd ebook && ./1_latex2html.py && ./2_html2epub.sh

zip: pdf ebooks
	rm -f $(ZIPFILE) && \
	zip $(ZIPFILE) *.pdf $(EBOOKS)

# To make a release: git tag vx.y && git push --tags && make release
# Needs woger from https://github.com/rrthomas/woger/
release: zip
	git diff --exit-code && \
	woger github package=$(PROJECT) version=$(VERSION) dist_type=zip && \
	for file in $(PROJECT).pdf $(EBOOKS); do \
		suffix=$${file##*.}; \
		hub release edit $(TAG) --attach $$file#$(PROJECT)-$(VERSION).$$suffix; \
	done

# Make a PDF release

PROJECT=hpmor

TAG := $(shell git describe --tags)
VERSION := $(shell echo $(TAG) | sed -e 's/^v//')
ZIPFILE = $(PROJECT)-$(VERSION).zip

all:
	latexmk

zip:
	latexmk -g && \
	rm -f $(ZIPFILE) && \
	zip $(ZIPFILE) *.pdf

# To make a release: git tag vx.y && git push --tags && make release
# Needs woger from https://github.com/rrthomas/woger/
release: zip
	git diff --exit-code && \
	woger github package=$(PROJECT) version=$(VERSION) dist_type=zip
	hub release edit $(TAG) --attach $(PROJECT).pdf#$(PROJECT)-$(VERSION).pdf

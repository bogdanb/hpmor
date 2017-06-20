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
	woger github github_user=rjl20 package=$(PROJECT) version=$(VERSION) dist_type=zip github_dist_type=pdf
	github-release upload --user rjl20 --repo $(PROJECT) --tag $(TAG) --name $(PROJECT)-$(VERSION).pdf --file $(PROJECT).pdf -s `netrc -p github-release.github.com`

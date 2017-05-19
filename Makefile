# Makefile for “Harry Potter and the Methods of Rationality”

TEXFON :="./xfonts//:"

LATEX=xelatex

OBJECTS = hpmor-1.pdf hpmor-2.pdf hpmor-3.pdf hpmor-4.pdf hpmor-5.pdf hpmor-6.pdf hpmor.pdf hpmor-dust-jacket-1.pdf

default: hpmor.pdf

%.pdf: %.tex
	TEXFONTS=$(TEXFON) $(LATEX) $(OPT) $<
	TEXFONTS=$(TEXFON) $(LATEX) $(OPT) $<

all: $(OBJECTS)

clean:
	rm -f hp*.aux hp*.log hp*.out hp*.toc $(OBJECTS) chapters/*.aux

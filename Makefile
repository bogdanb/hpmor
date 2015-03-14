#Makefile for “Harry Potter and the Methods of Rationality

TEXFON :="./xfonts//:"
TEXIN :=".:./pkg//:"

LATEX=xelatex

OPT := $(OPT) "-output-directory=out"

OBJECTS = hpmor-1.pdf hpmor-2.pdf hpmor-3.pdf hpmor-4.pdf hpmor-5.pdf hpmor-6.pdf hpmor.pdf

default : hpmor.pdf

%.pdf : %.tex
	TEXFONTS=$(TEXFON) TEXINPUTS=$(TEXIN) $(LATEX) $(OPT) $<
	TEXFONTS=$(TEXFON) TEXINPUTS=$(TEXIN) $(LATEX) $(OPT) $<

all : $(OBJECTS)

love :
	@echo 'not war.' 

clean:
	rm out/hp* out/new-chapters/hp*

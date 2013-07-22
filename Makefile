#Makefile for “Harry Potter and the Methods of Rationality

TEXFON :="./xfonts//:"
TEXIN :=".:./pkg//:"

CHAPTERS=$(wildcard chapters/hp-ch*.tex)
IMAGES=$(wildcard fanart/ch*.jpg)

MAIN=hpmor.tex
EXTRA=hp-intro.tex hp-contents.tex hp-colophon.tex memoir-hacks.tex

TEXT=hpatmor.pdf
COVER=cover0.jpg
BOOK=hp.pdf

LATEX=xelatex

#~ OPT := "-halt-on-error"
#OPT="-interaction=batchmode"
OPT := $(OPT) "-output-directory=out"

#$(MAIN) $(EXTRA) $(CHAPTERS) $(COVER) $(IMAGES)
^$(TEXT): 
	TEXFONTS=$(TEXFON) TEXINPUTS=$(TEXIN) $(LATEX) $(OPT) $(MAIN)
	TEXFONTS=$(TEXFON) TEXINPUTS=$(TEXIN) $(LATEX) $(OPT) $(MAIN) 

once:
	TEXFONTS=$(TEXFON) TEXINPUTS=$(TEXIN) $(LATEX) $(OPT) $(MAIN) 


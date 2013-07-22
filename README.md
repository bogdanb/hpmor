hpmor
=====

Latex version of “Harry Potter and the Methods of Rationality”

files
=====

* hpmor.tex - the main file
* hp-format.tex - mostly set up memoir
* hp-hacks.tex - all sorts of formatting commands used in the text
* chapters/ - one file per chapter, included from hpmor.tex
* out/ - generated files are put here, including the main output, hpmor.pdf
* pkg/ - some latex packages that might be tricky to find
* xfonts/ - the various fonts used
* Makefile - use “make” to run xelatex twice, “make once” to run it just once, “make clean” to empty the out folder

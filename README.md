HPMOR
=====

LaTeX/PDF version of “Harry Potter and the Methods of Rationality”

This fork incorporates changes made to the chapters after they were added to 
the PDF. Chapter 9, for example, has had a large chunk moved to the 
"Omake Files" chapter since it was first published, due to reader reactions.
Other chapters have had significant changes made in order to work with later
chapters as they were written. Because the PDF conversion was a manual process,
few of these changes were reflected in the PDF until now.


Files
=====

* hpmor.tex - the main file
* hp-format.tex - mostly set up memoir
* hp-hacks.tex - all sorts of formatting commands used in the text
* new-chapters/ - one file per chapter, included from hpmor.tex
* chapters/ - one file per chapter, the original files before my fork
* out/ - generated files are put here, including the main output, hpmor.pdf
* pkg/ - some latex packages that might be tricky to find
* xfonts/ - the various fonts used
* Makefile - use “make” to run xelatex twice, “make once” to run it just once, “make clean” to empty the out folder


Contributing
============

If you'd like to help, the files to edit are in new-chapters/. 

NB: I've moved the Omake Files chapters (11 and 64) to the end of the PDF, so
while the original chapter numbers are accurate in the filenames, they're off by 
one or two once compiled into the PDF.

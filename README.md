# HPMOR

A LaTeX version of
[“Harry Potter and the Methods of Rationality”](http://www.hpmor.com) which
can make a PDF ebook (one file) or printable books (either one or six
volumes; the latter option is more practical to bind). There is also a dust
jacket for volume 1 (more will be added!).

TeXLive 2015 or later is required to build the book.

Note: the Omake Files chapters (11 and 64) have been moved to the end of the
single-file PDF. Those chapter numbers are omitted in the text, so chapter
10 is followed by chapter 12, for example. Similarly, the chapter
disclaimers and epigraphs are removed to an appendix. In the six-volume
PDFs, all chapters are renumbered to start from 1 at the start of a book,
and there are no appendices.


## Files

* `hpmor.tex` - the main file
* `hp-format.tex` - mostly sets up memoir
* `hp-hacks.tex` - formatting commands used in the text
* `chapters/` - one file per chapter, included from `hpmor.tex` and the
  individual volumes `hpmor-N.tex`.
* `xfonts/` - various fonts used
* `Makefile` - contains commands to run LaTeX to build the PDFs.


## Building the book(s)

* `make`: Build the one-volume PDF `hpmor.pdf`
* `make all`: Build the one-volume PDF, six individual volumes
  `hpmor-N.pdf`, and dust jackets.
* `make clean`: Remove files produced by building (including PDFs).
* `make FILENAME`: Make the given file.


## Contributing

If you’d like to help, the files to edit are in chapters/. 

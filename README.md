# Harry Potter and the Methods Of Rationality

https://github.com/rjl20/hpmor  
Maintainer: Reuben Thomas <rrt@sc3d.org>

A LaTeX version of
[the popular didactic fan-fiction](http://www.hpmor.com) by Eliezer Yudkowsky, which
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
* `fonts/` - various fonts used
* `latexmkrc` - configures latexmk to run LaTeX to build the PDFs.


## Building the book(s)

* `latexmk hpmor`: Build the one-volume PDF `hpmor.pdf`
* `latexmk hpmor-N`: Build one of the six individual volumes
  `hpmor-1.pdf` to `hpmor-6.pdf`.
* `latexmk hpmor-dust-jacket-1`: produce the dust jacket for Volume 1,
  `hpmor-dust-jacket-1.pdf`. Note that this requires the corresponding volume, `hpmor-1.pdf`, to have been built first.
* `latexmk -c`: Remove files produced by building (except PDFs).
* `latexmk -C`: Remove files produced by building (including PDFs).

By default, the dust jackets assume 80gsm plain paper (this affects the thickness of the book and hence the size of the dust jacket). This can be configured in `hp-paper-type.tex`; see `papers.tex` for a list of papers.

The exact sizes of dust jackets may vary; the current parameters were taken from a commercial printer. They can be adjusted in `hp-dust-jacket.tex` as desired.


## Contributing

Contributions are most welcome. These fall into three main categories:

1. Textual corrections (where the text differs from the online original unintentionally).
2. Textual improvements: fixing straight-up errors in the English (or deeper, the sense, story etc.), or “Britfixing”, i.e. replacing non-British usages.
3. Design and typography. Improvements to both the PDF and print versions of the books are encouraged. Search the sources for “FIXME” to find known issues.

The preferred way to submit any improvement is as a GitHub pull request. Textual corrections can also be submitted as issues in the issue tracker, or by email to the maintainer.

For the GitHub URL, and email address of the maintainer, see above.

# Harry Potter and the Methods Of Rationality

https://github.com/rjl20/hpmor  
Maintainer: Reuben Thomas <rrt@sc3d.org>

A LaTeX version of
[the popular didactic fan-fiction](http://www.hpmor.com) by Eliezer Yudkowsky, which
can make a PDF ebook (one file) or printable books (either one or six
volumes; the latter option is more practical to bind). There are also dust
jackets for the printable volumes.

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
* `latexmk hpmor-dust-jacket-N`: produce the dust jacket for Volume N,
  `hpmor-dust-jacket-N.pdf`. Note that this requires the corresponding volume, `hpmor-N.pdf`, to have been built first.
* `latexmk -c`: Remove files produced by building (except PDFs).
* `latexmk -C`: Remove files produced by building (including PDFs).

By default, the dust jackets assume 80gsm plain paper (this affects the thickness of the book and hence the size of the dust jacket). This can be configured in `hp-paper-type.tex`; see `papers.tex` for a list of papers.

The exact sizes of dust jackets may vary; the current parameters were taken from a commercial printer. They can be adjusted in `hp-dust-jacket.tex` as desired.

Note that the back dust-flap is left for you to add your own text; edit `hp-dust-jacket.tex` and search for “PUT YOUR BACK DUST-FLAP TEXT HERE!”.

When producing a book with a dust jacket, you may well not want the front cover as well. To suppress the front cover, change the line at the start of the relevant TeX file (e.g., for `hpmor-1`, `hpmor-1.tex`) from:

`\RequirePackage{hp-book}`

to

`\RequirePackage[nocover]{hp-book}`


## Contributing

Contributions are most welcome. These fall into three main categories:

1. Textual corrections (where the text differs from the online original unintentionally).
2. Textual improvements: fixing straight-up errors in the English (or deeper, the sense, story etc.), or “Britfixing”, i.e. replacing non-British usages.
3. Design and typography. Improvements to both the PDF and print versions of the books are encouraged. Search the sources for “FIXME” to find known issues.

For textual changes other than simple typo or language fixes, please familiarise yourself with the style guide (below).

The preferred way to submit any improvement is as a GitHub pull request. Textual corrections can also be submitted as issues in the issue tracker, or by email to the maintainer.

For the GitHub URL, and email address of the maintainer, see above.


## Style guide

### Chapter headings

Chapters that aren’t part of a continuing series look like this:

`\chapter{The Fundamental Attribution Error}`

Chapters that are part of a continuing series look like one of these:

`\partchapter{Working in Groups}{I}`

`\namedpartchapter{Self-Actualization}{SA}{VIII}{The Sacred and the Mundane}`

The first is pretty simple; it’s just the title of the chapter
followed by which part it is.

The second looks like the title of the chapter, then the abbreviation
for the title of the chapter, then the part, then the title of the
part.


### First sentences

Normally, a chapter starts like this:

`\lettrine{P}{adma} Patil had finished`

That creates the large initial letter.

If the first paragraph of the chapter is all italics, though, it looks
like this:

    \begin{em}\lettrine{T}{he} red jet of fire took Hannah full in the
    [...]
    blazing green spirals brought down their foe’s Shield Charm.\par\end{em}


### Sections

`\section{Final Aftermath:}`


### Disclaimers and Epigraphs

These have been removed to an appendix, `hp-epigraphs.tex`.


### Miscellaneous

There are some other things relating to newspaper headlines and such;
check the chapters they appear in for the appropriate markup.


### Hacks

These are macros defined in `hp-hacks.tex`.

    \begin{writtenNote}
    \letterAddress{Dear Me,}
    
    Please play the game. You can only play the game once in a
    lifetime. This is an irreplaceable opportunity.
    
    Recognition code 927, I am a potato.
    
    \letterClosing[Yours,]{You.}
    \end{writtenNote}

`\shout{Foo}`: small caps  
`\scream{Foo}`: uppercase  
`\abbrev{FOO}`: lowercased, small caps
`\headline{Foo Bar Baz}`: centred small caps  
`\inlineheadline{Foo Bar Baz}`: small caps  
`\prophecy{foo}`: an alias for `\shout{}`  

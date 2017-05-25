# latexmk configuration to build HPMOR -*- mode: perl -*-

# Make our fonts available to TeX
$ENV{TEXFONTS} ="./fonts//:";

# Use XeLaTeX (equivalent to command-line -xelatex option)
$pdflatex = "xelatex %O %S";
$pdf_mode = 1; $postscript_mode = $dvi_mode = 0;

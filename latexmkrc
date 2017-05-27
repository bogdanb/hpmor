# latexmk configuration to build HPMOR -*- mode: perl -*-

@default_files = (
  'hpmor',
  'hpmor-1', 'hpmor-2', 'hpmor-3', 'hpmor-4', 'hpmor-5', 'hpmor-6',
  'hpmor-dust-jacket-1', 'hpmor-dust-jacket-2', 'hpmor-dust-jacket-3',
  'hpmor-dust-jacket-4', 'hpmor-dust-jacket-5', 'hpmor-dust-jacket-6',
 );

# Make our fonts available to TeX
$ENV{TEXFONTS} = './fonts//:';

# Use XeLaTeX (equivalent to command-line -xelatex option)
$pdflatex = 'xelatex %O %S';
$pdflatex = "xelatex %O \"\\PassOptionsToPackage{$options}{hp-book}\\input{%S}\"" if $options;
$pdf_mode = 1; $postscript_mode = $dvi_mode = 0;
